//
//  UserViewController.m
//  template
//
//  Created by apple on 12-7-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UITableView *tableview= [[UITableView alloc] initWithFrame:CGRectMake(0,0, 320, 421) style:UITableViewStylePlain];
    tableview.separatorStyle = UITableViewStyleGrouped;
    //tableview.separatorColor = [UIColor blackColor];
    [tableview setDelegate:self];
    [tableview setDataSource:self];
    [self.view addSubview: tableview];
    
    [tableview release];
}
- (id)init {
    self = [super init];
    return self;
}
- (void)loadView {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    [contentView release];
}
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [AppDelegate getAppDelegate].centerButton.hidden = NO;
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
#pragma mark
#pragma mark UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";  
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:  
                             SimpleTableIdentifier];  
    if (cell == nil) {    
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
                                       reuseIdentifier:SimpleTableIdentifier] autorelease];  
    }
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    cell.imageView.image = [UIImage imageNamed:@"reset.png"];
    cell.textLabel.text = @"label0";
    cell.detailTextLabel.text = @"detailTextLabel0";
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}
#pragma mark
#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"this is user");
    HjxPhotoViewController *hjxPhotoview = [[HjxPhotoViewController alloc] initWithNibName:nil bundle:nil];
    switch (indexPath.row) {
        case 0:
             hjxPhotoview.clicked = @"tt://photo/top";
            break;
        case 1:
            hjxPhotoview.clicked = @"tt://photo/random";
            break;
        case 2:
            hjxPhotoview.clicked = @"tt://photo/hd";
            break;
        case 3:
            hjxPhotoview.clicked = @"tt://photo/my";
            break;
        case 4:
            hjxPhotoview.clicked = @"tt://photo/like";
            break;
        case 5:
            hjxPhotoview.clicked = @"tt://photo/recent.like";
            break;
        default:
            break;
    }

    self.navigationController.navigationBarHidden = NO;
    [AppDelegate getAppDelegate].centerButton.hidden = YES;
    [self.navigationController pushViewController:hjxPhotoview animated:YES];
    [hjxPhotoview release];
}
@end
