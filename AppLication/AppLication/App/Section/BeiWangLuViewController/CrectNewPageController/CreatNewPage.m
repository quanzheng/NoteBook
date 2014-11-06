//
//  CreatNewPage.m
//  AppLication
//
//  Created by 全政 on 14-10-24.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "CreatNewPage.h"

@implementation CreatNewPage

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
    // 时间
    self.time = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, 50, 50)];
    _time.text = @"  时间";
    [self addSubview:_time];
    [_time release];
    
    // 时间输入框
    self.timeText = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_time.frame), CGRectGetMinY(_time.frame), 200, 50)];
    _timeText.textAlignment = NSTextAlignmentCenter;
    _timeText.userInteractionEnabled = NO;
    _timeText.placeholder = @"点击闹钟选择提醒时间";
    [self addSubview:_timeText];
    [_timeText release];
    
    // 日期选择器按钮
    self.changeDate = [UIButton buttonWithType:UIButtonTypeSystem];
    [_changeDate setTitle:nil forState:UIControlStateNormal];
    _changeDate.frame = CGRectMake(CGRectGetMaxX(_timeText.frame), CGRectGetMinY(_timeText.frame), 80, 50);
    [_changeDate setImage:[UIImage imageNamed:@"naozhong.png"] forState:UIControlStateNormal];
    _changeDate.tintColor = [UIColor blueColor];
    [self addSubview:_changeDate];
    
    
//    // 添加手势，轻拍收回键盘
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//    [self addGestureRecognizer:tap];
//    [tap release];
    
    
    
//    // 标题
//    self.title = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_time.frame),CGRectGetMaxY(_time.frame),320,30)];
//    _title.text = @"  标题";
//    
//    [self addSubview:_title];
//    [_title release];
    
    // 标题输入框
    self.titleField = [[UITextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_time.frame), 320, self.frame.size.height-50-64)];
    // 字体大小
    [_titleField setFont:[UIFont systemFontOfSize:20.f]];
    //设置textView圆角
    [_titleField.layer setCornerRadius:10];
    [self addSubview:_titleField];
    [_titleField release];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{

    [_title release];
    [_titleField release];
    [_time release];
    [_timeText release];
    [_changeDate release];
    
    [super dealloc];
    
}

@end
