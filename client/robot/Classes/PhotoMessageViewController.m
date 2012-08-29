//
//  PhotoMessageViewController.m
//  template
//
//  Created by yujie liu on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PhotoMessageViewController.h"
#import "LoginViewController.h"
#import "FourthViewController.h"
#import "IFTweetLabel.h"
@interface PhotoMessageViewController ()

@end

#define TABLEHEIGHT    10
#define TOOLBAR        20
@implementation PhotoMessageViewController
@synthesize delegate;

#pragma mark
#pragma mark default Mthods
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    [super loadView];
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:(1.0/255.0) green:(1.0 / 255.0) blue:(1.0 / 255.0) alpha:1];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *btnDBSignupView = [[UIBarButtonItem alloc] 
                                        initWithTitle:@"完成"                                            
                                        style:UIBarButtonItemStyleBordered 
                                        target:self 
                                        action:@selector(closeButtonPressed)];
     self.navigationItem.rightBarButtonItem = btnDBSignupView;
    [self photomessageArray];
    UITableView *tableview= [[UITableView alloc] initWithFrame:CGRectMake(0,0, 320, 392) style:UITableViewStylePlain];
    tableview.separatorStyle = UITableViewStyleGrouped;
    tableview.separatorColor = [UIColor blackColor];
    tableview.tag = TABLEHEIGHT;
    [tableview setDelegate:self];
    [tableview setDataSource:self];
    [self.view addSubview: tableview];
   
    [tableview release];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLocations:) name:UIKeyboardWillShowNotification object:nil];
    
    sendfield = [[UITextField alloc] initWithFrame:CGRectMake(0, 4, 240, 35)];
    sendfield.delegate = self;
    sendfield.tag = 0;
    sendfield.autocorrectionType = UITextAutocorrectionTypeYes;
    sendfield.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    sendfield.enablesReturnKeyAutomatically = YES;
    sendfield.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;  
    sendfield.borderStyle = UITextBorderStyleRoundedRect;
    sendfield.returnKeyType = UIReturnKeySend;
    sendfield.placeholder = NSLocalizedString(@"Write to comment....", nil);
    sendfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    [sendfield addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit]; 
    
    UIButton *sendbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sendbutton.frame = CGRectMake(240, 7, 50, 30);
    [sendbutton setTitle:@"发送" forState:UIControlStateNormal];
    [sendbutton addTarget:self action:@selector(sendmessage) forControlEvents:UIControlEventTouchUpInside];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 392, 320, 44)];
    toolBar.tag = TOOLBAR;
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    NSMutableArray* allitems = [[NSMutableArray alloc] init];
    [allitems addObject:[[[UIBarButtonItem alloc] initWithCustomView:sendfield] autorelease]];
    [allitems addObject:[[[UIBarButtonItem alloc] initWithCustomView:sendbutton] autorelease]];
    [toolBar setItems:allitems];
    [allitems release];
    [self.view addSubview:toolBar];
    [toolBar release];
    
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



- (void)closeButtonPressed {
	[delegate modalControllerDidFinish:self];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [photomessageArray count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 81;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";  

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:  
                             SimpleTableIdentifier];  
    if (cell == nil) {    
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
                                       reuseIdentifier:SimpleTableIdentifier] autorelease];  
    }
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//UITableViewCellSelectionStyleBlue;
    NSDictionary *nsdic = [photomessageArray objectAtIndex:indexPath.row];
    cell.textLabel.text = @"";
    PhotoMessageView* photomessage = [[PhotoMessageView alloc] initWithFrame:CGRectMake(0, 0, 320, 70) clickTextArray:[nsdic objectForKey:@"clickTextArray"] allString:[nsdic objectForKey:@"allText"] imageID:[nsdic objectForKey:@"imageID"] imageURL:[nsdic objectForKey:@"imageURL"]];
    photomessage.footlabel.text = [nsdic objectForKey:@"time"];
    photomessage.delegate = self;
    photomessage.butnum = indexPath.row;
    [cell.contentView addSubview:photomessage];
    [photomessage release];
	return cell;
}
#pragma mark sendbutton
- (void) sendmessage{
    [sendfield resignFirstResponder];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    UITableView* tableview = (UITableView *)[self.view viewWithTag:TABLEHEIGHT];
    tableview.frame = CGRectMake(0, 0, 320, 392);
    UIToolbar* toolbar = (UIToolbar *)[self.view viewWithTag:TOOLBAR];
    toolbar.frame = CGRectMake(0, 392, 320, 44);
    [UIView commitAnimations];
}

- (void)changeLocations:(NSNotification *)notification {
    CGRect keyboardBounds;
    NSDictionary *info = [notification userInfo]; 
    NSValue *keyboardValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey]; 
    [keyboardValue getValue:&keyboardBounds];
    
    UITableView* tableview = (UITableView *)[self.view viewWithTag:TABLEHEIGHT];
    tableview.frame = CGRectMake(0, 0, 320, 392 - keyboardBounds.size.height);
    UIToolbar* toolbar = (UIToolbar *)[self.view viewWithTag:TOOLBAR];
    toolbar.frame = CGRectMake(0, 392 - keyboardBounds.size.height, 320, 44);
    [tableview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[photomessageArray count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (void) textFieldDoneEditing:(id)sender{  
    [sender resignFirstResponder];  
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    UITableView* tableview = (UITableView *)[self.view viewWithTag:TABLEHEIGHT];
    tableview.frame = CGRectMake(0, 0, 320, 392);
    UIToolbar* toolbar = (UIToolbar *)[self.view viewWithTag:TOOLBAR];
    toolbar.frame = CGRectMake(0, 392, 320, 44);
    [UIView commitAnimations];
}
#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    UITableView* tableview = (UITableView *)[self.view viewWithTag:TABLEHEIGHT];
    tableview.frame = CGRectMake(0, 0, 320, 142);
    UIToolbar* toolbar = (UIToolbar *)[self.view viewWithTag:TOOLBAR];
    toolbar.frame = CGRectMake(0, 142, 320, 44);
    [UIView commitAnimations];
}
#pragma mark - initphotomessage

- (void) photomessageArray{

    NSArray* user1 = [[NSArray alloc] initWithObjects:@"All", nil];
    NSArray* user2 = [[NSArray alloc] initWithObjects:@"hero", nil];
    NSArray* user3 = [[NSArray alloc] initWithObjects:@"How", nil];
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:user1,@"clickTextArray",@"All of us have read thrilling stories in which the  ",@"allText",@"logo.png",@"imageURL",@"18 minutes ago",@"time",@"111",@"imageID",nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:user2,@"clickTextArray",@"hero had only a limited and specified time to live.",@"allText",@"weibo.png",@"imageURL",@"18 minutes ago",@"time",@"222",@"imageID",nil];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:user3,@"clickTextArray",@"How are you. I'm go to shopping. I go home.",@"allText",@"andong.jpg",@"imageURL",@"18 minutes ago",@"time",@"222",@"imageID",nil];
    photomessageArray = [[NSMutableArray alloc] initWithCapacity:0];
    [photomessageArray addObject:dic1];
    [photomessageArray addObject:dic2];
    [photomessageArray addObject:dic3];
    [photomessageArray addObject:dic1];
    [photomessageArray addObject:dic2];
    [photomessageArray addObject:dic3];
    [photomessageArray addObject:dic1];
    [photomessageArray addObject:dic2];
    [photomessageArray addObject:dic3];
    [photomessageArray addObject:dic1];
    [photomessageArray addObject:dic2];
    [photomessageArray addObject:dic3];
}

#pragma mark ImageIdAndUserNameProtocol

- (void) imageID :(NSString *)imageID UIViewType:(ViewType)UIViewType{
    FourthViewController* four = [[FourthViewController alloc] init];
    if (UIViewType == PhotoMessageViewtype) {
        four.userName = imageID;
    }
    [self.navigationController pushViewController:four animated:YES];
    [four release];
}
- (void) userName :(NSString *)userName UIViewType:(ViewType)UIViewType{
    FourthViewController* four = [[FourthViewController alloc] init];
    if (UIViewType == PhotoMessageViewtype) {
        four.userName = userName;
    }
    [self.navigationController pushViewController:four animated:YES];
    [four release];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event UIViewType:(ViewType)UIViewType{
    [sendfield resignFirstResponder];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    UITableView* tableview = (UITableView *)[self.view viewWithTag:TABLEHEIGHT];
    tableview.frame = CGRectMake(0, 0, 320, 392);
    UIToolbar* toolbar = (UIToolbar *)[self.view viewWithTag:TOOLBAR];
    toolbar.frame = CGRectMake(0, 392, 320, 44);
    [UIView commitAnimations];
}

#pragma mark - ASIHTTPRequestDelegate

- (void)photoMessageviewRequest
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
