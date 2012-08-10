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
    
    sendfield = [[UITextField alloc] initWithFrame:CGRectMake(0, 4, 250, 35)];
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
    sendbutton.frame = CGRectMake(250, 7, 50, 30);
    [sendbutton setTitle:@"发送" forState:UIControlStateNormal];
    [sendbutton addTarget:self action:@selector(sendmessage) forControlEvents:UIControlEventTouchUpInside];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 392, 320, 44)];
    toolBar.tag = TOOLBAR;
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
- (void)clickImage:(int)imagenum{
    if (imagenum == 0) {
        FourthViewController* four = [[FourthViewController alloc] init];
        [self.navigationController pushViewController:four animated:YES];
    }else if(imagenum == 1){
        FourthViewController* four = [[FourthViewController alloc] init];
        [self.navigationController pushViewController:four animated:YES];
    }else if(imagenum == 2){
        FourthViewController* four = [[FourthViewController alloc] init];
        [self.navigationController pushViewController:four animated:YES];
    }
    
}
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
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
    
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    NSDictionary *nsdic = [photomessageArray objectAtIndex:indexPath.row];
    cell.textLabel.text = @"";
    PhotoMessageView* photomessage = [[PhotoMessageView alloc]initWithFrame:CGRectMake(0, 0, 320, 70) headString:[nsdic objectForKey:@"head"] footString:[nsdic objectForKey:@"foot"] heimage:[UIImage imageNamed:[nsdic objectForKey:@"image"]]];
    photomessage.footlabel.text = [nsdic objectForKey:@"labeltext"];
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

    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"All",@"head",@"All of us have read thrilling stories in which the  ",@"foot",@"logo.png",@"image",@"18 minutes ago",@"labeltext",nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"hero",@"head",@"hero had only a limited and specified time to live.",@"foot",@"weibo.png",@"image",@"18 minutes ago",@"labeltext",nil];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"How",@"head",@"How are you. I'm go to shopping. I go home.",@"foot",@"andong.jpg",@"image",@"18 minutes ago",@"labeltext",nil];
    photomessageArray = [[NSMutableArray alloc] initWithCapacity:0];
    [photomessageArray addObject:dic1];
    [photomessageArray addObject:dic2];
    [photomessageArray addObject:dic3];
}

@end
