//
//  EnterPasswordView.h
//  beiwanglu
//
//  Created by 全政 on 14-10-22.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterPasswordView : UIView

@property (nonatomic, retain) UILabel *passWord;    // 密码输入提示
@property (nonatomic, retain) UITextField *enterPassword;  // 密码输入框
@property (nonatomic, retain) UIButton *sure;   // 确定按钮

@end
