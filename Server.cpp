// @Author Lin Ya
// @Email xxbbb@vip.qq.com
#include "Server.h"
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <functional>
#include "Util.h"
#include "base/Logging.h"

/*wjl：补充关闭sockfd的方式
 * 当对端调用close时, 虽然本意是关闭整个两条信道, 但本端只是收到FIN包. （close）
 * 按照TCP协议的语义, 表示对端只是关闭了其所负责的那一条单工信道, 仍然可以继续接收数据. （shutdown写端）
 * 也就是说, 因为TCP协议的限制, 一个端点无法获知对端的socket是调用了close还是shutdown.
 * 场景：
 * 对一个已经收到FIN包的socket（服务器端）调用read方法, 如果接收缓冲已空, 则返回0, 这就是常说的表示连接关闭.
 * 但第一次对其调用write方法时, 如果发送缓冲没问题, 会返回正确写入(发送). （因为对方可能只是shutdown，服务器应该要尝试着将数据发完）
 * //（但是如果对方client是close，则会发送rst报文给server）
 * 但发送的报文会导致对端发送RST报文, 因为对端的socket已经调用了close, 完全关闭, 既不发送, 也不接收数据.
 * //（此时server若还有数据没有发完，会继续发数据给对方）
 * 所以, 第二次调用write方法(假设在收到RST之后), 会生成SIGPIPE信号, 导致进程退出.
 */
Server::Server(EventLoop *loop, int threadNum, int port)
    : loop_(loop),
      threadNum_(threadNum),
      eventLoopThreadPool_(new EventLoopThreadPool(loop_, threadNum)),
      started_(false),
      acceptChannel_(new Channel(loop_)),
      port_(port),
      listenFd_(socket_bind_listen(port_)) {
  acceptChannel_->setFd(listenFd_);
  handle_for_sigpipe();//wjl:对方close后再向它发送数据，会收到rst响应。此时若还继续发送数据就触发sigpipe
  if (setSocketNonBlocking(listenFd_) < 0) {
    perror("set socket non block failed");
    abort();
  }
}

void Server::start() {
  eventLoopThreadPool_->start();
  // acceptChannel_->setEvents(EPOLLIN | EPOLLET | EPOLLONESHOT);
  acceptChannel_->setEvents(EPOLLIN | EPOLLET);
  acceptChannel_->setReadHandler(bind(&Server::handNewConn, this));
  acceptChannel_->setConnHandler(bind(&Server::handThisConn, this));
  loop_->addToPoller(acceptChannel_, 0);
  started_ = true;
}

void Server::handNewConn() {
  struct sockaddr_in client_addr;
  memset(&client_addr, 0, sizeof(struct sockaddr_in));
  socklen_t client_addr_len = sizeof(client_addr);
  int accept_fd = 0;
  while ((accept_fd = accept(listenFd_, (struct sockaddr *)&client_addr,
                             &client_addr_len)) > 0) {
    EventLoop *loop = eventLoopThreadPool_->getNextLoop();
    LOG << "New connection from " << inet_ntoa(client_addr.sin_addr) << ":"
        << ntohs(client_addr.sin_port);
    // cout << "new connection" << endl;
    // cout << inet_ntoa(client_addr.sin_addr) << endl;
    // cout << ntohs(client_addr.sin_port) << endl;
    /*
    // TCP的保活机制默认是关闭的
    int optval = 0;
    socklen_t len_optval = 4;
    getsockopt(accept_fd, SOL_SOCKET,  SO_KEEPALIVE, &optval, &len_optval);
    cout << "optval ==" << optval << endl;
    */
    // 限制服务器的最大并发连接数
    if (accept_fd >= MAXFDS) {
      close(accept_fd);
      continue;
    }
    // 设为非阻塞模式
    if (setSocketNonBlocking(accept_fd) < 0) {
      LOG << "Set non block failed!";
      // perror("Set non block failed!");
      return;
    }

    setSocketNodelay(accept_fd);//wjl:关闭nagle算法
    // setSocketNoLinger(accept_fd);

      /*wjl：处理逻辑：
       * 生成相应的httpdata对象（包含channel指针）并绑定channel和httpdata对象
       * 给线程池中的事件循环添加任务
       */
    shared_ptr<HttpData> req_info(new HttpData(loop, accept_fd));
    req_info->getChannel()->setHolder(req_info);
    loop->queueInLoop(std::bind(&HttpData::newEvent, req_info));//wjl:给loop事件循环分配任务！！！
  }
  acceptChannel_->setEvents(EPOLLIN | EPOLLET);
}