//
//  ActivityTableViewCell.h
//  LessonUI_18_KVO监测图片异步加载
//
//  Created by YesterdayFinder on 15/9/8.
//  Copyright (c) 2015年 YesterdayFinder. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Activity;

@interface ActivityTableViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *imgView;
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) Activity *activity;
@end
