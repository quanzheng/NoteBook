//
//  ShowPageViewController.h
//  AppLication
//
//  Created by 全政 on 14-10-28.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ThingsModel;
@class DateViewController;
@interface ShowPageViewController : UIViewController


@property (nonatomic, assign) NSInteger row;    // 行号

@property (nonatomic, retain) UILabel *date;    // 日期
@property (nonatomic, retain) UILabel *time;    // 创建日期

@property (nonatomic, retain)DateViewController *dateVC;


@property (nonatomic, retain) ThingsModel *things;



@property (nonatomic, retain) NSDate *dateee;
@end
