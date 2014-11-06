//
//  DateViewController.m
//  AppLication
//
//  Created by 全政 on 14-10-29.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "DateViewController.h"
#import "changeDateView.h"
#import "ShowPageViewController.h"
@interface DateViewController ()
{
    changeDateView *changeDate;
}
@end

@implementation DateViewController

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
    changeDate = [[changeDateView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = changeDate;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImage.png"]];
    
    [changeDate release];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 設置時間選擇啟現實的時間為當前設置的提醒時間
    if (_nowDate != nil) {
        [changeDate.datePicker setDate:_nowDate animated:YES];
        
    }
    
    // 给时间选择器绑定事件
    [changeDate.datePicker addTarget:self action:@selector(changeTime:) forControlEvents:UIControlEventValueChanged];
    
    [changeDate.sure addTarget:self action:@selector(sureeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [changeDate.miss addTarget:self action:@selector(missAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}



#pragma mark 确定按钮触发事件
- (void)sureeAction:(UIButton *)sender
{
    // 收回本页
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}




#pragma mark 取消按钮出发的事件
- (void)missAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark 时间选择器触发事件()通知
- (void)changeTime:(UIDatePicker *)sender
{
//    //sender.date
//    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
//    // 为日期格式器设置格式字符串
//    [dateFormater setDateFormat:@"yyyy年MM月dd日HH时mm分"];
//    NSDate *select = [sender date];
//    NSString *dateString = [dateFormater stringFromDate:select];
//    NSLog(@"dateControl:%@",dateString);
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:sender.date, @"time", nil];
   
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CHANGETIME" object:self userInfo:dic];
    
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
