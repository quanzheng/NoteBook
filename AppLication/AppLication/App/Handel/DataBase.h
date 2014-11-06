//
//  DataBase.h
//  AppLication
//
//  Created by 全政 on 14-10-28.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ThingsModel;
@interface DataBase : NSObject

#pragma mark 创建数据库单例
+(instancetype)shareInstance;


#pragma mark 打开数据库
- (void)openDB;

#pragma mark 关闭数据库
- (void)closeDB;

#pragma mark 插入一条备忘信息
- (void)insertThings:(ThingsModel *)things;

#pragma mark 改备忘信息
- (void)updateThings:(ThingsModel * )things;

#pragma mark 查询所有备忘
- (NSArray *)selectAllThings;

#pragma mark 删除某个备忘
- (void)deleteThings:(ThingsModel * )row;
@end
