//
//  Activity.h
//  LessonUI_18_KVO监测图片异步加载
//
//  Created by YesterdayFinder on 15/9/8.
//  Copyright (c) 2015年 YesterdayFinder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsynImageDownloadDelegate.h"

@interface Activity : NSObject<AsynImageDownloadDelegate>

@property (nonatomic, retain) NSString  *image;
@property (nonatomic, retain) NSString  *title;
@property (nonatomic, retain) UIImage   *picture;
- (void)loadImage;//通过图片网址下载图片

@end
