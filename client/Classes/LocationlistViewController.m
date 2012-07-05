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

#pragma mark 
#pragma mark DirectionsViewControllerDelegate methods

- (void)directionsViewControllerDidCancel:(DeatilViewController *)viewController{
    
}

- (void)directionsViewController:(DeatilViewController *)viewController toPlace:(Place *)endPlace{
    [viewController.navigationController popViewControllerAnimated:YES];
    [(FirstViewController *)[[AppDelegate getAppDelegate] firstview] showRouteLine:endPlace];
    self.tabBarController.selectedIndex = 0;
}

#pragma mark
#pragma mark initNSMUtable
-(void)initNStableArray{

    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1500],@"Distance",@"flag.png",@"image",[NSNumber numberWithDouble:39.946996],@"lat",[NSNumber numberWithDouble:116.339281],@"lon",@"名字1",@"name",@"简介1",@"dec",nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1200],@"Distance",@"flag.png",@"image",[NSNumber numberWithDouble:39.966996],@"lat",[NSNumber numberWithDouble:116.329281],@"lon",@"名字2",@"name",@"简介2",@"dec",nil];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1100],@"Distance",@"reset.png",@"image",[NSNumber numberWithDouble:39.976996],@"lat",[NSNumber numberWithDouble:116.359281],@"lon",@"名字3",@"name",@"简介3",@"dec",nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1300],@"Distance",@"reset.png",@"image",[NSNumber numberWithDouble:37.775812],@"lat",[NSNumber numberWithDouble:-122.406403],@"lon",@"名字3",@"name",@"简介3",@"dec",nil];
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1400],@"Distance",@"flag.png",@"image",[NSNumber numberWithDouble:37.775812],@"lat",[NSNumber numberWithDouble:-122.426403],@"lon",@"名字3",@"name",@"简介3",@"dec",nil];
    NSDictionary *dic6 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1600],@"Distance",@"flag.png",@"image",[NSNumber numberWithDouble:37.775812],@"lat",[NSNumber numberWithDouble:-122.416403],@"lon",@"名字3",@"name",@"简介3",@"dec",nil];
    nsArray = [[NSMutableArray alloc] initWithCapacity:0];
    [nsArray addObject:dic1];
    [nsArray addObject:dic2];
    [nsArray addObject:dic3];
    [nsArray addObject:dic4];
    [nsArray addObject:dic5];
    [nsArray addObject:dic6];
    
}


#pragma mark
#pragma mark UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [nsArray count];
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
//    Place *place = [[Place alloc] init];
    NSDictionary *nsdic = [nsArray objectAtIndex:indexPath.row];
//    place.btnTag = i;
//    place.name = [nsdic objectForKey:@"name"];
//    place.image = [UIImage imageNamed:[nsdic objectForKey:@"image"]];
//    place.latitude = [(NSNumber *)[nsdic objectForKey:@"lat"] doubleValue];
//    place.longitude = [(NSNumber *)[nsdic objectForKey:@"lon"] doubleValue];
//    place.description = [NSString stringWithFormat:@"%@:%f",[nsdic objectForKey:@"dec"],[nsdic objectForKey:@"Distance"]];
//    PlaceMark *placeMark = [[PlaceMark alloc] initWithPlace:place];
//    [self.mainMapView addAnnotation:placeMark];
//    [place release];
//    [placeMark release];
    cell.imageView.image = [UIImage imageNamed:[nsdic objectForKey:@"image"]];
    // cell.imageView.highlightedImage = [UIImage imageNamed:@"flag.png"];//选中cell后的图片  
    cell.textLabel.text = [nsdic objectForKey:@"name"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"距离:%d",[(NSNumber *)[nsdic objectForKey:@"Distance"] intValue]];
    UILabel *desclabel = [[UILabel alloc]initWithFrame:CGRectMake(195.0, 2.0, 80.0, 56.0)];
    desclabel.text = [nsdic objectForKey:@"dec"];   
    
    desclabel.font = [UIFont boldSystemFontOfSize:12];     
    desclabel.textColor = [UIColor purpleColor];         
    desclabel.textAlignment = UITextAlignmentLeft; 
    desclabel.numberOfLines = 3;
    desclabel.lineBreakMode = UILineBreakModeTailTruncation;
    [cell.contentView addSubview:desclabel];
    [desclabel release];
    
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
    detail.delegate = self;
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
 
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initNStableArray];
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


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
