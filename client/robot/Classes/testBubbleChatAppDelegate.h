//
//  testBubbleChatAppDelegate.h
//  testBubbleChat
//
//  Created by Transparentmask on 09-5-12.
//  Copyright Autonavi 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface testBubbleChatAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;

@end

