//
//  EnterPasswordViewController.m
//  beiwanglu
//
//  Created by 全政 on 14-10-22.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "EnterPasswordViewController.h"
#import "EnterPasswordView.h"
#import "MainPageTableViewController.h"
@interface EnterPasswordViewController ()
{
    UIAlertView *alt;
}

@property (nonatomic, retain) EnterPasswordView *enterPassWord;

@end

@implementation EnterPasswordViewController

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
    self.enterPassWord = [[EnterPasswordView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _enterPassWord;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImage.png"]];
    
    [_enterPassWord release];
    
                 
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_enterPassWord.sure addTarget:self action:@selector(sureAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)sureAction:(UIButton *)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *pass = [defaults objectForKey:@"change"];
    if ([pass isEqualToString:_enterPassWord.enterPassword.text]) {
        
         [self dismissViewControllerAnimated:YES completion:nil];

    } else {
        alt = [[UIAlertView alloc] initWithTitle:@"警告" message:@"密码错误" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
        
        // 两秒后提示消失
        [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:@selector(dissmiss:) userInfo:nil repeats:NO];
        
        [alt show];
        [alt release];
    }
}

#pragma mark 提示框两秒后消失
- (void)dissmiss:(UIAlertView *)sender
{
    [alt dismissWithClickedButtonIndex:0 animated:NO];
    
}



- (void)didReceiveMemoryWarning
{
        [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
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
