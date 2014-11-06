//
//  PassWordView.m
//  beiwanglu
//
//  Created by 全政 on 14-10-21.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "PassWordView.h"

@implementation PassWordView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self loadAllViews];
    }
    return self;
}


- (void)loadAllViews
{
    // 输入密码提示
    self.passWord = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 90, 30)];
    _passWord.text = @"输入密码";
    [self addSubview:_passWord];
    [_passWord release];
    
    
    // 输入密码框
    self.inputPassWord = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_passWord.frame), CGRectGetMinY(_passWord.frame), 200, 30)];
    _inputPassWord.borderStyle = UITextBorderStyleRoundedRect;
    _inputPassWord.clearButtonMode = UITextFieldViewModeWhileEditing;
    _inputPassWord.secureTextEntry = YES;
    _inputPassWord.keyboardType = UIKeyboardTypeNumberPad;
    _inputPassWord.backgroundColor = [UIColor colorWithRed:1.000 green:0.919 blue:0.671 alpha:.5000];

    [self addSubview:_inputPassWord];
    [_inputPassWord release];
    
    
    // 确认密码提示
    self.surePassord = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_passWord.frame), CGRectGetMaxY(_passWord.frame)+10, CGRectGetWidth(_passWord.frame), CGRectGetHeight(_passWord.frame))];
    _surePassord.text = @"确认密码";
    [self addSubview:_surePassord];
    [_surePassord release];
    
    
    // 确认输入框
    self.sureInput = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(_inputPassWord.frame), CGRectGetMaxY(_inputPassWord.frame)+10, 200, 30)];
    _inputPassWord.secureTextEntry = YES;
    _sureInput.keyboardType = UIKeyboardTypeNumberPad;
    _sureInput.borderStyle = UITextBorderStyleRoundedRect;
    _sureInput.clearButtonMode = UITextFieldViewModeWhileEditing;
    _sureInput.backgroundColor = [UIColor colorWithRed:1.000 green:0.919 blue:0.671 alpha:.5000];
    _sureInput.secureTextEntry = YES;
    [self addSubview:_sureInput];
    [_sureInput release];

    
    // 密码开关
    self.sure = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_surePassord.frame), CGRectGetMaxY(_surePassord.frame)+10, 100, 30)];
    _sure.text = @"密码开关";
    [self addSubview:_sure];
    [_sure release];
    
    
    // 开关控制器
    self.select = [[UISegmentedControl alloc] init];
    [_select insertSegmentWithImage:[UIImage imageNamed:@"201410240821265_easyicon_net_16.png"] atIndex:0 animated:NO];
    [_select insertSegmentWithImage:[UIImage imageNamed:@"201410240826535_easyicon_net_12.0618846695.png"] atIndex:1 animated:NO];
    _select.tintColor = [UIColor orangeColor];
    _select.selectedSegmentIndex = 0;
    _select.frame = CGRectMake(CGRectGetMaxX(_sure.frame)+20, CGRectGetMinY(_sure.frame), 100, 30);
    [self addSubview:_select];
    [_select release];
    
    
   
    
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
    [_inputPassWord release];
    [_surePassord release];
    [_sureInput release];
   
    [_select release];
    
    [super dealloc];
    
}

@end
