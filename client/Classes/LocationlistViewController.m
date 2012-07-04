//
//  LocationlistViewController.m
//  template
//
//  Created by yujie liu on 12-7-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LocationlistViewController.h"

@interface LocationlistViewController ()

@end

@implementation LocationlistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
	// Do any additional setup after loading the view.
    UITableView *tableview= [[UITableView alloc] initWithFrame:CGRectMake(0,0, 320, 436) style:UITableViewStylePlain];
    tableview.separatorStyle = UITableViewStyleGrouped;
    //tableview.separatorColor = [UIColor blackColor];
    [tableview setDelegate:self];
    [tableview setDataSource:self];
    [self.view addSubview: tableview];
    [tableview release];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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
    cell.imageView.image = [UIImage imageNamed:@"SFIcon.png"];
    // cell.imageView.highlightedImage = [UIImage imageNamed:@"flag.png"];//选中cell后的图片  
    cell.textLabel.text = @"This Good wids";
    cell.detailTextLabel.text = @"Andy-清风";
    UILabel *desclabel = [[UILabel alloc]initWithFrame:CGRectMake(195.0, 2.0, 80.0, 56.0)];
    desclabel.text = @"This is a good place, you can go there!";   
    
    [cell.contentView addSubview:desclabel];
    [desclabel release];
    desclabel.font = [UIFont boldSystemFontOfSize:12];     
    desclabel.textColor = [UIColor purpleColor];         
    desclabel.textAlignment = UITextAlignmentLeft; 
    desclabel.numberOfLines = 3;
    desclabel.lineBreakMode = UILineBreakModeTailTruncation;
    return cell;  
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}
#pragma mark
#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"this good 1");
    DeatilViewController *detail = [[DeatilViewController alloc] init];
    detail.delegate = [self.tabBarController.viewControllers objectAtIndex:0];
    Place *place = [[Place alloc] init];
    place.name = @"清河北大";
    place.image = [UIImage imageNamed:@"andong.jpg"];
    place.description = nil;
    place.longitude = 116.319281;
    place.latitude = 39.936996;
    detail.endPlace = place;
    [self.navigationController pushViewController:detail animated:YES];
    [detail release];
    [place release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
