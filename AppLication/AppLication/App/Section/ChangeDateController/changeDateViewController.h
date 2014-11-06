//
//  changeDateViewController.h
//  beiwanglu
//
//  Created by 全政 on 14-10-12.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^block)(NSDate *);

@interface changeDateViewController : UIViewController
@property (nonatomic, copy) block dateBlock;    // 使用block将时间选择器的值传给CreatNewViewVontroller

@end
