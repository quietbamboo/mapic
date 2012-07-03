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
#define kSDK_KEY @"fbd22af151f7a5f25abb5ecd23664315"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AppDelegate
@synthesize window = _window;
//@synthesize navigationController = _navigationController;
- (void)dealloc
{
   [_window release];
//    [_navigationController release];
//    [window release];
    
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    [self initTarBarController];
    [self.window addSubview:m_TarBarController.view];
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)initTarBarController{
	m_TarBarController = [[UITabBarController alloc]init];
	
	
	
    
	
	
	
	FirstViewController* firstview = [[FirstViewController alloc]init];
	UINavigationController* firstviewNav = [[UINavigationController alloc] initWithRootViewController:firstview];
    firstviewNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"first" image:[UIImage imageNamed:@"tab-explore"] tag:0];
	//[zoekenviewNav release];
    
	LocationlistViewController* locaview = [[LocationlistViewController alloc]init];
	//UINavigationController* trefwoordenviewNav = [[UINavigationController alloc] initWithRootViewController:trefwoordenview];
    locaview.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"详细" image:[UIImage imageNamed:@"tab_live"] tag:1];
    
    UIViewController *centerview = [[UIViewController alloc]init];
	//UINavigationController* afvalsoortenviewNav = [[UINavigationController alloc]initWithRootViewController:afvalsoortenview];
	centerview.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:nil tag:2];
    
    UIViewController *fourview = [[UIViewController alloc]init];
    fourview.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"four" image:[UIImage imageNamed:@"tab-explore"] tag:3];
    
    SettingViewController* settingview = [[SettingViewController alloc]init];
	settingview.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Setting" image:[UIImage imageNamed:@"tab_feed_profile.png"] tag:4];
    
    
	NSArray* Controllers = [NSArray arrayWithObjects:firstviewNav,locaview,centerview,fourview,settingview,nil];
	
	m_TarBarController.viewControllers = Controllers;
	
	[centerview release];
	[fourview release];
    [settingview release];
	[locaview release];
	[firstview release];
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
