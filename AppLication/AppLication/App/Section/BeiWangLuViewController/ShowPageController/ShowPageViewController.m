//
//  ShowPageViewController.m
//  AppLication
//
//  Created by 全政 on 14-10-28.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "ShowPageViewController.h"
#import "ShowPageView.h"
#import "ThingsModel.h"
#import "ListHandel.h"
#import "DateViewController.h"
#import "Crazying.h"
@interface ShowPageViewController ()
{
    NSDate *de;
}

@property (nonatomic, retain) ShowPageView *showPageView;
@property (nonatomic, retain) NSString *color;  //保存颜色


@property (nonatomic, assign) BOOL isChanged;   // 判断时间是否改变
@end

@implementation ShowPageViewController

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
    self.showPageView = [[ShowPageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _showPageView;
    [_showPageView release];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImage.png"]];
    // 隐藏系统的返回按钮，自定义bar
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"return.png"] style:UIBarButtonItemStylePlain target:self action:@selector(returnButtonAction)];
    self.navigationItem.titleView = [self setTitle];
    
    
    
    //定义一个键盘上的toolBar
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    
    //设置style
    [topView setBarStyle:UIBarStyleDefault];
    
    //定义两个flexibleSpace的button，放在toolBar上，这样完成按钮就会在最右边
    UIBarButtonItem * button1 =[[UIBarButtonItem  alloc]initWithBarButtonSystemItem:                                        UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem * button2 = [[UIBarButtonItem  alloc]initWithBarButtonSystemItem:                                        UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    //定义完成按钮
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone  target:self action:@selector(resignKeyboard)];
    
    //在toolBar上加上这些按钮
    NSArray *buttonsArray = [NSArray arrayWithObjects:button1,button2,doneButton,nil];
    [topView setItems:buttonsArray];
    
    [_showPageView.title setInputAccessoryView:topView];
    
    
    
    /*******************页面上一些元素添加事件**********************/
    [_showPageView.red addTarget:self action:@selector(redAction:) forControlEvents:UIControlEventTouchUpInside];
    [_showPageView.origain addTarget:self action:@selector(origainAction:) forControlEvents:UIControlEventTouchUpInside];
    [_showPageView.blue addTarget:self action:@selector(blueAction:) forControlEvents:UIControlEventTouchUpInside];
    [_showPageView.green addTarget:self action:@selector(greenAction:) forControlEvents:UIControlEventTouchUpInside];
    
    // 闹钟时间
    [_showPageView.naozhong addTarget:self action:@selector(naozhongAction:) forControlEvents:UIControlEventTouchUpInside];
    
    // 创建出修改时间的控制器
    self.dateVC = [[DateViewController alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeDateee:) name:@"CHANGETIME" object:nil];


    
}
#pragma mark 通知方法实现
- (void)changeDateee:(NSNotification *)notification
{
    NSDictionary *dic = [notification userInfo];
    NSDate *datee = [dic objectForKey:@"time"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日HH时mm分"];
    NSString *dd = [dateFormatter stringFromDate:datee];
   
    _showPageView.tiXingDate.text = dd;
    
}
#pragma mark - 四色按钮操作
#pragma mark red
- (void)redAction:(UIButton *)sender
{
    self.color = @"redColor";
    _showPageView.title.backgroundColor = redColor;
    
}
#pragma mark origain
- (void)origainAction:(UIButton *)sender
{
    self.color = @"origainColor";
    _showPageView.title.backgroundColor = origainColor;
}
#pragma mark blue
- (void)blueAction:(UIButton *)sender
{
    self.color = @"skyBlueColor";
    _showPageView.title.backgroundColor = skyBlueColor;
}
#pragma mark green
- (void)greenAction:(UIButton *)sender
{
    self.color = @"greenColor";
    _showPageView.title.backgroundColor = greenColor;
}


#pragma mark naozhongAction
- (void)naozhongAction:(UIButton *)sendr
{
#warning 将字符串的时间转换为date对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日HH时mm分"];
    de = [dateFormatter dateFromString:_showPageView.tiXingDate.text];
    
    // 创建模态弹出的对象，并使用属性将原时间值传递过去
    
    if (de != nil) {
        _dateVC.nowDate = de;
    }
    [self presentViewController:self.dateVC animated:YES completion:nil];
    
    // 改变提醒时间
    self.isChanged = YES;

}
#pragma mark 隐藏键盘
- (void)resignKeyboard {
    
    [_showPageView.title resignFirstResponder];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 隐藏toolbar
    [self hideTabBar];
    
    
    // 传值，附值
    _showPageView.title.text = _things.title;
    if (!_isChanged) {
        _showPageView.tiXingDate.text = _things.tiXingDate;
    }
    // 将修改时间的判定条件还原
    _isChanged = NO;

    _showPageView.nowDate.text = _things.nowDate;
    
    // 判断颜色值
    if ([_things.color isEqualToString:@"redColor"]) {
        _showPageView.title.backgroundColor = redColor;
    }
    if ([_things.color isEqualToString:@"origainColor"]) {
        _showPageView.title.backgroundColor = origainColor;
    }
    if ([_things.color isEqualToString:@"greenColor"]) {
        _showPageView.title.backgroundColor = greenColor;
    }
    if ([_things.color isEqualToString:@"skyBlueColor"]) {
        _showPageView.title.backgroundColor = skyBlueColor;
    }
    
}


#pragma mark 设置自定义头标题
- (UILabel *)setTitle
{
    _showPageView.nowDate = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)] autorelease];
    _showPageView.nowDate.font = [UIFont systemFontOfSize:20.f];
    _showPageView.nowDate.text = @"2012年12月12日";
    return _showPageView.nowDate;
}

#pragma mark 返回按钮事件
- (void)returnButtonAction
{
    // 更新数据
    _things.title = _showPageView.title.text;
    _things.tiXingDate = _showPageView.tiXingDate.text;

    // 比较颜色，选定要存储备忘对应的颜色
    if (CGColorEqualToColor(_showPageView.title.backgroundColor.CGColor, redColor.CGColor)) {
        _things.color = @"redColor";
    }
    if (CGColorEqualToColor(_showPageView.title.backgroundColor.CGColor, origainColor.CGColor)) {
        _things.color = @"origainColor";
    }
    if (CGColorEqualToColor(_showPageView.title.backgroundColor.CGColor, skyBlueColor.CGColor)) {
        _things.color = @"skyBlueColor";
    }
    if (CGColorEqualToColor(_showPageView.title.backgroundColor.CGColor, greenColor.CGColor)) {
        _things.color = @"greenColor";
    }
#warning 将修改后的更新进数据库
    // 保存进数据库
    [[ListHandel shareInstance] updateThings:_things];
    
#warning 保存时组册通知提醒
    // 注册以下提醒
    // 注册以下提醒
   
    
    if (![_things.tiXingDate isEqualToString:@""] || [de isEqualToDate:[de laterDate:[NSDate date]]]  ) {
        [[Crazying shareInstance] setLocalNotification:_things];
        
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];

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

#pragma mark 隐藏TabBar
#pragma mark 隐藏tabbar的方法
- (void)hideTabBar
{
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark dealloc
- (void)dealloc
{
    [_date release];
    [_time release];
    [_showPageView release];
    [_color release];
    
    [super dealloc];
}
@end
