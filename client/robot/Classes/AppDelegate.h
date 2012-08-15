//
//  appsearchAppDelegate.h
//  appsearch
//
//  Created by Jim on 9/14/10.
//  Copyright Blue Sky Software 2010. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Place.h"
@class FirstViewController;
@class LoginViewController;
@class CenterPhotoViewController;
@class FourthViewController;
@interface AppDelegate : NSObject <UIApplicationDelegate,UIActionSheetDelegate> {
    UITabBarController* myTabBarController;
    FirstViewController *firstview;
    UIButton *centerButton;
    CenterPhotoViewController *centerViewController;
    FourthViewController *fourthView;
}
@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) FirstViewController *firstview;
@property (nonatomic, retain) UIButton *centerButton;
@property (nonatomic, retain) FourthViewController *fourthView;
+ (AppDelegate *)getAppDelegate;
@end

