//
//  changeDateView.m
//  beiwanglu
//
//  Created by 全政 on 14-10-12.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "changeDateView.h"

@implementation changeDateView

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
    // 设置提醒
    self.text = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 120, 30)];
    _text.text = @"设置提醒时间";
    [self addSubview:_text];
    [_text release];
    
    // 日期时间选择器初始化
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 100, 320, 216)];
    // 设置日期选择器的最小时间为系统当前时间
    NSDate *date = [NSDate dateWithTimeInterval:3*60 sinceDate:[NSDate date]];
     _datePicker.minimumDate = date;
    // 设置日期选择器的语言为中文
    _datePicker.locale = [[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] autorelease];
    [self addSubview:_datePicker];
    [_datePicker release];
    
    
    // 确定按钮
    self.sure = [UIButton buttonWithType:UIButtonTypeSystem];
    [_sure setTitle:@"确定" forState:UIControlStateNormal];
    _sure.frame = CGRectMake(50, 350, 60, 30);
    [self addSubview:_sure];
   
    
    
    // 取消按钮
    self.miss = [UIButton buttonWithType:UIButtonTypeSystem];
    [_miss setTitle:@"取消" forState:UIControlStateNormal];
    _miss.frame = CGRectMake(CGRectGetMaxX(_sure.frame)+50, CGRectGetMinY(_sure.frame), CGRectGetWidth(_sure.frame), CGRectGetHeight(_sure.frame));
    [self addSubview:_miss];
    
    
    

    
}


- (void)dealloc
{
    [_text release];
    [_datePicker release];
    [_sure release];
    [_miss release];
    
    [super dealloc];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
