//
//  appsearchAppDelegate.m
//  appsearch
//
//  Created by Jim on 9/14/10.
//  Copyright Blue Sky Software 2010. All rights reserved.


#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SettingViewController.h"
#import "DeatilViewController.h"
#import "CameraViewController.h"
#import "LocationlistViewController.h"
#import "UserViewController.h"
#define kSDK_KEY @"fbd22af151f7a5f25abb5ecd23664315"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AppDelegate
@synthesize window = _window;
@synthesize firstview = _firstview;
@synthesize centerButton = _centerButton;
- (void)dealloc
{
    [myTabBarController release];
    [_firstview release];
    [_centerButton release];
    [_window release];
    [super dealloc];
}
- (void) alertActionSheet{  
    UIActionSheet *actionsheet= [[UIActionSheet alloc] initWithTitle:@"分享照片" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"照相",@"图片库", nil];
    [actionsheet showInView:myTabBarController.view];
    [actionsheet release];
}

-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
{
    _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _centerButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    _centerButton.frame = CGRectMake((self.window.frame.size.width - buttonImage.size.width)/2 , (self.window.frame.size.height - buttonImage.size.height), buttonImage.size.width, buttonImage.size.height);
    [_centerButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [_centerButton setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [_centerButton addTarget:self action:@selector(alertActionSheet) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_centerButton];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    [self initTarBarController];
    [self.window addSubview:myTabBarController.view];
    // Create a custom UIButton and add it to the center of our tab bar
    [self addCenterButtonWithImage:[UIImage imageNamed:@"camera_button_take.png"] highlightImage:[UIImage imageNamed:@"tabBar_cameraButton_ready_matte.png"]];
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)initTarBarController{
    myTabBarController = [[UITabBarController alloc]init];
	_firstview = [[FirstViewController alloc]init];
	UINavigationController* firstviewNav = [[UINavigationController alloc] initWithRootViewController:_firstview];
    firstviewNav.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"first" image:[UIImage imageNamed:@"tab-explore"] tag:0] autorelease];
    
	LocationlistViewController* locaview = [[LocationlistViewController alloc]init];
    UINavigationController* locaviewNav = [[UINavigationController alloc] initWithRootViewController:locaview];
    locaviewNav.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"详细" image:[UIImage imageNamed:@"tab_live"] tag:1]autorelease];
    
    UIViewController *centerview = [[UIViewController alloc]init];

	centerview.tabBarItem = [[[UITabBarItem alloc] initWithTitle:nil image:nil tag:2] autorelease];
    
    UserViewController *userview = [[UserViewController alloc] init];
    userview.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"four" image:[UIImage imageNamed:@"tab-explore"] tag:3] autorelease];
    
    SettingViewController* settingview = [[SettingViewController alloc]init];
	settingview.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Setting" image:[UIImage imageNamed:@"tab_feed_profile.png"] tag:4] autorelease];
    
	NSArray* Controllers = [NSArray arrayWithObjects:firstviewNav,locaviewNav,centerview,userview,settingview,nil];
	
	myTabBarController.viewControllers = Controllers;
	
	[centerview release];
	[userview release];
    [settingview release];
	[locaview release];
	
    [firstviewNav release];
    [locaviewNav release];
}


#pragma mark
#pragma mark UIActionSheetDelegate Methods
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [_firstview showCamera];
    }else if (buttonIndex == 1) {
        [_firstview showPhotos];
    }

}

+ (AppDelegate *)getAppDelegate {
	return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
@end
