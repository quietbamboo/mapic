//
//  PhotoMessageViewController.h
//  template
//
//  Created by yujie liu on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoMessageView.h"
#import "ImageIdAndUserNameProtocol.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "DownloaderPhotoMessage.h"
#import "ODRefreshControl.h"
@protocol ModalControllerDelegate;

@interface PhotoMessageViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIScrollViewDelegate,ImageIdAndUserNameProtocol,ASIHTTPRequestDelegate,DownloaderPhotoMessageDelegate>{
    NSMutableArray *photomessageArray;
	id <ModalControllerDelegate> delegate;
    UITextField* sendfield;
    MBProgressHUD  * _MBProgress;
    UITableView *phototableview;
    NSMutableDictionary *imageDownloadsInProgress;
    ODRefreshControl *refreshControl;
}
@property (nonatomic, retain) NSMutableDictionary *imageDownloadsInProgress;
@property (nonatomic,assign) id <ModalControllerDelegate> delegate;

- (void)closeButtonPressed;

@end


@protocol ModalControllerDelegate <NSObject>

- (void)modalControllerDidFinish:(PhotoMessageViewController *) photoMessageController;

@end
