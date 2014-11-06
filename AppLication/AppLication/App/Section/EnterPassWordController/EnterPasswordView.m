//
//  EnterPasswordView.m
//  beiwanglu
//
//  Created by 全政 on 14-10-22.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "EnterPasswordView.h"

@implementation EnterPasswordView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews
{
    
    
    // 密码输入提示
    self.passWord = [[UILabel alloc] initWithFrame:CGRectMake(90, 100, 100, 20)];
    _passWord.text = @"请输入密码";
    _passWord.font = [UIFont systemFontOfSize:20.f];
    [self addSubview:_passWord];
    [_passWord release];
    
    self.enterPassword = [[UITextField alloc] initWithFrame:CGRectMake(self.frame.origin.x+70, CGRectGetMaxY(_passWord.frame)+20, 160,30)];
    _enterPassword.textAlignment = NSTextAlignmentCenter;
    _enterPassword.borderStyle = UITextBorderStyleRoundedRect;
    _enterPassword.keyboardType = UIKeyboardTypeNumberPad;
    _enterPassword.secureTextEntry = YES;
    [self addSubview:_enterPassword];
    [_enterPassword release];
    
    self.sure = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_sure setTitle:@"确定" forState:UIControlStateNormal];
    _sure.frame = CGRectMake(CGRectGetMinX(_enterPassword.frame)+50, CGRectGetMaxY(_enterPassword.frame)+20, 60, 30);
    _sure.titleLabel.font = [UIFont systemFontOfSize:20.f];
    [self addSubview:_sure];
    
    
    // 添加手势，轻拍收回键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tap];
    [tap release];
}



#pragma mark 轻拍收回键盘
- (void)tapAction:(UITapGestureRecognizer *)sender
{
    [self endEditing:YES];
}
- (void)dealloc
{
    [_passWord release];
    [_enterPassword release];
    [_sure release];
    
    [super dealloc];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(C
    // Drawing code
}
*/

@end
