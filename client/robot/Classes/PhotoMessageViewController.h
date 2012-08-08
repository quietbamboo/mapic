//
//  PhotoMessageViewController.h
//  template
//
//  Created by yujie liu on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoMessageView.h"
@protocol ModalControllerDelegate;

@interface PhotoMessageViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,PhotoMessageDelegate>{
    NSMutableArray *photomessageArray;
	id <ModalControllerDelegate> delegate;
    UITextField* sendfield;
}

@property (nonatomic) id <ModalControllerDelegate> delegate;

- (void)closeButtonPressed;

@end


@protocol ModalControllerDelegate <NSObject>

- (void)modalControllerDidFinish:(PhotoMessageViewController *) photoMessageController;

@end
