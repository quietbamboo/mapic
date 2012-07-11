//
//  testBubbleChatAppDelegate.m
//  testBubbleChat
//
//  Created by Transparentmask on 09-5-12.
//  Copyright Autonavi 2009. All rights reserved.
//

#import "testBubbleChatAppDelegate.h"
#import "RootViewController.h"


@implementation testBubbleChatAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	RootViewController *rootController = [[RootViewController alloc] init];
	navigationController = [[UINavigationController alloc] initWithRootViewController:rootController];
	[rootController release];
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
