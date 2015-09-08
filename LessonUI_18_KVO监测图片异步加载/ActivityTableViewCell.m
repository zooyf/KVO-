//
//  ActivityTableViewCell.m
//  LessonUI_18_KVO监测图片异步加载
//
//  Created by YesterdayFinder on 15/9/8.
//  Copyright (c) 2015年 YesterdayFinder. All rights reserved.
//

#import "ActivityTableViewCell.h"
#import "Activity.h"

@implementation ActivityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setActivity:(Activity *)activity
{
    if (_activity != activity) {
        [_activity release];
        _activity = [activity retain];
        
        _titleLabel.text = _activity.title;
        
        _imgView.image = _activity.picture;
    }
}

- (void)dealloc {
    [_imgView release];
    [_titleLabel release];
    [super dealloc];
}
@end
