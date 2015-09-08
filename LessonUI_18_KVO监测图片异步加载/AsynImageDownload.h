//
//  AsynImageDownload.h
//  LessonUI_18_异步下载图片
//
//  Created by YesterdayFinder on 15/9/8.
//  Copyright (c) 2015年 YesterdayFinder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsynImageDownloadDelegate.h"

@interface AsynImageDownload : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic, assign) BOOL isDownloading;
@property (nonatomic, assign) id<AsynImageDownloadDelegate> delegate;
@property (nonatomic, retain) NSURLConnection *connection;

- (instancetype)initWithImageURL:(NSString *)imageURL;

- (void)cancelRequest;
@end
