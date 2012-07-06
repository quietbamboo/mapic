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
    scrollview.contentSize = CGSizeMake(320,sizeheight + 490);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel *titleText = [[UILabel alloc] initWithFrame: CGRectMake(100, 0, 200, 50)];
    titleText.backgroundColor = [UIColor clearColor];
    titleText.textColor=[UIColor whiteColor];
    [titleText setFont:[UIFont systemFontOfSize:14]];
    [titleText setText:endPlace.name];
    titleText.textAlignment = UITextAlignmentCenter;
    
    self.navigationItem.titleView = titleText;
    
    

    //self.title = titleText.text;//endPlace.name;
    [titleText release];
    UIBarButtonItem *btnRoute = [[UIBarButtonItem alloc] 
                                   initWithTitle:@"路线"                                            
                                   style:UIBarButtonItemStyleBordered 
                                   target:self 
                                   action:@selector(toWriteRoute)];
    self.navigationItem.rightBarButtonItem = btnRoute;
    [btnRoute release];
    
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 387)];
    scrollview.backgroundColor=[UIColor colorWithRed:0.859f green:0.886f blue:0.929f alpha:1.0f];
    scrollview.contentMode = UIViewContentModeScaleToFill;

    scrollview.pagingEnabled = YES;
    scrollview.scrollEnabled = YES;
    scrollview.showsVerticalScrollIndicator = YES;
    scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.delegate = self;
    [self.view addSubview:scrollview];
    
    UILabel *textlabel=[[UILabel alloc] initWithFrame:CGRectMake(0.0f, 5.0f, 60.0f, 20.0f)];
    textlabel.font=[UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    textlabel.textColor=[UIColor blueColor];
    textlabel.text = NSLocalizedString(@"简介：", nil);
    textlabel.textAlignment = UITextAlignmentCenter;
    textlabel.backgroundColor = [UIColor clearColor];
    [scrollview addSubview:textlabel];
    [textlabel release];
    
    UILabel *bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
    bubbleText.backgroundColor = [UIColor clearColor];
    bubbleText.font = [UIFont systemFontOfSize:13];
    bubbleText.text = [NSString stringWithFormat:@"%@%@",@"       ",endPlace.description];    
    bubbleText.numberOfLines = 0;
    
    CGSize ssize = [bubbleText.text sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:CGSizeMake(320.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
    CGRect rct = bubbleText.frame;
    rct.size = ssize;
    bubbleText.frame = rct;
    sizeheight = ssize.height;
    bubbleText.center = CGPointMake(160, sizeheight/2 + 27);
    
    [scrollview addSubview: bubbleText];
    [bubbleText release];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, sizeheight + 30, 320, 460)];
    imageview.image = [UIImage imageNamed:@"andong.jpg"];
    [scrollview addSubview:imageview];
    [imageview release];
    
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
