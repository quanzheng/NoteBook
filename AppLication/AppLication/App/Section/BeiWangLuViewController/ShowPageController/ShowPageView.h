//
//  ShowPageView.h
//  AppLication
//
//  Created by 全政 on 14-10-28.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ThingsModel;
@interface ShowPageView : UIView

@property (nonatomic, retain) UITextView *title;    // 备忘事项;
@property (nonatomic, retain) UILabel *nowDate;    // 记录日期
@property (nonatomic, retain) UIButton *naozhong;    // 提醒时间图标;
@property (nonatomic, retain) UILabel *tiXingDate;
@property (nonatomic, retain) UIButton *red;
@property (nonatomic, retain) UIButton *origain;
@property (nonatomic, retain) UIButton *blue;
@property (nonatomic, retain) UIButton *green;


@property (nonatomic, retain) ThingsModel *things;


@end
