//
//  DeatilViewController.h
//  template
//
//  Created by yujie liu on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DirectionsViewControllerDelegate;
@interface DeatilViewController : UIViewController{
    id<DirectionsViewControllerDelegate> delegate;
}
@property (nonatomic, assign) id<DirectionsViewControllerDelegate> delegate;
@end

@protocol DirectionsViewControllerDelegate <NSObject>

- (void)directionsViewControllerDidCancel:(DeatilViewController *)viewController;
- (void)directionsViewController:(DeatilViewController *)viewController routeFromAddress:(NSString *)startAddress toAddress:(NSString *)endAddress;
@end