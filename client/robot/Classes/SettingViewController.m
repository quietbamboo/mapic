//
//  SettingViewController.m
//  template
//
//  Created by apple on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) loadView {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    [contentView release];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"setting";
    UITableView *tableview= [[UITableView alloc] initWithFrame:CGRectMake(0,0, 320, 436) style:UITableViewStylePlain];
    tableview.separatorStyle = UITableViewStyleGrouped;
    //tableview.separatorColor = [UIColor blackColor];
    [tableview setDelegate:self];
    [tableview setDataSource:self];
    [self.view addSubview: tableview];
    [tableview release];
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
#pragma mark Table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";  
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:  
                             SimpleTableIdentifier];  
    if (cell == nil) {    
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
                                       reuseIdentifier:SimpleTableIdentifier] autorelease];  
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.text = @"this is setting";
            UISwitch *uiswitch = [[UISwitch alloc] initWithFrame:CGRectMake(210, 8, 100, 44)];
            [cell.contentView addSubview:uiswitch];
            [uiswitch release];
    
    return cell;
}
@end
