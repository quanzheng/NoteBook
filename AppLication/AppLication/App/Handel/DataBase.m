//
//  DataBase.m
//  AppLication
//
//  Created by 全政 on 14-10-28.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "DataBase.h"
#import <sqlite3.h>
#import "ThingsModel.h"
@implementation DataBase

static DataBase *dataBase = nil;
#pragma mark 实现数据库创建的单例
+ (instancetype)shareInstance
{
    if (dataBase == nil) {
        dataBase = [[[self class] alloc] init];
    }
    return dataBase;
}



// 声明数据库对象
static sqlite3 *db = nil;
#pragma mark 打开数据库
- (void)openDB
{
    if (nil != db) {
        
        return;
    }
    // 数据库没有打开，打开数据库
    NSString *dbPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent: @"Things.sqlite"];
   
    // 根据路径打开数据库
    int result = sqlite3_open(dbPath.UTF8String, &db);
    // 判断是否打开成功
    if (result == SQLITE_OK) {
        // 准备创建数据表的SQL语句
        NSString *creatTableSql = @"CREATE TABLE IF NOT EXISTS Thing(number INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, nowDate TEXT NOT NULL ,tiXingDate TEXT NOT NULL,title TEXT,color TEXT )";
        // 执行语句
        char *error = nil;
        int result = sqlite3_exec(db, creatTableSql.UTF8String, NULL, NULL, &error);
        // 判断执行是否成功
        if (result == SQLITE_OK) {
          
        } else {
          
        }
    } else {
       
    }
}


#pragma mark 关闭数据库
- (void)closeDB
{
    // 关闭数据库
    int result = sqlite3_close(db);
    // 判断是否关闭成功
    if (result == SQLITE_OK) {
       
        // 关闭成功后，把数据库对象置为nil
        db = nil;
    } else {
       
    }
}


#pragma mark 实现插入一条备忘
- (void)insertThings:(ThingsModel *)things
{
    // 打开数据库
    [self openDB];
    // 准备插入语句
    NSString *insertSql = [NSString stringWithFormat: @"INSERT INTO Thing(nowDate,tiXingDate,title,color) values('%@','%@','%@','%@')", things.nowDate, things.tiXingDate, things.title, things.color];
    // 执行插入语句
    char *error = nil;
    int resutl = sqlite3_exec(db, insertSql.UTF8String, NULL, NULL, &error);
    // 判断是否执行成功
    if (resutl == SQLITE_OK) {
       
    } else {
       
    }
    
    // 关闭数据库
    [self closeDB];
    
}


#pragma mark 修改备忘信息
- (void)updateThings:(ThingsModel *)things
{
    // 打开数据库
    [self openDB];
    // 拼接字符串
    NSString *updateSql = [NSString stringWithFormat:@"UPDATE Thing set tiXingDate = '%@', title = '%@',nowDate = '%@',color = '%@' WHERE number = '%ld'",things.tiXingDate, things.title, things.nowDate, things.color,(long)things.number];
    // 执行语句
    char *error = nil;
    int result = sqlite3_exec(db, updateSql.UTF8String, NULL, NULL, &error);
    if (result == SQLITE_OK) {
      
    } else {
       
    }
    // 关闭数据库
    [self closeDB];
}




#pragma mark 查询所有备忘
- (NSArray *)selectAllThings
{// 1.打开数据库
    [self openDB];
    
    // 2.准备SQL语句
    NSString *selectSQL = @"SELECT *FROM Thing";
    
    // 3.创建跟随指针（存值，取值对象）
    sqlite3_stmt *stmt = nil;
    
    // 4.判断SQL语句是否正确
    int result = sqlite3_prepare_v2(db, selectSQL.UTF8String, -1, &stmt, NULL);
    
    // 5.判断执行结果
    if (result == SQLITE_OK) {
        // 6. 创建可变数组，准备盛放结果
        NSMutableArray *mutableArray = [NSMutableArray array];
        // 7.单步执行，获取每一个结果
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            // 8.获取每一个字段中的值
            NSInteger number =  sqlite3_column_int(stmt, 0);
            NSString *nowDate = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            NSString *tiXingDate = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            NSString *title = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
            NSString *color = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
            
            // 9.创建对象
            ThingsModel *thing = [[ThingsModel alloc] init];
            thing.number = number;
            thing.nowDate = nowDate;
           
            thing.tiXingDate = tiXingDate;
            thing.title = title;
            thing.color = color;
            
            // 10. 将对象装入数组
            [mutableArray addObject:thing];
           
            // 关闭数据库
            [self closeDB];
            [thing release];
            
        }
       
        return mutableArray;
        
    }
    sqlite3_finalize(stmt);
    [self closeDB];
    return NULL;
}




#pragma mark 删除某个备忘
- (void)deleteThings:(ThingsModel *)thing
{
    [self openDB];
    
    NSString *deleteSql = [NSString stringWithFormat:@"delete from Thing where number = '%ld'",(long)thing.number];
    
    int resulr = sqlite3_exec(db, deleteSql.UTF8String, NULL, NULL, NULL);
    
    if (resulr == SQLITE_OK) {
       
    } else {
       
    }
    
    [self closeDB];
    
}






@end
