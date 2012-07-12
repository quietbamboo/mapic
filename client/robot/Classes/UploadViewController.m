//
//  UploadViewController.m
//  template
//
//  Created by yujie liu on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UploadViewController.h"

@interface UploadViewController ()

@end

@implementation UploadViewController
@synthesize image;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    [contentView release];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    scrollview.contentSize = CGSizeMake(320,900);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *btnRoute = [[UIBarButtonItem alloc] 
                                 initWithTitle:@"取消"                                            
                                 style:UIBarButtonItemStyleBordered 
                                 target:self 
                                 action:@selector(toWriteRoute)];
    self.navigationItem.rightBarButtonItem = btnRoute;
    [btnRoute release];
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    scrollview.backgroundColor=[UIColor colorWithRed:0.859f green:0.886f blue:0.929f alpha:1.0f];
    //scrollview.backgroundColor = [UIColor blackColor];
    scrollview.contentMode = UIViewContentModeScaleToFill;

    scrollview.pagingEnabled = YES;
    scrollview.scrollEnabled = YES;
    scrollview.showsVerticalScrollIndicator = YES;
    scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.delegate = self;
    [self.view addSubview:scrollview];
	// Do any additional setup after loading the view.
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    imageview.image = self.image;//[UIImage imageNamed:@"andong.jpg"];
    [scrollview addSubview:imageview];
    [imageview release];
    
    UILabel *namelabel=[[UILabel alloc] initWithFrame:CGRectMake(0.0f, 480.0f, 60.0f, 20.0f)];
    namelabel.font=[UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    namelabel.textColor=[UIColor blueColor];
    namelabel.text = NSLocalizedString(@"名称：", nil);
    namelabel.textAlignment = UITextAlignmentCenter;
    namelabel.backgroundColor = [UIColor clearColor];
    [scrollview addSubview:namelabel];
    [namelabel release];
    
    UITextField* text = [[UITextField alloc] initWithFrame:CGRectMake(65, 480, 220, 30)];
    text.borderStyle = UITextBorderStyleRoundedRect;//设置文本框边框风格
    text.autocorrectionType = UITextAutocorrectionTypeYes;//启用自动提示更正功能
    text.placeholder = @"Enter the photo name";//设置默认显示文本
    text.returnKeyType = UIReturnKeyDone;//设置键盘完成按钮，相应的还有“Return”"Gｏ""Google"等
    text.clearButtonMode = UITextFieldViewModeWhileEditing;
    [text setBackgroundColor:[UIColor whiteColor]];
    [scrollview addSubview:text];
    
    UILabel *textlabel=[[UILabel alloc] initWithFrame:CGRectMake(0.0f, 520.0f, 60.0f, 20.0f)];
    textlabel.font=[UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    textlabel.textColor=[UIColor blueColor];
    textlabel.text = NSLocalizedString(@"简介：", nil);
    textlabel.textAlignment = UITextAlignmentCenter;
    textlabel.backgroundColor = [UIColor clearColor];
    [scrollview addSubview:textlabel];
    [textlabel release];
    
    UITextView *textView = [[[UITextView  alloc] initWithFrame:CGRectMake(65, 520, 250, 200)] autorelease]; //初始化大小并自动释放
    textView.textColor = [UIColor blackColor];//设置textview里面的字体颜色  
    textView.font = [UIFont fontWithName:@"Arial" size:18.0];//设置字体名字和字体大小  
    //textView.delegate = self;//设置它的委托方法  
    textView.backgroundColor = [UIColor whiteColor];//设置它的背景颜色
    textView.text = @"简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容";//设置它显示的内容  
    textView.returnKeyType = UIReturnKeyDefault;//返回键的类型  
    textView.keyboardType = UIKeyboardTypeDefault;//键盘类型  
    textView.scrollEnabled = YES;//是否可以拖动  
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    [scrollview addSubview: textView];//加入到整个页面中
    
    UIButton *uploadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    uploadButton.frame = CGRectMake(0, 730, 60, 30);
    [uploadButton setTitle:@"上传" forState:UIControlStateNormal];
    [uploadButton addTarget:self action:@selector(toupload) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:uploadButton];
    
    UIButton *canceledButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    canceledButton.frame = CGRectMake(260, 730, 60, 30);
    [canceledButton setTitle:@"取消" forState:UIControlStateNormal];
    [canceledButton addTarget:self action:@selector(tocanceled) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:canceledButton];
    
    
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
#pragma mark toButton
- (void)toupload{

    UIAlertView *uppload = [[UIAlertView alloc] initWithTitle:@"提示"
                                                      message:@"上传"
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [uppload show];
    [uppload release];
}
- (void)tocanceled{

    UIAlertView *canceled = [[UIAlertView alloc] initWithTitle:@"提示"
                                                      message:@"上传"
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [canceled show];
    [canceled release];  
}

@end
