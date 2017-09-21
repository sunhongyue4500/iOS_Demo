//
//  ViewController.m
//  LockDemo
//
//  Created by Sunhy on 2017/9/20.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h>
#import <os/lock.h>
#import "pthread.h"

@interface ViewController ()

@property (nonatomic, strong) NSRecursiveLock *lock;
@property (nonatomic, strong) NSConditionLock *lock2;
@property (nonatomic, strong) NSCondition *myCondition;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self test2];
    //[self test1];
    //[self test12];
    //[self test3];
    //[self test4];
    //[self test5];
    [self test62];
//    [self test61];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - **************** OSSpinLock
- (void)test1 {
    OSSpinLock spinLock = OS_SPINLOCK_INIT;
    NSLog(@"加锁前:%zd", spinLock);
    OSSpinLockLock(&spinLock);
    NSLog(@"加锁后:%zd", spinLock);
    OSSpinLockUnlock(&spinLock);
    NSLog(@"解锁后:%zd", spinLock);
}


/** but instead waits in the kernel to be awoken by an unlock.*/
#pragma mark - **************** os_unfair_lock
- (void)test12 {
    // 初始化
    os_unfair_lock_t unfairLock = &(OS_UNFAIR_LOCK_INIT);
    // 加锁
    os_unfair_lock_lock(unfairLock);
    // 解锁
    os_unfair_lock_unlock(unfairLock);
    // 尝试加锁
    BOOL b = os_unfair_lock_trylock(unfairLock);
    NSLog(@"%d", b);
}

/** 信号量*/
#pragma mark - **************** dispatch_semaphore
- (void)test2 {
    dispatch_semaphore_t signal = dispatch_semaphore_create(1);
    dispatch_time_t timeout = dispatch_time(DISPATCH_TIME_NOW, 5.0f * NSEC_PER_SEC);
    
    //线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"线程1 holding");
        dispatch_semaphore_wait(signal, timeout); //signal 值 -1
        NSLog(@"线程1 sleep");
        sleep(4);
        NSLog(@"线程1");
        dispatch_semaphore_signal(signal); //signal 值 +1
        NSLog(@"线程1 post singal");
    });
    
    //线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"线程2 holding");
        dispatch_semaphore_wait(signal, timeout);
        NSLog(@"线程2 sleep");
        sleep(4);
        NSLog(@"线程2");
        dispatch_semaphore_signal(signal);
        NSLog(@"线程2 post signal");
    });
}

#pragma mark - **************** pthread互斥锁
- (void)test3 {
    static pthread_mutex_t pLock;
    pthread_mutex_init(&pLock, NULL);
    
    //1.线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSLog(@"线程2 before lock");
        pthread_mutex_lock(&pLock);
        NSLog(@"线程2");
        pthread_mutex_unlock(&pLock);
    });
    
    //2.线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"线程1 before lock");
        pthread_mutex_lock(&pLock);
        sleep(3);
        NSLog(@"线程1");
        pthread_mutex_unlock(&pLock);
    });
}

#pragma mark - **************** pthread 递归锁
- (void)test4 {
    static pthread_mutex_t pLock;
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr); //初始化attr赋初值
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE); //设置锁类型为递归锁
    pthread_mutex_init(&pLock, &attr);
    pthread_mutexattr_destroy(&attr);
    
    //1.线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        static void (^RecursiveBlock)(int);
        RecursiveBlock = ^(int value) {
            pthread_mutex_lock(&pLock);
            if (value > 0) {
                NSLog(@"value: %d", value);
                RecursiveBlock(value - 1);
            }
            pthread_mutex_unlock(&pLock);       // 加锁与解锁成对
            NSLog(@"线程1 unlock");
            
        };
        NSLog(@"线程1 before recursive lock");
        RecursiveBlock(5);
        NSLog(@"线程1");
        //pthread_mutex_unlock(&pLock);
        
    });
    
    //2.线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"线程2 before lock");
        pthread_mutex_lock(&pLock);
        NSLog(@"线程2");
        pthread_mutex_unlock(&pLock);
        NSLog(@"线程2 unlock");
    });
}


/** NSRecursiveLock*/
#pragma mark - **************** NSRecursiveLock
- (void)test5 {
    static int i = 10;
    if (!_lock) _lock = [[NSRecursiveLock alloc] init];
    [_lock lock];
    NSLog(@"NSRecursiveLock--%zd", i--);
    if (i >= 0) {
        [self test5];
    }
    [_lock unlock];
}

#pragma mark - **************** NSConditioin
- (void)test62 {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self method1];
    });

    //2.线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self method2];
    });
}

BOOL someCheckIsTrue = NO;
- (void) method1 {
    
    [_myCondition lock];
    while (!someCheckIsTrue)
        [_myCondition wait];
    
    // Do something.
    NSLog(@"消费者");
    
    [_myCondition unlock];
}

- (void) method2 {
    
    [_myCondition lock];
    
    // Do something.
    NSLog(@"生产者");

    someCheckIsTrue = YES;
    [_myCondition signal];
    [_myCondition unlock];
}

#pragma mark - **************** NSConditionLock
// 线程2 > 线程1 > 线程3 的顺序执行。
- (void)test61 {
    NSConditionLock *cLock = [[NSConditionLock alloc] initWithCondition:0];
    
    // 线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"线程1 加锁");
        [cLock lockWhenCondition:1];
        NSLog(@"线程1");
        [cLock unlockWithCondition:3];
        NSLog(@"线程1 解锁");
    });
    
    // 线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSLog(@"线程2 加锁");
        if ([cLock tryLockWhenCondition:0]) {
            NSLog(@"线程2");
            [cLock unlockWithCondition:1];
            NSLog(@"线程2 解锁");
        } else {
            NSLog(@"失败");
        }
    });
    
    // 线程3
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSLog(@"线程3 加锁");
        [cLock lockWhenCondition:3];
        NSLog(@"线程3");
        [cLock unlockWithCondition:2];
        NSLog(@"线程3 解锁");
    });
}


@end
