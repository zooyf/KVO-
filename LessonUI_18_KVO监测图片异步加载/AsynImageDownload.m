//
//  AsynImageDownload.m
//  LessonUI_18_异步下载图片
//
//  Created by YesterdayFinder on 15/9/8.
//  Copyright (c) 2015年 YesterdayFinder. All rights reserved.
//

#import "AsynImageDownload.h"
#import <UIKit/UIKit.h>

@interface AsynImageDownload ()
@property (nonatomic, retain) NSMutableData *receiveData;
@end

@implementation AsynImageDownload

- (instancetype)initWithImageURL:(NSString *)imageURL
{
    self = [super init];
    if (self) {
        //1.URL
        NSURL *url = [NSURL URLWithString:imageURL];
        //2.request
        NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
        //3.connection OBJ
        self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
    }
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.receiveData = [NSMutableData data];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receiveData appendData:data];
    UIImage *image = [UIImage imageWithData:_receiveData];
    if ([_delegate respondsToSelector:@selector(AsynImageDownload:isLoading:)]) {
        [_delegate AsynImageDownload:self isLoading:image];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
}

- (void)cancelRequest
{
    [self.connection cancel];
}

@end
