// @Author Lin Ya
// @Email xxbbb@vip.qq.com
#include "Thread.h"
#include <assert.h>
#include <errno.h>
// #include <linux/unistd.h>
#include <stdint.h>
#include <stdio.h>
#include <sys/prctl.h>
#include <sys/types.h>
#include <unistd.h>
#include <memory>
#include "CurrentThread.h"

/*wjl
 * 1）countdown（线程通信）
 * CountDownLatch能够使一个线程在等待另外一些线程完成各自工作之后，再继续执行。使用一个计数器进行实现。
 *countdownlatch用在线程池里（初始值为1）：保证线程池中的线程都start了线程池对象才完成析够（一个坑）
 *
 * 2）__thread关键字
 *
 */

#include <iostream>
using namespace std;

namespace CurrentThread {
__thread int t_cachedTid = 0;
__thread char t_tidString[32];//记录tid
__thread int t_tidStringLength = 6;
__thread const char* t_threadName = "default";//记录线程类型
}

//linux没有gettid函数。可以通过系统调用syscall(SYS_gettid)来生成任务之间唯一的tid（类比于pid）
pid_t gettid() { return static_cast<pid_t>(::syscall(SYS_gettid)); }

/*wjl
 * 中间变量__thread t_cachedTid的作用是由于是线程安全
 * （每一个线程使用__thread变量都不会影响其他的线程的__thread变量）
 * 所以每个线程刚使用__thread来缓存gettid的返回值
 * 这样线程只有第一次调用的时候会进行系统调用，以后都是直接从thread local缓存的线程tid拿结果
 */
void CurrentThread::cacheTid() {
  if (t_cachedTid == 0) {
    t_cachedTid = gettid();//wjl：生成pid_t变量
    t_tidStringLength =
        snprintf(t_tidString, sizeof t_tidString, "%5d ", t_cachedTid);
  }
}

// 为了在线程中保留name,tid这些数据
struct ThreadData {
  typedef Thread::ThreadFunc ThreadFunc;
  ThreadFunc func_;
  string name_;
  pid_t* tid_;
  CountDownLatch* latch_;

  ThreadData(const ThreadFunc& func, const string& name, pid_t* tid,
             CountDownLatch* latch)
      : func_(func), name_(name), tid_(tid), latch_(latch) {}

  void runInThread() {
    *tid_ = CurrentThread::tid();//这个create的线程已经run起来，在这里调用CurrentThread::tid就是属于这个线程的变量了
    tid_ = NULL;
    latch_->countDown();//wjl：在这里可以确定已经开始制造了一个线程执行（线程start了），countdown让主线程（线程池所在线程）继续
    latch_ = NULL;

    CurrentThread::t_threadName = name_.empty() ? "Thread" : name_.c_str();
    prctl(PR_SET_NAME, CurrentThread::t_threadName);//wjl: 系统调用，设置线程名（这里刚好和t_cachedTid过程相反，是用户给内核线程传数据/名字）

    func_();//wjl：生成的线程执行回调
    CurrentThread::t_threadName = "finished";
  }
};

void* startThread(void* obj) {
  ThreadData* data = static_cast<ThreadData*>(obj);
  data->runInThread();//wjl：线程开始执行回调
  delete data;
  return NULL;
}

Thread::Thread(const ThreadFunc& func, const string& n)
    : started_(false),
      joined_(false),
      pthreadId_(0),
      tid_(0),
      func_(func),
      name_(n),
      latch_(1) {
  setDefaultName();
}

Thread::~Thread() {
  if (started_ && !joined_) pthread_detach(pthreadId_);
}

void Thread::setDefaultName() {
  if (name_.empty()) {
    char buf[32];
    snprintf(buf, sizeof buf, "Thread");
    name_ = buf;
  }
}

void Thread::start() {
  assert(!started_);
  started_ = true;
  ThreadData* data = new ThreadData(func_, name_, &tid_, &latch_);
  if (pthread_create(&pthreadId_, NULL, &startThread, data)) {
    started_ = false;
    delete data;
  } else {
    latch_.wait();
    assert(tid_ > 0);
  }
}

//wjl：提供join方式结束线程
//或者如果忘记join，则需要在析构函数中detach
int Thread::join() {
  assert(started_);
  assert(!joined_);
  joined_ = true;
  return pthread_join(pthreadId_, NULL);
}