//
//  SelectBGColorView.m
//  AppLication
//
//  Created by 全政 on 14-10-24.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "SelectBGColorView.h"

@implementation SelectBGColorView

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
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(110, self.frame.origin.y+70,200, 30)];
    lable.text = @"选择便签颜色";
    lable.userInteractionEnabled = NO;
    [self addSubview:lable];
    [lable release];
    
    
    
    self.view1 = [[UIButton alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(lable.frame)+20, 120, 120)];
    _view1.backgroundColor = redColor;//[UIColor colorWithRed:0.900 green:0.379 blue:0.434 alpha:1.000];
    [self addSubview:_view1];
    [_view1 release];
    
    
    
    self.view2 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_view1.frame)+20, CGRectGetMinY(_view1.frame), 120, 120)];
    _view2.backgroundColor =origainColor; //[UIColor colorWithRed:1.000 green:0.623 blue:0.011 alpha:1.000];
    [self addSubview:_view2];
    [_view2 release];
    
    
    
    self.view3 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMinX(_view1.frame), CGRectGetMaxY(_view1.frame)+50, 120, 120)];
    _view3.backgroundColor = skyBlueColor; //[UIColor colorWithRed:0.065 green:0.885 blue:1.000 alpha:1.000];
    [self addSubview:_view3];
    [_view3 release];
    
    
    
    self.view4 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMinX(_view2.frame), CGRectGetMinY(_view3.frame), 120, 120)];
    _view4.backgroundColor = greenColor; // [UIColor colorWithRed:0.437 green:0.917 blue:0.195 alpha:1.000];
    [self addSubview:_view4];
    [_view4 release];
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
    [_view1 release]; _view1 = nil;
    [_view2 release]; _view2 = nil;
    [_view3 release]; _view3 = nil;
    [_view4 release]; _view4 = nil;
    
    
    [super dealloc];
    
}
@end
