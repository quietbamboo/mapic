//
//  appsearchAppDelegate.h
//  appsearch
//
//  Created by Jim on 9/14/10.
//  Copyright Blue Sky Software 2010. All rights reserved.
//


#import <UIKit/UIKit.h>
@class FirstViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
   UITabBarController* m_TarBarController;
}
@property (nonatomic, retain) UIWindow *window;
//@property (nonatomic, retain) UINavigationController *navigationController;

@end

