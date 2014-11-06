//
//  PassWordViewController.m
//  beiwanglu
//
//  Created by 全政 on 14-10-21.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "PassWordViewController.h"
#import "PassWordView.h"
@interface PassWordViewController ()
{
    UIAlertView *alt2;
    UIAlertView *alt1;
}
 @property (nonatomic, retain)   PassWordView *passWordView;

@end

@implementation PassWordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)loadView
{
    _passWordView = [[PassWordView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = _passWordView;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImage.png"]];
    [_passWordView release];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人设置";
    
    // 设置密码框的内容为nsuserdefault的内容
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _passWordView.inputPassWord.text = [defaults objectForKey:@"change"];
    _passWordView.sureInput.text = [defaults objectForKey:@"change"];
    // 设置密码启用状态与nsuserdefault一样
    _passWordView.select.selectedSegmentIndex = [[defaults objectForKey:@"enabled_preference"] integerValue];
    // 给密码开关绑定事件
    [_passWordView.select addTarget:self action:@selector(baocunAction:) forControlEvents:UIControlEventValueChanged];
    
    
}


#pragma mark 页面将要消失时再cunyibian
- (void)viewWillDisappear:(BOOL)animated
{
    NSString *newPassWord = _passWordView.inputPassWord.text;
    NSString *surePassWord = _passWordView.sureInput.text;
    if ([newPassWord isEqualToString:surePassWord]) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
       
        // 将密码保存起来
        [defaults setObject:newPassWord forKey:@"change"];
       
        // 将密码状态保存起来
        [defaults setInteger:_passWordView.select.selectedSegmentIndex forKey:@"enabled_preference"];
       
        // 马上写入文件
        [defaults synchronize];
    }

}
#pragma mark 保存数值，并根据分段控制器的状态做出响应反馈
- (void)baocunAction:(UISegmentedControl *)sender
{
    NSString *newPassWord = _passWordView.inputPassWord.text;
    NSString *surePassWord = _passWordView.sureInput.text;
    if ([newPassWord isEqualToString:surePassWord]) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
       
        // 将密码保存起来
        [defaults setObject:newPassWord forKey:@"change"];
        
        // 将密码状态保存起来
        [defaults setInteger:_passWordView.select.selectedSegmentIndex forKey:@"enabled_preference"];
       
        // 马上写入文件
        [defaults synchronize];
        
        // 状态修改提醒
        switch (sender.selectedSegmentIndex) {
            case 0:
                alt1 = [[UIAlertView alloc] initWithTitle:@"🔒程序锁" message:@"程序锁已取消" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                [alt1 show];
                [alt1 release];
                [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:@selector(dissmisss:) userInfo:nil repeats:NO];
                break;
                
            default:
                alt1 = [[UIAlertView alloc] initWithTitle:@"🔒程序锁" message:@"程序锁已开启" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                [alt1 show];
                [alt1 release];
                [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:@selector(dissmisss:) userInfo:nil repeats:NO];
                break;
        }
    } else {
        alt2 = [[UIAlertView alloc] initWithTitle:@"提示" message:@"两次输入的密码不一致" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:@selector(dissmiss:) userInfo:nil repeats:NO];
        [alt2 show];
        [alt2 release];
    }
    
    
    
}
#pragma mark 提示框两秒后消失
- (void)dissmiss:(UIAlertView *)sender
{
    [alt2 dismissWithClickedButtonIndex:0 animated:NO];
}
- (void)dissmisss:(UIAlertView *)sender
{
    [alt1 dismissWithClickedButtonIndex:0 animated:NO];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
    
    //[self.view reloadInputViews];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
