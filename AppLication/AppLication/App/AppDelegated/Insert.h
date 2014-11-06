//
//  Insert.h
//  AppLication
//
//  Created by 全政 on 14-10-30.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThingsModel.h"
@class Insert;
@interface Insert : NSObject

+(Insert *)shareInstance;



#pragma mark 插入一条备忘信息
- (void)insertThings;
@end
