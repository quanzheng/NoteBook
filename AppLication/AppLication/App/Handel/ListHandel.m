//
//  ListHandel.m
//  AppLication
//
//  Created by 全政 on 14-10-28.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "ListHandel.h"
#import "ThingsModel.h"
#import "DataBase.h"


@interface ListHandel ()
@property (nonatomic, retain) NSMutableArray *thingsArray;

@end

@implementation ListHandel

static ListHandel *handel = nil;

+ (ListHandel *)shareInstance
{
    if (handel == nil) {
        handel = [[[self class] alloc] init];
    }
    return handel;
}



#pragma mark 从数据库读取数据
- (void)setupThingsDataSource
{
    self.thingsArray = [NSMutableArray arrayWithArray:[[DataBase shareInstance] selectAllThings]];
    
}


#pragma mark 获取备忘事件的个数
- (NSInteger)countOfThings
{
    return [_thingsArray count];
}


#pragma mark 获取某个备忘
- (ThingsModel *)thingsForRow:(NSInteger)row
{
    return _thingsArray[row];
}


#pragma mark 删除某个备忘
- (void)deleatThingsForRow:(NSInteger)row
{
#warning 所有的number＝＝0
    // 从数据库删除
    [[DataBase shareInstance] deleteThings: [self thingsForRow:row]];//[self thingsForRow:row]];
    // 从数据源删除
    [_thingsArray removeObjectAtIndex:row];
    
}

#pragma mark 修改某个备忘
- (void)updateThings:(ThingsModel *)thing
{
    // 修改数据库
    
    [[DataBase shareInstance] updateThings:thing];
    
    
}


#pragma mark  重写
- (void)dealloc
{
    [_thingsArray release];
    
    [super dealloc];
}






@end
