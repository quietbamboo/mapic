//
//  DownloaderPhotoMessage.h
//  template
//
//  Created by yujie liu on 12-9-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PhotoMessage;

@protocol DownloaderPhotoMessageDelegate;

@interface DownloaderPhotoMessage : NSObject
{
    PhotoMessage *appRecord;
    NSIndexPath *indexPathInTableView;
    id <DownloaderPhotoMessageDelegate> delegate;
    
    NSMutableData *activeDownload;
    NSURLConnection *imageConnection;
}

@property (nonatomic, retain) PhotoMessage *appRecord;
@property (nonatomic, retain) NSIndexPath *indexPathInTableView;
@property (nonatomic, assign) id <DownloaderPhotoMessageDelegate> delegate;

@property (nonatomic, retain) NSMutableData *activeDownload;
@property (nonatomic, retain) NSURLConnection *imageConnection;

- (void)startDownload;
- (void)cancelDownload;

@end

@protocol DownloaderPhotoMessageDelegate 

- (void)appImageDidLoad:(NSIndexPath *)indexPath;

@end