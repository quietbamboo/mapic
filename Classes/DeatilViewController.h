//
//  DeatilViewController.h
//  template
//
//  Created by yujie liu on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Place.h"
@protocol DirectionsViewControllerDelegate;
@interface DeatilViewController : UIViewController{
    id<DirectionsViewControllerDelegate> delegate;
    Place *endPlace;
}
@property (nonatomic, assign) id<DirectionsViewControllerDelegate> delegate;
@property (nonatomic, retain) Place *endPlace;
@end

@protocol DirectionsViewControllerDelegate <NSObject>

- (void)directionsViewControllerDidCancel:(DeatilViewController *)viewController;
- (void)directionsViewController:(DeatilViewController *)viewController toPlace:(Place *)endPlace;
@end