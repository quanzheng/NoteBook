//
//  MainPageTableViewController.m
//  AppLication
//
//  Created by 全政 on 14-10-24.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "MainPageTableViewController.h"
#import "SelectBackGroundColorController.h"
#import "ListTableViewCell.h"   // 自定义cell
#import "DataBase.h"
#import "ThingsModel.h"
#import "ListHandel.h"
#import "ShowPageViewController.h"
@interface MainPageTableViewController ()<UITableViewDataSource,UINavigationControllerDelegate>



@property (nonatomic, retain)NSMutableArray *allDataArray;  // 存放从数据库里读出来的数据

@end

@implementation MainPageTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.delegate = self;
    // 清除分割线
    self.tableView.separatorColor = [UIColor clearColor];
    
    
    // 加beijing
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImage.png"]];
    
    self.title = @"备忘列表";
    // 左按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(add:)];
//    [self.navigationItem.leftBarButtonItem setTitle:@"Add"];
    self.navigationItem.leftBarButtonItem.image = [UIImage imageNamed:@"20141024081030791_easyicon_net_32.png"];
    // 右按钮

    self.navigationItem.rightBarButtonItem.style = UITableViewCellEditingStyleDelete;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem.image = [UIImage imageNamed:@"2014102408173623_easyicon_net_24.08.png"];
#warning 程序进入后台回来后也要出密码

}


#pragma mark 添加按钮事件
- (void)add:(UIBarButtonItem *)sender
{
    SelectBackGroundColorController *creatVC = [[SelectBackGroundColorController alloc] init];
   
    [self.navigationController pushViewController:creatVC animated:YES];

}



#pragma mark 显示tabbar，并从数据库中查询数据给予显示
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self showTabBar];
    
    // 走一遍列表助手中的获取所有数据方法，保证后边删除数据时有效
    [[ListHandel shareInstance] setupThingsDataSource];
    
    self.allDataArray = [NSMutableArray arrayWithArray:[[DataBase shareInstance] selectAllThings]];
    
   
    
    
    
    [self.tableView reloadData];
    

}

#pragma mark 显示TabBar的方法
- (void)showTabBar
{
    if (self.tabBarController.tabBar.hidden == NO)
    {
        return;
    }
    UIView *contentView;
    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    
    return _allDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *cellIdentifier = @"cellIdentifier";
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        
    }

    // 从存放数据源的数组中获取数据
    ThingsModel *things = (ThingsModel *)[_allDataArray objectAtIndex:indexPath.row];
    cell.title.text = things.title;
    NSString *str = @"记录时间:";
    cell.time.text =  [str stringByAppendingString:things.nowDate];;

    // 判断颜色
    if ([things.color isEqualToString:@"redColor"]) {
        cell.backgroundColor = redColor;
    }
    if ([things.color isEqualToString:@"skyBlueColor"]) {
        cell.backgroundColor = skyBlueColor;
    }
    if ([things.color isEqualToString:@"origainColor"]) {
        cell.backgroundColor = origainColor;
    }
    if ([things.color isEqualToString:@"greenColor"]) {
        cell.backgroundColor = greenColor;
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


#pragma mark 设置cell可以被编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    return YES;
}

#pragma mark 点击cell后跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ThingsModel *thing =  (ThingsModel *)[_allDataArray objectAtIndex:indexPath.row];
    ShowPageViewController *showPageVC = [[ShowPageViewController alloc] init];
    showPageVC.things = thing;
    [self.navigationController pushViewController:showPageVC animated:YES];
    [showPageVC release];
}


#pragma mark 处理编辑状态
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
       
        // 删除大数组中的数据
        [_allDataArray removeObjectAtIndex:indexPath.row];
        
       
        
        // 删除数据库中的数据
        [[ListHandel shareInstance] deleatThingsForRow:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
    [_allDataArray release];
    
    [super dealloc];
}

@end
