// @Author Lin Ya
// @Email xxbbb@vip.qq.com
#include "Util.h"

#include <errno.h>
#include <fcntl.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <signal.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>


const int MAX_BUFF = 4096;
ssize_t readn(int fd, void *buff, size_t n) {
  size_t nleft = n;
  ssize_t nread = 0;
  ssize_t readSum = 0;
  char *ptr = (char *)buff;
  while (nleft > 0) {
    if ((nread = read(fd, ptr, nleft)) < 0) {
      if (errno == EINTR)
        nread = 0;
      else if (errno == EAGAIN) {
        return readSum;
      } else {
        return -1;
      }
    } else if (nread == 0)
      break;
    readSum += nread;
    nleft -= nread;
    ptr += nread;
  }
  return readSum;
}

ssize_t readn(int fd, std::string &inBuffer, bool &zero) {
  ssize_t nread = 0;
  ssize_t readSum = 0;
  while (true) {
    char buff[MAX_BUFF];
    if ((nread = read(fd, buff, MAX_BUFF)) < 0) {
      if (errno == EINTR)
        continue;
      else if (errno == EAGAIN) {
        return readSum;
      } else {
        perror("read error");
        return -1;
      }
    } else if (nread == 0) {
      // printf("redsum = %d\n", readSum);
      zero = true;
      break;
    }
    // printf("before inBuffer.size() = %d\n", inBuffer.size());
    // printf("nread = %d\n", nread);
    readSum += nread;
    // buff += nread;
    inBuffer += std::string(buff, buff + nread);
    // printf("after inBuffer.size() = %d\n", inBuffer.size());
  }
  return readSum;
}

ssize_t readn(int fd, std::string &inBuffer) {
  ssize_t nread = 0;
  ssize_t readSum = 0;
  while (true) {
    char buff[MAX_BUFF];
    if ((nread = read(fd, buff, MAX_BUFF)) < 0) {
      if (errno == EINTR)
        continue;
      else if (errno == EAGAIN) {
        return readSum;
      } else {
        perror("read error");
        return -1;
      }
    } else if (nread == 0) {
      // printf("redsum = %d\n", readSum);
      break;
    }
    // printf("before inBuffer.size() = %d\n", inBuffer.size());
    // printf("nread = %d\n", nread);
    readSum += nread;
    // buff += nread;
    inBuffer += std::string(buff, buff + nread);
    // printf("after inBuffer.size() = %d\n", inBuffer.size());
  }
  return readSum;
}

ssize_t writen(int fd, void *buff, size_t n) {
  size_t nleft = n;
  ssize_t nwritten = 0;
  ssize_t writeSum = 0;
  char *ptr = (char *)buff;
  while (nleft > 0) {
    if ((nwritten = write(fd, ptr, nleft)) <= 0) {
      if (nwritten < 0) {
        if (errno == EINTR) {
          nwritten = 0;
          continue;
        } else if (errno == EAGAIN) {
          return writeSum;
        } else
          return -1;
      }
    }
    writeSum += nwritten;
    nleft -= nwritten;
    ptr += nwritten;
  }
  return writeSum;
}

ssize_t writen(int fd, std::string &sbuff) {
  size_t nleft = sbuff.size();
  ssize_t nwritten = 0;
  ssize_t writeSum = 0;
  const char *ptr = sbuff.c_str();
  while (nleft > 0) {
    if ((nwritten = write(fd, ptr, nleft)) <= 0) {
      if (nwritten < 0) {
        if (errno == EINTR) {
          nwritten = 0;
          continue;
        } else if (errno == EAGAIN)
          break;
        else
          return -1;
      }
    }
    writeSum += nwritten;
    nleft -= nwritten;
    ptr += nwritten;
  }
  if (writeSum == static_cast<int>(sbuff.size()))
    sbuff.clear();
  else
    sbuff = sbuff.substr(writeSum);
  return writeSum;
}

void handle_for_sigpipe() {
  struct sigaction sa;
  memset(&sa, '\0', sizeof(sa));
  sa.sa_handler = SIG_IGN;
  sa.sa_flags = 0;
  if (sigaction(SIGPIPE, &sa, NULL)) return;
}

int setSocketNonBlocking(int fd) {
  int flag = fcntl(fd, F_GETFL, 0);
  if (flag == -1) return -1;

  flag |= O_NONBLOCK;
  if (fcntl(fd, F_SETFL, flag) == -1) return -1;
  return 0;
}

//nodelay禁用nagle算法，允许小包发送
void setSocketNodelay(int fd) {
  int enable = 1;
  setsockopt(fd, IPPROTO_TCP, TCP_NODELAY, (void *)&enable, sizeof(enable));
}

//设置函数关闭tcp连接的行为（缺省：如果有数据残留在socket发送缓冲区，则将继续发送数据给对方，等待确认再返回
//
void setSocketNoLinger(int fd) {
  struct linger linger_;
  linger_.l_onoff = 1;//wjl: 0关闭，l_linger被忽略；非0，l_linger=0则立即关闭连接
  linger_.l_linger = 30;//l_onoff!=0&&l_linger!=0:将连接的关闭设置一个超时，如果发送缓冲区仍有数据，进程进入睡眠，内核进入定时状态
  setsockopt(fd, SOL_SOCKET, SO_LINGER, (const char *)&linger_,
             sizeof(linger_));
}

void shutDownWR(int fd) {
  shutdown(fd, SHUT_WR);
  // printf("shutdown\n");
}


//wjl:由于是本机，只需要port
int socket_bind_listen(int port) {
  // 检查port值，取正确区间范围
  if (port < 0 || port > 65535) return -1;

  // 创建socket(IPv4 + TCP)，返回监听描述符
  int listen_fd = 0;
  if ((listen_fd = socket(AF_INET, SOCK_STREAM, 0)) == -1) return -1;

  //wjl：例如关闭服务器后又重启服务器，由于是主动关闭进入time_wait阶段。需要花费一些时间才能重新启用
          //设置套接字可以立即重启
  // 消除bind时"Address already in use"错误
  int optval = 1;
  if (setsockopt(listen_fd, SOL_SOCKET, SO_REUSEADDR, &optval,
                 sizeof(optval)) == -1) {
    close(listen_fd);
    return -1;
  }

  // 设置服务器IP和Port，和监听描述副绑定
  struct sockaddr_in server_addr;
  bzero((char *)&server_addr, sizeof(server_addr));
  server_addr.sin_family = AF_INET;
  //wjl: INADDR_ANY转换过来即0.0.0.0表示本机。（只要是从指定端口来的数据不管是从从那个网卡都可以接收到）
          //wjl：127.0.0.1为本机的环回地址，0.0.0.0表示本机任何地址
                  //localhost域名，可以代表任何ip地址，默认是127.0.0.1在/etc/hosts文件中
  server_addr.sin_addr.s_addr = htonl(INADDR_ANY);//wjl：设置服务器的ip。使得服务器计算机所有网卡的ip地址都可以作为服务器的ip地址，即监听外部客户端发送到服务器端所有网卡的网络请求
  server_addr.sin_port = htons((unsigned short)port);
  if (bind(listen_fd, (struct sockaddr *)&server_addr, sizeof(server_addr)) ==
      -1) {
    close(listen_fd);
    return -1;
  }

  //backlog的队列数确定：没有来得及accept，可以接受多少进来的连接。大多数系统设定为2048。syn队列
    //注意accept队列默认取/proc/sys/net/core/somaxconn 和listen的syn队列的参数的最小值，默认128
  // 开始监听，最大等待队列长为LISTENQ
  if (listen(listen_fd, 2048) == -1) {
    close(listen_fd);
    return -1;
  }

  // 无效监听描述符
  if (listen_fd == -1) {
    close(listen_fd);
    return -1;
  }
  return listen_fd;
}