//
//  ListTableViewCell.h
//  AppLication
//
//  Created by 全政 on 14-10-24.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ThingsModel;
@interface ListTableViewCell : UITableViewCell

@property (nonatomic, retain) UILabel *title;   // 备忘事件
@property (nonatomic, retain) UILabel *time;    // 备忘时间
@property (nonatomic, retain) ThingsModel *things;


//@property (nonatomic, retain) UIColor *bgColor; // 便签颜色
@end
