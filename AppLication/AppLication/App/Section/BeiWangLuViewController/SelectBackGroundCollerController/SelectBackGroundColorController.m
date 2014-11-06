//
//  SelectBackGroundColorController.m
//  AppLication
//
//  Created by 全政 on 14-10-24.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "SelectBackGroundColorController.h"
#import "SelectBGColorView.h"
#import "CreatNewPageViewController.h"
@interface SelectBackGroundColorController ()

@property (nonatomic, retain) SelectBGColorView *selectBGColor;

@end

@implementation SelectBackGroundColorController

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
     _selectBGColor = [[SelectBGColorView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _selectBGColor;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImage.png"]];
    [_selectBGColor release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_selectBGColor.view1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_selectBGColor.view2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_selectBGColor.view3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_selectBGColor.view4 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}



#pragma mark 隐藏TabBar
- (void)viewWillAppear:(BOOL)animated
{
    [self hideTabBar];
    
}



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



- (void)buttonAction:(UIButton *)sender
{
    self.bgcolor = sender.backgroundColor;
    CreatNewPageViewController *creatNew = [CreatNewPageViewController new];
    creatNew.color = sender.backgroundColor;
    [self.navigationController pushViewController:creatNew animated:YES];
    [creatNew release];
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
