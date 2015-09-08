//
//  Activity.m
//  LessonUI_18_KVO监测图片异步加载
//
//  Created by YesterdayFinder on 15/9/8.
//  Copyright (c) 2015年 YesterdayFinder. All rights reserved.
//

#import "Activity.h"
#import "AsynImageDownload.h"

@implementation Activity

- (void)loadImage
{
    AsynImageDownload *downloader = [[AsynImageDownload alloc] initWithImageURL:_image];
    downloader.delegate = self;
}

- (void)AsynImageDownload:(AsynImageDownload *)download isLoading:(UIImage *)image
{
    self.picture = image;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (void)dealloc
{
    [_image release];
    [_title release];
    [super dealloc];
}

@end
