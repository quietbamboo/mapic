//
//  PhotoMessageViewController.h
//  template
//
//  Created by yujie liu on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalControllerDelegate;

@interface PhotoMessageViewController : UIViewController {
    
	id <ModalControllerDelegate> delegate;
}

@property (nonatomic) id <ModalControllerDelegate> delegate;

- (void)closeButtonPressed;

@end


@protocol ModalControllerDelegate <NSObject>

- (void)modalControllerDidFinish:(PhotoMessageViewController *) photoMessageController;

@end
