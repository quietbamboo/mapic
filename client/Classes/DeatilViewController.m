//
//  DeatilViewController.m
//  template
//
//  Created by yujie liu on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DeatilViewController.h"

@interface DeatilViewController ()

@end

@implementation DeatilViewController
@synthesize delegate = _delegate;
@synthesize endPlace;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)toWriteRoute{
    [_delegate directionsViewController:self toPlace:endPlace];
}
- (void)toCloseSelf{
    [_delegate directionsViewControllerDidCancel:self];
}



- (void) loadView {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    [contentView release];
}
- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Deatil";
    
    UIBarButtonItem *btnRoute = [[UIBarButtonItem alloc] 
                                   initWithTitle:@"路线"                                            
                                   style:UIBarButtonItemStyleBordered 
                                   target:self 
                                   action:@selector(toWriteRoute)];
    self.navigationItem.rightBarButtonItem = btnRoute;
    [btnRoute release];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
