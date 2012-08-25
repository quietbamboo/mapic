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
@synthesize label;
@synthesize imgPicker;
@synthesize pop;
@synthesize imageView;
#pragma mark
#pragma mark Default Mthods
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
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:(1.0/255.0) green:(1.0 / 255.0) blue:(1.0 / 255.0) alpha:1];
    [AppDelegate getAppDelegate].centerButton.hidden = YES;
    [self hideTabBar:self.tabBarController];
    scrollview.contentSize = CGSizeMake(320,900);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *btnRoute = [[UIBarButtonItem alloc] 
                                 initWithTitle:@"取消"                                            
                                 style:UIBarButtonItemStyleBordered 
                                 target:self 
                                 action:@selector(closeUpload)];
    self.navigationItem.leftBarButtonItem = btnRoute;
    [btnRoute release];
    UIBarButtonItem *btnUpload = [[UIBarButtonItem alloc] 
                                 initWithTitle:@"上传"                                            
                                 style:UIBarButtonItemStyleBordered 
                                 target:self 
                                 action:@selector(toupload)];
    self.navigationItem.rightBarButtonItem = btnUpload;
    [btnUpload release];
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
    textView.text = @"";//设置它显示的内容  
    textView.returnKeyType = UIReturnKeyDefault;//返回键的类型  
    textView.keyboardType = UIKeyboardTypeDefault;//键盘类型  
    textView.scrollEnabled = YES;//是否可以拖动  
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    [scrollview addSubview: textView];//加入到整个页面中
    
    UIButton *uploadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    uploadButton.frame = CGRectMake(60, 745, 200, 50);
    [uploadButton setTitle:@"上    传" forState:UIControlStateNormal];
    uploadButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [uploadButton addTarget:self action:@selector(toupload) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:uploadButton];
    
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
#pragma mark hideTabBar and showTabBar
-(void) hideTabBar:(UITabBarController*) tabbarcontroller {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView*view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x,480, view.frame.size.width, view.frame.size.height)];
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width,480)];
        }
        
    }
    [UIView commitAnimations];
}

-(void) showTabBar:(UITabBarController*) tabbarcontroller {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView*view in tabbarcontroller.view.subviews)
    {  
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x,431, view.frame.size.width, view.frame.size.height)];
            
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width,431)];
        }
    }
    [UIView commitAnimations];
}
#pragma mark
#pragma mark navBar Action
- (void)toupload{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload confirmation" message:@"Are you sure to upload this image?\n\nBe patient when uploading ...\n\nIf you want to remove a previously uploaded and approved photo, you can do so in \"Uploaded By Me\" section by clicking the <!> button" 
												   delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
	[alert addButtonWithTitle:@"Yes"];
	[alert show];
	[alert release];
}
- (void)closeUpload{
    self.tabBarController.selectedIndex = 0;
}
#pragma mark
#pragma mark Upload UIImage Methods
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
	//[imageView removeFromSuperview];
	//[[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:@"tt://catalog"]];
	if([[alertView title] isEqualToString:@"Thank you!"]){
		
		//restart home
		[[TTNavigator navigator] removeAllViewControllers];
		[[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:@"tt://catalog"]];
		
		
	}
	
	if([[alertView title] isEqualToString:@"Upload confirmation"] && buttonIndex == 0){
		[[TTNavigator navigator] removeAllViewControllers];
		[[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:@"tt://catalog"]];
	}
	
	if(buttonIndex == 1){
		//send image
		label = [[[TTActivityLabel alloc] initWithStyle:TTActivityLabelStyleWhiteBox] autorelease];
		label.text = @"Uploading & checking duplication ...";
		[label sizeToFit];
		label.frame = CGRectMake(0, self.view.frame.size.height / 2.5, self.view.frame.size.width, label.frame.size.height);
		[self.view addSubview:label];
        
		[NSTimer scheduledTimerWithTimeInterval: 0.3
                                         target: self
                                       selector: @selector(handleTimer:)
                                       userInfo: nil
                                        repeats: NO];
	}
}
- (void) handleTimer: (id) timer{
    NSLog(@"handleTimer");
    [timer invalidate];
	//upload image
	/*
	 turning the image into a NSData object
	 getting the image back out of the UIImageView
	 setting the quality to 90
	 */
	
	//iphone name : [[UIDevice currentDevice] name]
	
	//device id: [NSString stringWithFormat:@"%@", [[UIDevice currentDevice] uniqueIdentifier]]
	
	NSString *prefix = @"UploadServlet";//@"pet";//[[[NSBundle mainBundle] infoDictionary] objectForKey:@"prefix"];
	NSString *baseurl = @"http://192.168.1.102:8080/upload";//@"http://iphone.dotaart.com/asian/new";//[[[NSBundle mainBundle] infoDictionary] objectForKey:@"baseurl"];
	NSString *device_id = [NSString stringWithFormat:@"%@", [[UIDevice currentDevice] uniqueIdentifier]];
    
	//NSData *imageData = UIImageJPEGRepresentation(image, 1);
	//NSLog(@"before getint image data");
	NSData *imageData = UIImageJPEGRepresentation(self.image, 1.0);
	//NSLog(@"after getint image data");
	
	// setting up the URL to post to
	NSString *urlString = [NSString stringWithFormat:@"%@/%@", baseurl, prefix];//upload.php?prefix=
	
	// setting up the request object now
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:urlString]];
	[request setHTTPMethod:@"POST"];
	
	/*
	 add some header info now
	 we always need a boundary when we post a file
	 also we need to set the content type
	 
	 You might want to generate a random boundary.. this is just the same 
	 as my output from wireshark on a valid html post
	 */
	NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
	NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
	[request addValue:contentType forHTTPHeaderField: @"Content-Type"];
	/*
	 now lets create the body of the post
	 */
	NSMutableData *body = [NSMutableData data];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];	
	[body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@_____%@\"\r\n", device_id, [[UIDevice currentDevice] name]] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[NSData dataWithData:imageData]];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	// setting the body of the post to the reqeust
	[request setHTTPBody:body];
	
	//NSLog(@"sending ");
	// now lets make the connection to the web
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	//NSLog(@"sending returned");
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	if([returnData length] == 0){
		returnString = @"Either you don't have network access or our server is down.\nTry again later:)";
	}
	//NSLog(returnString);
	
	//[indicator stopAnimating];
	//
	
	
	NSString* msg = [NSString stringWithFormat:@"%@", returnString];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank you!" message:msg 
												   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
	
	[label removeFromSuperview];
	
	//[self.view removeAllSubviews];
	//CGRect mainBounds = [[UIScreen mainScreen] bounds];
	//imageView = [[UIImageView alloc] initWithFrame:mainBounds];
	//imageView.contentMode = UIViewContentModeScaleAspectFit;	
	//imageView = [[UIImageView alloc] initWithImage:image];
	//[self.view addSubview:imageView];
    
    
}
@end
