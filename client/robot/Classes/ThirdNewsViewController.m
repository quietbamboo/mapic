//
//  UserViewController.m
//  template
//
//  Created by apple on 12-7-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ThirdNewsViewController.h"
#import "FourthViewController.h"
#define ANIM_SPEED 0.6
@interface ThirdNewsViewController ()

@end

@implementation ThirdNewsViewController

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
    tabHeaderView = [[[JMTabView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60.)] autorelease];
    [tabHeaderView setDelegate:self];
    [tabHeaderView addTabItemWithTitle:@"Following" icon:[UIImage imageNamed:@"icon1.png"]];
    [tabHeaderView addTabItemWithTitle:@"News" icon:[UIImage imageNamed:@"icon2.png"]];
    //[tabHeaderView addTabItemWithTitle:@"popular" icon:[UIImage imageNamed:@"icon3.png"]];
    //    You can run blocks by specifiying an executeBlock: paremeter
    //    #if NS_BLOCKS_AVAILABLE
    //    [tabView addTabItemWithTitle:@"One" icon:nil executeBlock:^{NSLog(@"abc");}];
    //    #endif
    [tabHeaderView setSelectedIndex:1];
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
    scroller.alwaysBounceVertical = YES;
    scroller.delegate = self;
    
    // add a moveable box
    [self addBox:nil];
    
    //    // add a new MGBox to the MGScrollView
    //    MGStyledBox *box1 = [MGStyledBox box];
    //    [scroller.boxes addObject:box1];
    //    
    //    // add some MGBoxLines to the box
    //    MGBoxLine *head1 =
    //    [MGBoxLine lineWithLeft:@"Left And Right Content" right:nil];
    //    head1.font = headerFont;
    //    [box1.topLines addObject:head1];
    //    
    //    UISwitch *toggle = [[UISwitch alloc] initWithFrame:CGRectZero];
    //    toggle.on = YES;
    //    MGBoxLine *line1 =
    //    [MGBoxLine lineWithLeft:@"NSString and UISwitch" right:toggle];
    //    [box1.topLines addObject:line1];
    
    //    MGStyledBox *box2 = [MGStyledBox box];
    //    [scroller.boxes addObject:box2];
    //    
    //    MGBoxLine *head2 = [MGBoxLine lineWithLeft:@"Multiline Content" right:nil];
    //    head2.font = headerFont;
    //    [box2.topLines addObject:head2];
    //    
    //    NSString *blah = @"Multiline content is automatically sized and formatted "
    //    "given an NSString, UIFont, and desired padding.";
    //    MGBoxLine *multi = [MGBoxLine multilineWithText:blah font:nil padding:24];
    //    [box2.topLines addObject:multi];
    
        [self photomessageControllerArray];
        for (int i = 0;i<photomessageArray.count;i++) {
        MGStyledBox *box5 = [MGStyledBox box];
        [scroller.boxes addObject:box5];
        NSDictionary *nsdic = [photomessageArray objectAtIndex:i];
            //initWithFrame:CGRectMake(10, 0, 300, 80) headString:[nsdic objectForKey:@"head"] footString:[nsdic objectForKey:@"foot"] imageID:[nsdic objectForKey:@"image"]];
           // new.footimageView.image = [UIImage imageNamed:@"andong.jpg"]
        NewsMessageView* new = [[NewsMessageView alloc] initWithFrame:CGRectMake(10, 0, 300, 80) headString:[nsdic objectForKey:@"head"] footString:[nsdic objectForKey:@"foot"] imageID:[nsdic objectForKey:@"image"] imageURL:[nsdic objectForKey:@"imgURL"] image1ID:[nsdic objectForKey:@"imag1ID"] image1URL:[nsdic objectForKey:@"image1URL"]];
        new.footimageView.image = [UIImage imageNamed:@"andong.jpg"];
        new.footlabel.text = [nsdic objectForKey:@"labeltext"];
        new.delegate = self;
        new.numimage = i;
        [box5.topLines addObject:new];
            [new release];
    }
    
    //    MGStyledBox *box3 = [MGStyledBox box];
    //    [scroller.boxes addObject:box3];
    
    //    MGBoxLine *head3 =
    //    [MGBoxLine lineWithLeft:@"NSStrings, UIImages, and UIViews"
    //                      right:nil];
    //    head3.font = headerFont;
    //    [box3.topLines addObject:head3];
    //    
    //    NSString *lineContentWords =
    //    @"Content can be arbitrary arrays of elements.\n\n"
    //    "UIImages are automatically wrapped in UIImageViews and "
    //    "NSStrings are automatically wrapped in UILabels.\n\n"
    //    "Content elements are automatically laid out "
    //    "according to the line's itemPadding and "
    //    "linePadding property values.";
    //    MGBoxLine *wordsLine =
    //    [MGBoxLine multilineWithText:lineContentWords font:nil padding:24];
    //    [box3.topLines addObject:wordsLine];
    //    
    //    UIImage *img = [UIImage imageNamed:@"home"];
    //    NSArray *imgLineLeft =
    //    [NSArray arrayWithObjects:img, @"An NSString after a UIImage", nil];
    //    MGBoxLine *imgLine = [MGBoxLine lineWithLeft:imgLineLeft right:nil];
    //    [box3.topLines addObject:imgLine];
    
    // draw all the boxes and animate as appropriate
    [scroller drawBoxesWithSpeed:ANIM_SPEED];
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


- (void)addBox:(UIButton *)sender {
    MGStyledBox *box = [MGStyledBox box];
    MGBox *parentBox = [self parentBoxOf:sender];
    if (parentBox) {
        int i = [scroller.boxes indexOfObject:parentBox];
        [scroller.boxes insertObject:box atIndex:i + 1];
    } else {
        [scroller.boxes addObject:box];
    }
    
    UIButton *up = [self button:@"up" for:@selector(moveUp:)];
    UIButton *down = [self button:@"down" for:@selector(moveDown:)];
    UIButton *add = [self button:@"add" for:@selector(addBox:)];
    UIButton *remove = [self button:@"remove" for:@selector(removeBox:)];
    UIButton *shuffle = [self button:@"shuffle" for:@selector(shuffle)];
    
    NSArray *left = [NSArray arrayWithObjects:up, down, nil];
    NSArray *right = [NSArray arrayWithObjects:shuffle, remove, add, nil];
    
    MGBoxLine *line = [MGBoxLine lineWithLeft:left right:right];
    [box.topLines addObject:line];
    
    [scroller drawBoxesWithSpeed:ANIM_SPEED];
    [scroller flashScrollIndicators];
}

- (void)removeBox:(UIButton *)sender {
    MGBox *parentBox = [self parentBoxOf:sender];
    [scroller.boxes removeObject:parentBox];
    [scroller drawBoxesWithSpeed:ANIM_SPEED];
}

- (void)moveUp:(UIButton *)sender {
    MGBox *parentBox = [self parentBoxOf:sender];
    int i = [scroller.boxes indexOfObject:parentBox];
    if (!i) {
        return;
    }
    [scroller.boxes removeObject:parentBox];
    [scroller.boxes insertObject:parentBox atIndex:i - 1];
    [scroller drawBoxesWithSpeed:ANIM_SPEED];
}

- (void)moveDown:(UIButton *)sender {
    MGBox *parentBox = [self parentBoxOf:sender];
    int i = [scroller.boxes indexOfObject:parentBox];
    if (i == [scroller.boxes count] - 1) {
        return;
    }
    [scroller.boxes removeObject:parentBox];
    [scroller.boxes insertObject:parentBox atIndex:i + 1];
    [scroller drawBoxesWithSpeed:ANIM_SPEED];
}

- (MGBox *)parentBoxOf:(UIView *)view {
    while (![view.superview isKindOfClass:[MGBox class]]) {
        if (!view.superview) {
            return nil;
        }
        view = view.superview;
    }
    return (MGBox *)view.superview;
}

- (UIButton *)button:(NSString *)title for:(SEL)selector {
UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
[button setTitleColor:[UIColor colorWithWhite:0.9 alpha:0.9]
             forState:UIControlStateNormal];
[button setTitleShadowColor:[UIColor colorWithWhite:0.2 alpha:0.9]
                   forState:UIControlStateNormal];
button.titleLabel.shadowOffset = CGSizeMake(0, -1);
CGSize size = [title sizeWithFont:button.titleLabel.font];
button.frame = CGRectMake(0, 0, size.width + 18, 26);
[button setTitle:title forState:UIControlStateNormal];
[button addTarget:self action:selector
 forControlEvents:UIControlEventTouchUpInside];
button.layer.cornerRadius = 3;
button.backgroundColor = self.view.backgroundColor;
button.layer.shadowColor = [UIColor blackColor].CGColor;
button.layer.shadowOffset = CGSizeMake(0, 1);
button.layer.shadowRadius = 0.8;
button.layer.shadowOpacity = 0.6;
return button;
}

- (void)shuffle {
    NSMutableArray *shuffled =
    [NSMutableArray arrayWithCapacity:[scroller.boxes count]];
    for (id box in scroller.boxes) {
        int i = arc4random() % ([shuffled count] + 1);
        [shuffled insertObject:box atIndex:i];
    }
    scroller.boxes = shuffled;
    [scroller drawBoxesWithSpeed:ANIM_SPEED];
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
            [self.navigationController popViewControllerAnimated:YES];
            [tabHeaderView setSelectedIndex:1];
            break;
            
        case 1:
            notificationView.hidden = YES;
            break;
            
        default:
            break;
    }
}
#pragma mark - initphotomessage

- (void) photomessageControllerArray{
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"All",@"head",@" of us have read thrilling stories in which the  ",@"foot",@"logo.png",@"imgURL",@"18 minutes ago",@"labeltext",@"001",@"image",@"andong.jpg",@"image1URL",@"aaa",@"imag1ID",nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"hero",@"head",@" had only a limited and specified time to live.",@"foot",@"weibo.png",@"imgURL",@"18 minutes ago",@"labeltext",@"003",@"image",@"",@"image1URL",@"",@"imag1ID",nil];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"How",@"head",@" are you. I'm go to shopping. I go home.",@"foot",@"andong.jpg",@"imgURL",@"18 minutes ago",@"labeltext",@"002",@"image",@"andong.jpg",@"image1URL",@"ccc",@"imag1ID",nil];
    photomessageArray = [[NSMutableArray alloc] initWithCapacity:0];
    [photomessageArray addObject:dic1];
    [photomessageArray addObject:dic2];
    [photomessageArray addObject:dic3];
}

- (void) imageID :(NSString *)imageID UIViewType:(ViewType)UIViewType{
    FourthViewController* four = [[FourthViewController alloc] init];
    if(UIViewType == NewsMessageViewtype){
        four.userName = imageID;
    }
    [self.navigationController pushViewController:four animated:YES];
}
- (void) userName :(NSString *)userName UIViewType:(ViewType)UIViewType{
    FourthViewController* four = [[FourthViewController alloc] init];
    if(UIViewType == NewsMessageViewtype){
        four.userName = userName;
    }
    [self.navigationController pushViewController:four animated:YES];
}

@end

