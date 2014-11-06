//
//  DateViewController.h
//  AppLication
//
//  Created by 全政 on 14-10-29.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^blocke)(NSDate *);
@interface DateViewController : UIViewController

@property (nonatomic, retain) NSDate *nowDate;

@property (nonatomic, copy) blocke date;    // 传新时间

@end
