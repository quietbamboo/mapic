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
@protocol ModalControllerDelegate;

@interface PhotoMessageViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,ImageIdAndUserNameProtocol,ASIHTTPRequestDelegate>{
    NSMutableArray *photomessageArray;
	id <ModalControllerDelegate> delegate;
    UITextField* sendfield;
    MBProgressHUD  * _MBProgress;
}

@property (nonatomic,assign) id <ModalControllerDelegate> delegate;

- (void)closeButtonPressed;

@end


@protocol ModalControllerDelegate <NSObject>

- (void)modalControllerDidFinish:(PhotoMessageViewController *) photoMessageController;

@end
