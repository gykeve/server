// @Author Lin Ya
// @Email xxbbb@vip.qq.com
#pragma once
#include <errno.h>
#include <pthread.h>
#include <pthread.h>
#include <time.h>
#include <cstdint>
#include "MutexLock.h"
#include "noncopyable.h"

/*wjl
 * 条件变量signal一般用于资源可用，broadcast表示状态发生变化
 *
 * 这里组合了mutex，使用引用方式！（没有用指针的形式）
 */
class Condition : noncopyable {
 public:
  explicit Condition(MutexLock &_mutex) : mutex(_mutex) {
    pthread_cond_init(&cond, NULL);
  }
  ~Condition() { pthread_cond_destroy(&cond); }
  void wait() { pthread_cond_wait(&cond, mutex.get()); }//wjl：get方法返回mutex内部的私有成员mutex
  void notify() { pthread_cond_signal(&cond); }//signal
  void notifyAll() { pthread_cond_broadcast(&cond); }//broadcast
  bool waitForSeconds(int seconds) {
    struct timespec abstime;
    clock_gettime(CLOCK_REALTIME, &abstime);
    abstime.tv_sec += static_cast<time_t>(seconds);
    return ETIMEDOUT == pthread_cond_timedwait(&cond, mutex.get(), &abstime);
  }

 private:
  MutexLock &mutex;
  pthread_cond_t cond;
};