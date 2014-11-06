//
//  ListHandel.h
//  AppLication
//
//  Created by 全政 on 14-10-28.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ThingsModel;

@interface ListHandel : NSObject

+ (ListHandel *)shareInstance;


#pragma mark 从数据库读取数据
- (void)setupThingsDataSource;
#pragma mark 获取备忘事件的个数
- (NSInteger)countOfThings;
#pragma mark 获取某个备忘
- (ThingsModel *)thingsForRow:(NSInteger)row;
#pragma mark 删除某个备忘
- (void)deleatThingsForRow:(NSInteger)row;
#pragma mark 修改某个备忘
- (void)updateThings:(ThingsModel * )thing;


@end
