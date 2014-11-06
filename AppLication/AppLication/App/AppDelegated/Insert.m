//
//  Insert.m
//  AppLication
//
//  Created by 全政 on 14-10-30.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "Insert.h"
#import "DataBase.h"
@implementation Insert
static Insert *insert = nil;

+ (Insert *)shareInstance
{
    if (insert == nil) {
        insert = [[[self class] alloc] init];
    }
    return insert;
}

- (void)insertThings
{
dispatch_apply(1, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t t) {
//    NSLog(@"指定代码执行若干次");
    ThingsModel *thing = [[ThingsModel alloc] init];
    thing.tiXingDate = @"2015年10月30日08时08分";
    thing.nowDate = @"2014年10月30日08时08分";
    thing.title = @"欢迎使用烂笔头\n \n \n 在使用过程中如有意见或疑问， 请与我们联系：\n邮箱：quanzheng92@163.com\n官方网站：www.lanou3g.com";
    
    thing.color = @"redColor";
    
    
    ThingsModel *thing0 = [[ThingsModel alloc] init];
    thing0.tiXingDate = @"2015年10月30日08时08分";
    thing0.nowDate = @"2014年10月30日08时08分";
    thing0.title = @"操作指引 \n \n \n 点击左上角按钮，即可新建备忘 \n\n 点击右上角按钮或者向左滑动备忘事项，即可删除备忘 \n\n 强大的备忘提醒功能让你不漏掉任何重要事情，只需要在新建备忘时添加提醒时间即可 \n\n 点击备忘，可以随时查看并修改备忘，方便快捷  ";
    
    thing0.color = @"skyBlueColor";
    
    
    ThingsModel *thing1 = [[ThingsModel alloc] init];
    thing1.tiXingDate = @"2015年10月30日08时08分";
    thing1.nowDate = @"2014年10月30日08时08分";
    thing1.title = @"功能简介\n \n \n 1、烂笔头为您提供简洁的操作界面，仅需几步即可将你的灵感、重要事件记录下来，并且绝对不会泄露您的任何隐私。\n \n 2、自定义多彩的便签颜色为您的记录添加更多乐趣\n \n 3、贴心的时间提醒功能让您不漏掉任何事情，从此以后，老板再也不用担心我开会迟到，妈妈再也不用担心我忘掉约会啦～\n \n 4、同事借用手机，担心被偷窥备忘的事情？没关系，烂笔头具备加密功能，只需要在“个人设置“中设定密码并打开密码锁，不管是重启应用还是从后台唤醒应用，烂笔头妥妥的守护您的备忘事项（偷偷的告诉你：只要打开密码锁，即使没有设置密码，加密功能也会生效哟～）";
    thing1.color = @"greenColor";
    
    ThingsModel *thing2 = [[ThingsModel alloc] init];
    thing2.tiXingDate = @"2015年10月30日08时08分";
    thing2.nowDate = @"2014年10月30日08时08分";
    thing2.title = @"好记性，不如“烂笔头”";
    thing2.color = @"origainColor";
    [[DataBase shareInstance] insertThings:thing];
    [[DataBase shareInstance] insertThings:thing0];

    [[DataBase shareInstance] insertThings:thing1];
    [[DataBase shareInstance] insertThings:thing2];


    
});
    
}
@end
