//
//  PhotoMessageViewController.m
//  template
//
//  Created by yujie liu on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PhotoMessageViewController.h"

@interface PhotoMessageViewController ()

@end

@implementation PhotoMessageViewController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    [super loadView];
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *btnDBSignupView = [[UIBarButtonItem alloc] 
                                        initWithTitle:@"完成"                                            
                                        style:UIBarButtonItemStyleBordered 
                                        target:self 
                                        action:@selector(closeButtonPressed)];
     self.navigationItem.rightBarButtonItem = btnDBSignupView;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 40, 30)];
    label.text = @"ni hao ";
    [self.view addSubview:label];
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



- (void)closeButtonPressed {
	[delegate modalControllerDidFinish:self];
}

@end
