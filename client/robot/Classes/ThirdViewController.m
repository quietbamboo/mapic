//
//  UserViewController.m
//  template
//
//  Created by apple on 12-7-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ThirdViewController.h"
#import "FourthViewController.h"
#define ANIM_SPEED 0.6
@interface ThirdViewController ()

@end

@implementation ThirdViewController


#pragma mark - Default Methods
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
    contentView.backgroundColor = [UIColor colorWithRed:0.29 green:0.32 blue:0.35 alpha:1]; 
    self.view = contentView;
    [contentView release];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    thirdnews = [[ThirdNewsViewController alloc] init];
    tabHeaderView = [[[JMTabView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60.)] autorelease];
    [tabHeaderView setDelegate:self];
    [tabHeaderView addTabItemWithTitle:@"Following" icon:[UIImage imageNamed:@"icon1.png"]];
    [tabHeaderView addTabItemWithTitle:@"News" icon:[UIImage imageNamed:@"icon2.png"]];
    //[tabHeaderView addTabItemWithTitle:@"popular" icon:[UIImage imageNamed:@"icon3.png"]];
    //    You can run blocks by specifiying an executeBlock: paremeter
    //    #if NS_BLOCKS_AVAILABLE
    //    [tabView addTabItemWithTitle:@"One" icon:nil executeBlock:^{NSLog(@"abc");}];
    //    #endif
    [tabHeaderView setSelectedIndex:0];
    [self.view addSubview:tabHeaderView];
    
    //	// Do any additional setup after loading the view.
    //    UITableView *tableview= [[UITableView alloc] initWithFrame:CGRectMake(0,60, 320, 371) style:UITableViewStylePlain];
    //    tableview.separatorStyle = UITableViewStyleGrouped;
    //    //tableview.separatorColor = [UIColor blackColor];
    //    [tableview setDelegate:self];
    //    [tableview setDataSource:self];
    //    [self.view addSubview: tableview];  
    //    [tableview release];
    //     // sue me, Gruber!
    
    UIFont *headerFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16];
    
    // make an MGScrollView for holding boxes
    CGRect frame = CGRectMake(0, 60, 320, 371);
    scroller = [[MGScrollView alloc] initWithFrame:frame];
    [self.view addSubview:scroller];
    scroller.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    scroller.alwaysBounceVertical = YES;
    scroller.delegate = self;
    
    
    [self praiseImageArray];
    
    for (NSInteger i = 0; imgArray.count > i ; i++) {
        NSDictionary *nsdic = [imgArray objectAtIndex:i];
        if ([[nsdic objectForKey:@"DisplayType"] isEqualToString:@"Attention"]) {
            MGStyledBox *box1 = [MGStyledBox box];
            [scroller.boxes addObject:box1];
            AttentionView* attention = [[AttentionView alloc] initWithFrame:CGRectMake(0, 0, 300, 90) allText:[nsdic objectForKey:@"Information"] attentionArray:[nsdic objectForKey:@"clickTextArray"] timestring:[nsdic objectForKey:@"time"]];
            attention.delegate = self;
            [box1.topLines addObject:attention];
            [attention release];
        }else if ([[nsdic objectForKey:@"DisplayType"] isEqualToString:@"Praise"]) {
            MGStyledBox *box2 = [MGStyledBox box];
            [scroller.boxes addObject:box2];
            PraiseView* praise = [[PraiseView alloc] initWithFrame:CGRectMake(0, 0, 300, 70) praiseArray:[nsdic objectForKey:@"clickTextArray"] imageArray:[nsdic objectForKey:@"Photos"] timestring:[nsdic objectForKey:@"time"]];
            praise.delegate = self;
            [box2.topLines addObject:praise];
            [praise release];
        }else if ([[nsdic objectForKey:@"DisplayType"] isEqualToString:@"Ontop"]) {
            MGStyledBox *box3 = [MGStyledBox box];
            [scroller.boxes addObject:box3];
            OnTopView* ontop = [[OnTopView alloc] initWithFrame:CGRectMake(0, 0, 300, 80) praiseArray:[nsdic objectForKey:@"clickTextArray"] imageArray:[nsdic objectForKey:@"Photos"] timestring:[nsdic objectForKey:@"time"]];
            ontop.delegate = self;
            [box3.topLines addObject:ontop];
            [ontop release];
        }else if ([[nsdic objectForKey:@"DisplayType"] isEqualToString:@"PraisePhoto"]) {
            MGStyledBox *box4 = [MGStyledBox box];
            [scroller.boxes addObject:box4];
            PraisePhotoView* pp = [[PraisePhotoView alloc] initWithFrame:CGRectMake(0, 0, 300, 80) praiseArray:[nsdic objectForKey:@"clickTextArray"] imageArray:[nsdic objectForKey:@"Photos"] timestring:[nsdic objectForKey:@"time"]];
            pp.delegate = self;
            [box4.topLines addObject:pp];
            [pp release];
        }
        
    }
    
    
    // draw all the boxes and animate as appropriate
    [scroller drawBoxesWithSpeed:0];
    [scroller flashScrollIndicators];
    
    notificationView = [[NotificationView alloc] initWithFrame:CGRectMake(154, 385, 140, 47)];
    notificationView.userLabel.text =@"1";
    notificationView.messageLabel.text = @"2";
    notificationView.likeLabel.text = @"3";
    [self.view addSubview:notificationView];
    [notificationView release];
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


#pragma mark - UIScrollViewDelegate (for snapping boxes to edges)

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [(MGScrollView *)scrollView snapToNearestBox];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        [(MGScrollView *)scrollView snapToNearestBox];
    }
}

#pragma mark
#pragma mark JMTabViewDelegate Method
-(void)tabView:(JMTabView *)tabView didSelectTabAtIndex:(NSUInteger)itemIndex;
{
    switch (itemIndex) {
        case 0:
            notificationView.hidden = NO;
            break;
            
        case 1:
            [self.navigationController pushViewController:thirdnews animated:NO];
            [tabHeaderView setSelectedIndex:0];
            break;
            
        default:
            break;
    }
}
#pragma mark - initphotomessage

- (void) praiseImageArray{
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"logo.png",@"imagID",@"logo.png",@"username",nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"weibo.png",@"imagID",@"weibo.png",@"username",nil];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"andong.jpg",@"imagID",@"andong.jpg",@"username",nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"Icon.png",@"imagID",@"Icon.png",@"username",nil];
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:@"andong.jpg",@"imagID",@"andong.jpg",@"username",nil];
    
    NSMutableArray* imgs4 = [[NSMutableArray alloc] initWithCapacity:0];
    [imgs4 addObject:dic1];
    [imgs4 addObject:dic2];
    [imgs4 addObject:dic3];
    [imgs4 addObject:dic4];
    [imgs4 addObject:dic5];
    
    NSMutableArray* imgs3 = [[NSMutableArray alloc] initWithCapacity:0];
    [imgs3 addObject:dic1];

    NSMutableArray* imgs2 = [[NSMutableArray alloc] initWithCapacity:0];
    [imgs2 addObject:dic3];
    
    NSArray* user1 = [[NSArray alloc] initWithObjects:@"成功",@"红玫瑰", nil];
    NSArray* user2 = [[NSArray alloc] initWithObjects:@"Juny",@"LiLi", nil];
    NSArray* user3 = [[NSArray alloc] initWithObjects:@"BeiJing", nil];
    NSArray* user4 = [[NSArray alloc] initWithObjects:@"LiLi", nil];
    
    NSDictionary *d1 = [NSDictionary dictionaryWithObjectsAndKeys:@"Attention",@"DisplayType",@"成功是你梦寐以求的那朵红玫瑰",@"Information",user1,@"clickTextArray",@"",@"Photos",@"30分钟前",@"time",nil];
    NSDictionary *d2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Praise",@"DisplayType",@"",@"Information",user2,@"clickTextArray",imgs2,@"Photos",@"1 个小时前",@"time",nil];
    NSDictionary *d3 = [NSDictionary dictionaryWithObjectsAndKeys:@"Ontop",@"DisplayType",@"",@"Information",user3,@"clickTextArray",imgs3,@"Photos",@"1.5 个小时前",@"time",nil];
    NSDictionary *d4 = [NSDictionary dictionaryWithObjectsAndKeys:@"PraisePhoto",@"DisplayType",@"",@"Information",user4,@"clickTextArray",imgs4,@"Photos",@"2 个小时前",@"time",nil];
    imgArray = [[NSMutableArray alloc] initWithCapacity:0];
    [imgArray addObject:d1];
    [imgArray addObject:d2];
    [imgArray addObject:d3];
    [imgArray addObject:d4];
}

- (void) imageID :(NSString *)imageID UIViewType:(ViewType)UIViewType{
    FourthViewController* four = [[FourthViewController alloc] init];
    if (UIViewType == PraisePhotoViewtype) {
        four.userName = imageID;
    }else if(UIViewType == PraiseViewtype ){
        four.userName = imageID;
    }else if(UIViewType == OnTopViewtype){
        four.userName = imageID;
    }
    four.isYES = @"isYES";
    [self.navigationController pushViewController:four animated:YES];
    [four release];
}
- (void) userName :(NSString *)userName UIViewType:(ViewType)UIViewType{
    FourthViewController* four = [[FourthViewController alloc] init];
    if (UIViewType == PraisePhotoViewtype) {
        four.userName = userName;
    }else if(UIViewType == PraiseViewtype ){
        four.userName = userName;
    }else if(UIViewType == OnTopViewtype){
        four.userName = userName;
    }else if(UIViewType == AttentionViewtype){
        four.userName = userName;
    }
    four.isYES = @"isYES";
    [self.navigationController pushViewController:four animated:YES];
    [four release];
}
#pragma mark - ASIHTTPRequestDelegate

- (void)thirdviewRequest
{
    NSURL *url = [NSURL URLWithString:@"http://allseeing-i.com"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDelegate:self];
    [request setRequestMethod:@"POST"];
    [request setPostValue:@"" forKey:@""];
    [request startAsynchronous];
    _MBProgress = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _MBProgress.labelText = @"";
    [_MBProgress show:YES];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    [_MBProgress hide:YES];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    [_MBProgress hide:YES];
}

@end

