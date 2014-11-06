//
//  changeDateViewController.m
//  beiwanglu
//
//  Created by 全政 on 14-10-12.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "changeDateViewController.h"
#import "changeDateView.h"
#import "CreatNewPageViewController.h"
@interface changeDateViewController ()
{
    changeDateView *changeDate;
}
@end

@implementation changeDateViewController

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
    
    
    
    [changeDate.sure addTarget:self action:@selector(sureeAction:) forControlEvents:UIControlEventTouchUpInside];
    
     [changeDate.miss addTarget:self action:@selector(missAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
        
}

#pragma mark 时间选择器触发事件
//- (void)changeTime:(UIDatePicker *)sender
//{
//    //sender.date
//    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
//    // 为日期格式器设置格式字符串
//    [dateFormater setDateFormat:@"yyyy年MM月dd日HH时mm分"];
//    NSDate *select = [sender date];
//    NSString *dateString = [dateFormater stringFromDate:select];
//    NSLog(@"dateControl:%@",dateString);
//}
//

#pragma mark 确定按钮触发事件(1、传值（时间）给父视图控制器，2、模态收回本页面)
- (void)sureeAction:(UIButton *)sender
{
    // block传值
    NSDate *da = [changeDate.datePicker date];
    if (self.dateBlock != nil) {
        _dateBlock(da);
    }
    _dateBlock(da);
    
    
    
    // 收回本页
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}

#pragma mark 取消按钮出发的事件
- (void)missAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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


- (void)dealloc
{
    // [_myBlock release]; // 不建议使用这种方式释放
    
    Block_release(_dateBlock);
    
    [super dealloc];
}


@end
