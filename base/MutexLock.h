// @Author Lin Ya
// @Email xxbbb@vip.qq.com
#pragma once
#include <pthread.h>
#include <cstdio>
#include "noncopyable.h"


class MutexLock : noncopyable {
 public:
  MutexLock() { pthread_mutex_init(&mutex, NULL); }
  ~MutexLock() {
    pthread_mutex_lock(&mutex);
    pthread_mutex_destroy(&mutex);
  }
  void lock() { pthread_mutex_lock(&mutex); }
  void unlock() { pthread_mutex_unlock(&mutex); }
  pthread_mutex_t *get() { return &mutex; }

 private:
  pthread_mutex_t mutex;

  // 友元类不受访问权限影响
 private:
  friend class Condition;//wjl：所以Condition类可以访问MutexLock的私有成员mutex
};

//wjl：guard同样使用的是引用的方式得到mutexlock类
class MutexLockGuard : noncopyable {
 public:
  explicit MutexLockGuard(MutexLock &_mutex) : mutex(_mutex) { mutex.lock(); }
  ~MutexLockGuard() { mutex.unlock(); }

 private:
  MutexLock &mutex;
};