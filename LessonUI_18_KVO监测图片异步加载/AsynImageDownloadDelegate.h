//
//  AsynImageDownloadDelegate.h
//  LessonUI_18_异步下载图片
//
//  Created by YesterdayFinder on 15/9/8.
//  Copyright (c) 2015年 YesterdayFinder. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;
@class AsynImageDownload;

@protocol AsynImageDownloadDelegate <NSObject>

- (void)AsynImageDownload:(AsynImageDownload *)download isLoading:(UIImage *)image;

@end
