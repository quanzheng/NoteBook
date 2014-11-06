//
//  ShowPageView.m
//  AppLication
//
//  Created by 全政 on 14-10-28.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "ShowPageView.h"

@implementation ShowPageView

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
    self.title = [[UITextView alloc] initWithFrame:CGRectMake(0, 65, self.frame.size.width, self.frame.size.height/2)];
    [_title.layer setCornerRadius:15.f];
    _title.font = [UIFont systemFontOfSize:15.f];
    [self addSubview:_title];
    [_title release];
    
    
    
    
    // 提醒图标
    self.naozhong = [UIButton buttonWithType:UIButtonTypeSystem]; // [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_title.frame)+20, CGRectGetMaxY(_title.frame)+20, 24, 24)];
    _naozhong.frame = CGRectMake(CGRectGetMinX(_title.frame)+20, CGRectGetMaxY(_title.frame)+20, 25, 25);
    
    [_naozhong setImage:[UIImage imageNamed:@"lingdang.png"] forState:UIControlStateNormal];
    [self addSubview:_naozhong];
    
    
    // 时间提醒框
    self.tiXingDate = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_naozhong.frame)+10, CGRectGetMinY(_naozhong.frame), 250, 30)];
    _tiXingDate.font = [UIFont systemFontOfSize:20.f];
    [self addSubview:_tiXingDate];
    [_tiXingDate release];
    
    // 四个颜色按钮
    self.red = [UIButton buttonWithType:UIButtonTypeSystem];
    _red.backgroundColor = redColor;
    _red.frame = CGRectMake(CGRectGetMinX(_naozhong.frame)+10, CGRectGetMaxY(_naozhong.frame)+40, 50, 50);
    [self addSubview:_red];
    
    self.origain = [UIButton buttonWithType:UIButtonTypeSystem];
    _origain.backgroundColor = origainColor;
    _origain.frame = CGRectMake(CGRectGetMaxX(_red.frame)+20, CGRectGetMinY(_red.frame), 50, 50);
    [self addSubview:_origain];
    
    self.blue = [UIButton buttonWithType:UIButtonTypeSystem];
    _blue.backgroundColor = skyBlueColor;
    _blue.frame = CGRectMake(CGRectGetMaxX(_origain.frame)+20, CGRectGetMinY(_origain.frame), 50, 50);
    [self addSubview:_blue];
    
    self.green = [UIButton buttonWithType:UIButtonTypeSystem];
    _green.backgroundColor = greenColor;
    _green.frame = CGRectMake(CGRectGetMaxX(_blue.frame)+20, CGRectGetMinY(_blue.frame), 50, 50);
    [self addSubview:_green];
    
    
    
    
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
    [_nowDate release];
    [_naozhong release];
    [_red release];
    [_origain release];
    [_blue release];
    [_green release];
    
    [super dealloc];
}

@end
