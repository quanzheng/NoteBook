//
//  ThingsModel.h
//  AppLication
//
//  Created by 全政 on 14-10-28.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThingsModel : NSObject

@property (nonatomic, assign) NSInteger number; // 编号
@property (nonatomic, copy) NSString *nowDate;   // 创建备忘的时间
@property (nonatomic, copy) NSString *tiXingDate;    // 提醒时间
@property (nonatomic, copy) NSString *title;     // 事件
@property (nonatomic, copy) NSString *color;    // 颜色


@end
