//
//  PhotoMessageViewController.m
//  template
//
//  Created by yujie liu on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PhotoMessageViewController.h"

@interface PhotoMessageViewController ()

@end

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
    
    UITableView *tableview= [[UITableView alloc] initWithFrame:CGRectMake(0,0, 320, 376) style:UITableViewStylePlain];
    tableview.separatorStyle = UITableViewStyleGrouped;
    tableview.separatorColor = [UIColor blackColor];
    [tableview setDelegate:self];
    [tableview setDataSource:self];
    [self.view addSubview: tableview];
    [tableview release];
    
    sendfield = [[UITextField alloc] initWithFrame:CGRectMake(-10, 4, 150, 35)];
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
    [sendbutton addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventTouchUpInside];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 392, 320, 44)];
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
    self.navigationController.navigationBarHidden = YES;
	[delegate modalControllerDidFinish:self];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
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
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"";
                PhotoMessageView* photomessage = [[PhotoMessageView alloc]initWithFrame:CGRectMake(0, 0, 320, 70) headString:@"How" footString:@"How are you. I'm go to shopping. I go home."];
                photomessage.headimageView.image = [UIImage imageNamed:@"andong.jpg"];
                photomessage.footlabel.text = @"18 minutes ago";
                [cell.contentView addSubview:photomessage];
                [photomessage release];
                break;
            case 1:
                cell.textLabel.text = @"";
                PhotoMessageView* photomessage1 = [[PhotoMessageView alloc]initWithFrame:CGRectMake(0, 0, 320, 70) headString:@"How" footString:@"How are you. I'm go to shopping. I go home."];
                photomessage1.headimageView.image = [UIImage imageNamed:@"andong.jpg"];
                photomessage1.footlabel.text = @"18 minutes ago";
                [cell.contentView addSubview:photomessage1];
                [photomessage1 release];
                break;
            case 2:
                cell.textLabel.text = @"";
                PhotoMessageView* photomessage2 = [[PhotoMessageView alloc]initWithFrame:CGRectMake(0, 0, 320, 70) headString:@"How" footString:@"How are you. I'm go to shopping. I go home."];
                photomessage2.headimageView.image = [UIImage imageNamed:@"andong.jpg"];
                photomessage2.footlabel.text = @"18 minutes ago";
                [cell.contentView addSubview:photomessage2];
                [photomessage2 release];
                break;
        }
    }
    
	return cell;
}
#pragma mark sendbutton
- (void) sendmessage{
    [sendfield resignFirstResponder];
    CGRect rect = self.view.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    rect.origin.y = 0.0f;
    self.view.frame = rect;
    [UIView commitAnimations];
    
}

- (void) textFieldDoneEditing:(id)sender{  
    [sender resignFirstResponder];  
    [self sendmessage];
}
#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSUInteger tag = [textField tag];
    CGRect rect = self.view.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    switch (tag) {
        case 0:
            rect.origin.y = -250.0f;
            break;
        default:
            rect.origin.y = 0.0f;
            break;
    }
    self.view.frame = rect;
    [UIView commitAnimations];
}


@end
