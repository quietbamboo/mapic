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

@interface AppDelegate : NSObject <UIApplicationDelegate,UIActionSheetDelegate> {
    UITabBarController* myTabBarController;
    FirstViewController *firstview;
    LoginViewController *loginview;
    UIButton *centerButton;
    CenterPhotoViewController *centerViewController;
}
@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) FirstViewController *firstview;
@property (nonatomic, retain) LoginViewController *loginview;
@property (nonatomic, retain) UIButton *centerButton;
+ (AppDelegate *)getAppDelegate;
@end

