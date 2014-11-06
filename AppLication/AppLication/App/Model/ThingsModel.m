//
//  ThingsModel.m
//  AppLication
//
//  Created by 全政 on 14-10-28.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "ThingsModel.h"

@implementation ThingsModel



#pragma mark 重写
- (void)dealloc
{
    [_nowDate release];
    [_tiXingDate release];
    [_title release];
    [_color release];
    
    [super dealloc];
}
@end
