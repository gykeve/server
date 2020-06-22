// @Author Lin Ya
// @Email xxbbb@vip.qq.com
#pragma once
#include "EventLoop.h"
#include "base/Condition.h"
#include "base/MutexLock.h"
#include "base/Thread.h"
#include "base/noncopyable.h"


class EventLoopThread : noncopyable {
 public:
  EventLoopThread();
  ~EventLoopThread();
  EventLoop* startLoop();

 private:
  void threadFunc();
  EventLoop* loop_;
  bool exiting_;
  Thread thread_;//wjl：组合Thread对象，调用start方法
  MutexLock mutex_;
  Condition cond_;
};