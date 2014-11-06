//
//  AppDelegate.m
//  AppLication
//
//  Created by 全政 on 14-10-24.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "PassWordViewController.h"
#import "EnterPasswordViewController.h"
#import "MainPageTableViewController.h"
#import "ListHandel.h"
#import "Insert.h"
@implementation AppDelegate
{
    EnterPasswordViewController *enterVC;
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    UITabBarController *tabTBV = [[UITabBarController alloc] init];
    
    
    // 备忘录
    MainPageTableViewController *rootVC = [[MainPageTableViewController alloc] init];
    UINavigationController *rootNVC = [[UINavigationController alloc] initWithRootViewController:rootVC];
    rootNVC.tabBarItem.title = @"备忘录";
    // 顶部条设置为透明
    rootNVC.navigationController.navigationBar.translucent = YES;
    rootNVC.tabBarItem.image = [UIImage imageNamed:@"20141024081328536_easyicon_net_24.png"];
    [rootVC release];
    
    
    
    // 个人设置
    PassWordViewController *passWordVC = [[PassWordViewController alloc] init];
    UINavigationController *passWordNVC = [[UINavigationController alloc] initWithRootViewController:passWordVC];
    
    passWordNVC.tabBarItem.title = @"个人设置";
    passWordNVC.navigationController.navigationBar.translucent = YES;
    passWordNVC.tabBarItem.image = [UIImage imageNamed:@"20141024082016417_easyicon_net_24.png"];
    [passWordVC release];
    
    
    // 将两个导航器添加进tabbar
    tabTBV.viewControllers = @[rootNVC,passWordNVC];
    tabTBV.selectedIndex = 0;
    [rootNVC release];
    [passWordNVC release];
    
    // 唯一创建一个导引文件
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   


//    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"first"];
    if (![defaults objectForKey:@"first"]) {
        [[Insert shareInstance] insertThings];
    }
    [defaults setObject:@"YES" forKey:@"first"];

    
    // 如果开启了密码，进入密码框，否则直接进入程序
    
   
    // 获取文件路径（调试用）
   
   
    
    
        switch ([[defaults objectForKey:@"enabled_preference"] integerValue]) {
        case 0:
            // 弹出程序
           
            self.window.rootViewController = tabTBV;
            [tabTBV release];
            break;
            
        case 1:
            // 弹出密码
            //
            self.window.rootViewController = tabTBV;
            // 创建输入密码控制器
            enterVC = [[EnterPasswordViewController alloc] init];
            [tabTBV presentViewController:enterVC animated:NO completion:nil];
            [enterVC release];
            
    }
    

    return YES;
}


#pragma mark 收到本地通知
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
   
    

    if (notification) {
    

        notification.applicationIconBadgeNumber = 0;

        NSDate *datee = [NSDate date];
        NSDate *k =[notification.fireDate earlierDate:datee];
        
//        if ([k isEqualToDate:datee]) {
            NSString *meggage = notification.userInfo[@"time"];
            
            UIAlertView *alartView = [[UIAlertView alloc]initWithTitle:nil message:meggage  delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alartView show];
            [alartView release];
        [alartView dismissWithClickedButtonIndex:0 animated:YES];
            [[UIApplication sharedApplication] cancelLocalNotification:notification];
//        }
    }
    
//    // 程序在前台运行时，图标上的数值为0
//    application.applicationIconBadgeNumber = 0;
//    // 使用UIAlertView显示本地通知的信息
//    [[UIAlertView alloc] initWithTitle:@"收到通知" message:notification.alertBody   delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
}


#pragma mark 程序进入前台后，将图标文字设为0
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    application.applicationIconBadgeNumber = 0;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

#warning 程序进入后台后，如果密码开启，再次回到程序时，需要输入密码
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    switch ([[defaults objectForKey:@"enabled_preference"] integerValue]) {
        case 0:
            
            break;
        case 1:
            
            
            // 创建输入密码控制器
            enterVC = [[EnterPasswordViewController alloc] init];
            [self.window.rootViewController presentViewController:enterVC animated:NO completion:nil];
            [enterVC release];
            break;
    }
}




    
    

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
