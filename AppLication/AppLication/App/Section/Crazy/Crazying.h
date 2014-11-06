//
//  Crazying.h
//  AppLication
//
//  Created by 全政 on 14-10-30.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ThingsModel;
@interface Crazying : NSObject

+ (Crazying *)shareInstance;



#pragma mark 根据传过来的模型设定本地通知
- (void)setLocalNotification:(ThingsModel *)thing;


@end
