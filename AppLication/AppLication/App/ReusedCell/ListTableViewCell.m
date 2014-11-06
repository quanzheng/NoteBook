//
//  ListTableViewCell.m
//  AppLication
//
//  Created by 全政 on 14-10-24.
//  Copyright (c) 2014年 全政. All rights reserved.
//

#import "ListTableViewCell.h"
#import "ThingsModel.h"
@implementation ListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self addAllView];
        // 设置cell的圆角
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
    }
    return self;
}


- (void)addAllView
{
    
    
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 310, 35)];
    _title.text = @"烂笔头，你身边的备忘专家";
    [self.contentView addSubview:_title];
    [_title release];
    
    
    self.time = [[UILabel alloc] initWithFrame:CGRectMake(5, 40, 310, 10)];
    _time.font = [UIFont systemFontOfSize:10];
    _time.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_time];
    [_time release];
    
    // cell 的背景颜色和便签颜色一致
//    self.backgroundColor = _bgColor;
    
}


#pragma mark 重写属性的setter方法
- (void)setThings:(ThingsModel *)things
{
    if (_things != things) {
        [_things release];
        _things = [things retain];
    }
    _things.title = things.title;
    _things.nowDate = things.nowDate;
    _things.tiXingDate = things.tiXingDate;
    _things.color = things.color;
    
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [_time release];
    [_title release];
    
    [super dealloc];
}
@end
