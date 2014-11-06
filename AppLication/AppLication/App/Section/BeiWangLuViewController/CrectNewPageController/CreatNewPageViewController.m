//
//  CreatNewPageViewController.m
//  AppLication
//
//  Created by 全政 on 14-10-24.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "CreatNewPageViewController.h"
#import "ThingsModel.h"
#import "DataBase.h"
#import "CreatNewPage.h"
#import "Crazying.h"
//动画时间
#define kAnimationDuration 0.000001
//view高度

@interface CreatNewPageViewController ()<UIAlertViewDelegate>

@property (nonatomic, retain)CreatNewPage *creatNewPage;
@end

@implementation CreatNewPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView
{
    self.creatNewPage = [[CreatNewPage alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _creatNewPage;
    _creatNewPage.titleField.tag = 1000;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImage.png"]];
    [_creatNewPage release];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    // 设置背景颜色
    // 1.时间
    //创建一个子layer
    
    _creatNewPage.time.backgroundColor = _color;
//    _creatNewPage.time.alpha = .5;
    _creatNewPage.timeText.backgroundColor = _color;
//    _creatNewPage.timeText.alpha = .5;
    _creatNewPage.changeDate.backgroundColor = _color;
//    _creatNewPage.changeDate.alpha = .5;
    
    // 2.文本框
    _creatNewPage.title.backgroundColor = _color;
    _creatNewPage.title.alpha = 1.f;
    _creatNewPage.titleField.backgroundColor = _color;
    _creatNewPage.titleField.alpha = 1.f;
    
    
    self.title = @"新建备忘";
    // 给选择时间按钮添加事件
    [_creatNewPage.changeDate addTarget:self
                                 action:@selector(changeDate:)
                       forControlEvents:UIControlEventTouchUpInside];
    
    
    // 创建选择时间控制器并设置代理
        self.selectDate = [[changeDateViewController alloc] init];
//     _selectDate.delegate = self;
    
    
    // 用dateBlock将选择的时间传到时间输入框
    __block CreatNewPageViewController *pp = self;
    _selectDate.dateBlock = ^(NSDate *date){
        // 打印时间
        NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
        // 为日期格式器设置格式字符串
        [dateFormater setDateFormat:@"yyyy年MM月dd日HH时mm分"];
        NSDate *select = date;
        NSString *dateString = [dateFormater stringFromDate:select];
       
       pp.creatNewPage.timeText.text = dateString;
    };
    
    
    
    
    // 自定义左上角按钮，点击返回主页面
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"giveUp.png"]
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(giveUpAction)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [leftButton release];
    
    
    
    // 自定义右上角的按钮，点击保存内容
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage
                                                                           imageNamed:@"save.png"]
                                                                    style:UIBarButtonItemStylePlain target:self
                                                                   action:@selector(save)];
    self.navigationItem.rightBarButtonItem = rightButton;
    [rightButton release];
    
    
    
    // 自定义navigationItem的颜色
    self.navigationItem.leftBarButtonItem.tintColor = _color;
    self.navigationItem.rightBarButtonItem.tintColor = _color;
    
    
    
    /******************文本框键盘相关方法************************************/
#warning 创建的线程是唯一的？
    
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
        
        [_creatNewPage.titleField setInputAccessoryView:topView];
        
        
    
    
}



- (void)viewWillAppear:(BOOL)animated
{
    //添加键盘的监听事件
    
    //注册通知,监听键盘弹出事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    //注册通知,监听键盘消失事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHidden) name:UIKeyboardDidHideNotification object:nil];
    
    
}



#pragma mark 日期选择按钮事件(弹出选择日期页面)
- (void)changeDate:(UIButton *)sender
{
#warning 注意：此处弹出的控制器必须为属性中的控制器，不能新建，否则两个控制期间没有任何关联(指针指的不一致)
    [self presentViewController:self.selectDate animated:YES completion:nil];
}



#pragma mark 放弃按钮的方法：直接返回到根视图（跳过选择背景颜色的控制器）
- (void)giveUpAction
{
    UIAlertView *alt = [[UIAlertView alloc] initWithTitle:@"⚠是否确认放弃？"
                                                  message:@"放弃后编辑内容将不再保存"
                                                 delegate:self
                                        cancelButtonTitle:@"确认"
                                        otherButtonTitles:@"不，我在想想",
                        nil];
    [alt show];
    [alt release];
    
}
#pragma mark 根据选择的选项做响应操作
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (0 == buttonIndex) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        
    }
}



#pragma mark 保存按钮对应的方法
- (void)save
{
    ThingsModel *thingsModel = [[ThingsModel alloc] init];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"yyyy年MM月dd日HH时mm分"];
    NSString *countDate = [dateFormater stringFromDate:[NSDate date]];
   
    thingsModel.nowDate = countDate;
    thingsModel.tiXingDate = _creatNewPage.timeText.text;
    thingsModel.title = _creatNewPage.titleField.text;
    
    // 比较颜色，选定要存储备忘对应的颜色
    if (CGColorEqualToColor(_creatNewPage.titleField.backgroundColor.CGColor, redColor.CGColor)) {
        thingsModel.color = @"redColor";
    }
    if (CGColorEqualToColor(_creatNewPage.titleField.backgroundColor.CGColor, origainColor.CGColor)) {
        thingsModel.color = @"origainColor";
    }
    if (CGColorEqualToColor(_creatNewPage.titleField.backgroundColor.CGColor, skyBlueColor.CGColor)) {
        thingsModel.color = @"skyBlueColor";
    }
    if (CGColorEqualToColor(_creatNewPage.titleField.backgroundColor.CGColor, greenColor.CGColor)) {
        thingsModel.color = @"greenColor";
    }
    
    // 数据插进数据库
    DataBase *dataBase = [DataBase shareInstance];
    [dataBase insertThings:thingsModel];
    
#warning 保存时组册通知提醒
    // 注册以下提醒
    if (![thingsModel.tiXingDate isEqualToString:@""]) {
        [[Crazying shareInstance] setLocalNotification:thingsModel];
        
    }
    
    
   
    
    
    // 弹出以保存提醒
    UIAlertView *alt = [[UIAlertView alloc] initWithTitle:@"保存提醒" message:@"保存成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alt show];
    [alt release];
    
    
    
    
    
}





/*************************以下是文本编辑与键盘冲突处理的相关方法****************************************/
#pragma mark  键盘弹出时
-(void)keyboardDidShow:(NSNotification *)notification
{
    
    //获取键盘高度
    NSValue *keyboardObject = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect;
    
    [keyboardObject getValue:&keyboardRect];
    
    //调整放置有textView的view的位置
    
    //设置动画
    [UIView beginAnimations:nil context:nil];
    
    //定义动画时间
    [UIView setAnimationDuration:kAnimationDuration];
    
    //设置view的frame，往上平移
    [(UIView *)[self.view viewWithTag:1000] setFrame:CGRectMake(0, 115, 320,self.view.frame.size.height - keyboardRect.size.height-115)];
    
    [UIView commitAnimations];
}

#pragma mark 键盘消失时
-(void)keyboardDidHidden
{
    //定义动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:kAnimationDuration];
    //设置view的frame，往下平移
    [(UIView *)[self.view viewWithTag:1000] setFrame:CGRectMake(0, 50+65, 320, self.view.frame.size.height-50-65)];
    [UIView commitAnimations];
}





//隐藏键盘
- (void)resignKeyboard {
   
        [_creatNewPage.titleField resignFirstResponder];
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
    [_color release];
    [_creatNewPage release];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    
    
    
    [super dealloc];
}

@end
