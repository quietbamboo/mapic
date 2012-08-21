//
//  SettingViewController.m
//  template
//
//  Created by apple on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FourthViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "TTTQuadrantControl.h"
#import "ImagePickeViewController.h"
#import "LoginViewController.h"
enum {
	InformationSectionIndex,
} ProfileSectionIndicies;

enum {
	BioRowIndex,
	LocationRowIndex,
	WebsiteRowIndex,
} InformationSectionRowIndicies;
@interface FourthViewController ()

@end

@implementation FourthViewController
@synthesize userName;
@synthesize quadrantControl = _quadrantControl;
@synthesize isYES;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([AppDelegate getAppDelegate].fourthView == self)  {
        [AppDelegate getAppDelegate].centerButton.hidden = NO;
    }else {
        self.title  = self.userName;
        if ([self.isYES isEqualToString:@"isYES"]) {
            [AppDelegate getAppDelegate].centerButton.hidden = NO;
        }
    }
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:(1.0/255.0) green:(1.0 / 255.0) blue:(1.0 / 255.0) alpha:1];
}
- (void) loadView {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    [contentView release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"User";
    UITableView *tableview= [[UITableView alloc] initWithFrame:CGRectMake(0,0, 320, 436) style:UITableViewStyleGrouped];
    tableview.separatorStyle = UITableViewStyleGrouped;
    //tableview.separatorColor = [UIColor blackColor];
    tableview.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    [tableview setDelegate:self];
    [tableview setDataSource:self];
    
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 90)];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(50, 25, 50, 50)];
    imageview.image = [UIImage imageNamed:@"mattt.png"];
    [header addSubview:imageview];
    [imageview release];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(120.0, 25.0, 200.0, 20.0)];
    label1.text = @"Mattt Thompson";
    label1.backgroundColor = [UIColor clearColor];
    label1.font = [UIFont systemFontOfSize:15];
    [header addSubview:label1];
    [label1 release];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(120.0, 45.0, 100.0, 20.0)];
    label2.text = @"Mattt Thompson";
    label2.font = [UIFont systemFontOfSize:10];
    label2.backgroundColor = [UIColor clearColor];
    [header addSubview:label2];
    [label2 release];
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(120.0, 65.0, 100.0, 15.0)];
    label3.text = @"Mattt Thompson";
    label3.font = [UIFont systemFontOfSize:10];
    label3.backgroundColor = [UIColor clearColor];
    [header addSubview:label3];
    [label3 release];
    
    tableview.tableHeaderView = header;
    [header release];
    
    // Do any additional setup after loading the view.
    //self.tableView.rowHeight = 44.0f;
	
    //	self.avatarImageView.layer.cornerRadius = 8.0f;
    //	self.avatarImageView.layer.borderWidth = 1.0f;
    //	self.avatarImageView.layer.masksToBounds = YES;
    //	self.avatarImageView.layer.borderColor = [[UIColor clearColor] CGColor];
    UIView *foot = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 320, 100)];
    _quadrantControl = [[TTTQuadrantControl alloc] initWithFrame:CGRectMake(10, 2, 300, 100)];
    self.quadrantControl.delegate = self;
	//_quadrantControl.delegate = self;
    //TTTQuadrantLocation *t = [[TTTQuadrantView alloc] ];
	[self.quadrantControl setNumber:[NSNumber numberWithInt:190]
                            caption:@"following"
                             action:@selector(didSelectFollowingQuadrant)
                        forLocation:TopLeftLocation];
	
	[self.quadrantControl setNumber:[NSNumber numberWithInt:2969]
                            caption:@"tweets" 
                             action:@selector(didSelectTweetsQuadrant)
                        forLocation:TopRightLocation];
	
	[self.quadrantControl setNumber:[NSNumber numberWithInt:1013]
                            caption:@"followers" 
                             action:@selector(didSelectFollowersQuadrant)
                        forLocation:BottomLeftLocation];
	
	[self.quadrantControl setNumber:[NSNumber numberWithInt:115] 
                            caption:@"listed" 
                             action:@selector(didSelectListedQuadrant)
                        forLocation:BottomRightLocation];
    [foot addSubview:self.quadrantControl];
    tableview.tableFooterView = foot;
    //[ttt release];
    [foot release];
    
    [self.view addSubview: tableview];
    [tableview release];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    _quadrantControl = nil;
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)dealloc {
	[_quadrantControl release];
    [super dealloc];
}
#pragma mark - Actions

- (void)didSelectFollowingQuadrant {
	NSLog(@"Following");
}

- (void)didSelectTweetsQuadrant {
	NSLog(@"Tweets");
}

- (void)didSelectFollowersQuadrant {
	NSLog(@"Followers");
}

- (void)didSelectListedQuadrant {
	NSLog(@"Listed");
}
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            return 77.0f;
        default:
            return 44.0f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = nil;
	
	switch (indexPath.row) {
		case 0:
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
										   reuseIdentifier:nil] autorelease];
			cell.textLabel.text = NSLocalizedString(@"Hacker from the Rustbelt, living in Austin, TX. iOS Developer at @gowalla, and co-founder of @austinrb", nil);
			cell.textLabel.font = [UIFont systemFontOfSize:14];
            cell.textLabel.numberOfLines = 0;
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			break;
		case 1:
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 
										   reuseIdentifier:nil] autorelease];
			cell.textLabel.text = NSLocalizedString(@"location", nil);
			cell.detailTextLabel.text = NSLocalizedString(@"Austin, TX", nil);
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			break;
		case 2:
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 
										   reuseIdentifier:nil] autorelease];
			cell.textLabel.text = @"web";
			cell.detailTextLabel.text = @"http://mattt.me";
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			break;
	}
	
	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    LoginViewController* loginview = [[LoginViewController alloc] init];
    UINavigationController* loginnav = [[UINavigationController alloc] initWithRootViewController:loginview];
    [self presentModalViewController:loginnav animated:YES];
}

#pragma mark - ASIHTTPRequestDelegate

- (void)fourthviewRequest
{
    NSURL *url = [NSURL URLWithString:@"http://allseeing-i.com"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDelegate:self];
    [request setRequestMethod:@"POST"];
    [request setPostValue:@"" forKey:@""];
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
}

@end
