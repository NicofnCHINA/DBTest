//
//  NSTimer+Addition.h
//
//  Created by niudengjun on 2018/6/7.
//  Copyright © 2018年 niudengjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Addition)
/**
 *  @brief  暂停NSTimer
 */
- (void)pauseTimer;
/**
 *  @brief  开始NSTimer
 */
- (void)resumeTimer;
/**
 *  @brief  延迟开始NSTimer
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
@end
