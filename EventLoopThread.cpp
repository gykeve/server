// @Author Lin Ya
// @Email xxbbb@vip.qq.com
#include "EventLoopThread.h"
#include <functional>

EventLoopThread::EventLoopThread()
    : loop_(NULL),
      exiting_(false),
      thread_(bind(&EventLoopThread::threadFunc, this), "EventLoopThread"),
      mutex_(),
      cond_(mutex_) {}

EventLoopThread::~EventLoopThread() {
  exiting_ = true;
  if (loop_ != NULL) {
    loop_->quit();
    thread_.join();
  }
}

//wjl：并发量大需求：互斥和等待。互斥是线程间存在共享数据，等待是线程间存在依赖。
// 条件变量是为了等待，应用该场景如消费者生产者。
//条件变量（在主线程的startLoop和eventloop线程的threadFunc中，主线程阻塞等待工作线程中创建eventloop对象
EventLoop* EventLoopThread::startLoop() {
  assert(!thread_.started());
  thread_.start();//wjl: 主线程创建了线程并start。（之后的过程就是执行用户传递的回调threadFunc())
  {
    MutexLockGuard lock(mutex_);
    // 一直等到threadFun在Thread里真正跑起来
    while (loop_ == NULL) cond_.wait();//wjl: 阻塞到这个EventLoopThread对象的loop成员确定之后再返回
  }
  return loop_;//wjl：主线程返回loop_
}

void EventLoopThread::threadFunc() {//wjl: 在sub线程中执行的函数。
  EventLoop loop;

  {
    MutexLockGuard lock(mutex_);
    loop_ = &loop;
    cond_.notify();
  }

  loop.loop();
  // assert(exiting_);
  loop_ = NULL;
}