//
//  PassWordView.h
//  beiwanglu
//
//  Created by 全政 on 14-10-21.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PassWordView : UIView
@property (nonatomic, retain) UILabel*passWord;    // 密码
@property (nonatomic, retain) UITextField *inputPassWord;   // 输入密码
@property (nonatomic, retain) UILabel *surePassord; // 确认密码
@property (nonatomic, retain) UITextField *sureInput;   // 确认输入
@property (nonatomic, retain) UILabel *sure;    // 启用密码
@property (nonatomic, retain) UISegmentedControl *select; // 选择


@end
