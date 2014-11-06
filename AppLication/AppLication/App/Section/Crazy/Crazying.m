//
//  Crazying.m
//  AppLication
//
//  Created by 全政 on 14-10-30.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "Crazying.h"
#import "ThingsModel.h"

@implementation Crazying

static Crazying *crazy = nil;
+ (Crazying *)shareInstance
{
    if (crazy == nil) {
        return [[[[self class] alloc]init] autorelease];
    }
    return crazy;
}



#pragma mark 根据传过来的模型设定本地通知
- (void)setLocalNotification:(ThingsModel *)thing
{
    UILocalNotification *local = [[UILocalNotification alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日HH时mm分"];
    // 在设置转换对象时，需要指定时区，否则时美国时区
//    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    local.timeZone = NSTimeZoneNameStyleStandard;
    NSDate *time = [dateFormatter dateFromString:thing.tiXingDate];
    
    local.fireDate = time;  // 触发时间
//    local.timeZone = [NSTimeZone localTimeZone];  // 时区
//    local.alertAction = thing.tiXingDate;   // 提醒文字
    local.alertBody = thing.title;
    local.soundName = @"吉他扫弦.caf";  // 提醒声音
    local.applicationIconBadgeNumber++;
    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:thing.title forKey:@"time"];
    local.userInfo = dic;
    
    // 注册提醒
    if ([local.fireDate laterDate:[NSDate date]]) {
        [[UIApplication sharedApplication] scheduleLocalNotification:local];
        [local release];

    } 
    
    

}

@end
