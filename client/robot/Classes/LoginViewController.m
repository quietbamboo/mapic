//
//  LoginViewController.m
//  template
//
//  Created by 健峰 高 on 12-8-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "DBSignupViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 1;
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";  
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:  
                             SimpleTableIdentifier];  
    if (cell == nil) {    
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
                                       reuseIdentifier:SimpleTableIdentifier] autorelease];  
    }
    
    for(UIView *subview in [cell.contentView subviews])
        [subview removeFromSuperview];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.textLabel.text = NSLocalizedString(@"Username:", nil);
                UITextField *usernametext = [[UITextField alloc] initWithFrame:CGRectMake(110, 2, 170, 40)];             
                usernametext.placeholder = @"Username";
                usernametext.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
                usernametext.autocapitalizationType = UITextAutocapitalizationTypeNone;
                usernametext.autocorrectionType = UITextAutocorrectionTypeNo;
                usernametext.returnKeyType = UIReturnKeyDone;
                usernametext.tag = 0;
                usernametext.clearButtonMode = UITextFieldViewModeUnlessEditing;
                usernametext.delegate = self;
                [cell.contentView addSubview:usernametext];
                break;
            case 1:
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.textLabel.text = NSLocalizedString(@"Password:", nil);
                UITextField *passwordtext = [[UITextField alloc] initWithFrame:CGRectMake(110, 2, 170, 40)];             
                passwordtext.secureTextEntry = YES; 
                passwordtext.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
                passwordtext.placeholder = @"Password";
                passwordtext.autocapitalizationType = UITextAutocapitalizationTypeNone;
                passwordtext.autocorrectionType = UITextAutocorrectionTypeNo;
                passwordtext.returnKeyType = UIReturnKeyDone;
                passwordtext.tag = 1;
                passwordtext.clearButtonMode = UITextFieldViewModeUnlessEditing;
                passwordtext.delegate = self;
                [cell.contentView addSubview:passwordtext];
                break;

        }  
    }
    
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                cell.selectionStyle = UITableViewCellSelectionStyleGray;
                cell.textLabel.text = @"";
                UILabel *loginlabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 3, 280, 38)];
                loginlabel.text = @"登  录";
                loginlabel.font = [UIFont boldSystemFontOfSize:20];
                loginlabel.textAlignment = UITextAlignmentCenter;
                loginlabel.backgroundColor = [UIColor clearColor];
                [cell.contentView addSubview:loginlabel];
                break;    
        }
    }

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                NSLog(@"aaaaa");
                break;
                
            default:
                break;
        }
    }
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSUInteger tag = [textField tag];
    NSLog(@"this is %d",tag);
    CGRect rect = self.view.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    switch (tag) {
        case 0:
            rect.origin.y = -130.0f;
            break;
        case 1:
            rect.origin.y = -120.0f;
            break;
        default:
            rect.origin.y = 0.0f;
            break;
    }
    self.view.frame = rect;
    [UIView commitAnimations];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;{
    [textField resignFirstResponder];
    NSUInteger tag = [textField tag];
    NSLog(@"this is %d",tag);
    CGRect rect = self.view.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    rect.origin.y = 0.0f;
    self.view.frame = rect;
    [UIView commitAnimations];
    return YES;
}

#pragma mark default Mthods
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)loadView {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    contentView.backgroundColor = [UIColor lightGrayColor];
    self.view = contentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UITableView *tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,0, 310, 421) style:UITableViewStyleGrouped];
    //tableview.separatorStyle = UITableViewStyleGrouped;
    tableview.separatorStyle = UITableViewStylePlain;
    //tableview.separatorColor = [UIColor blackColor];
    tableview.backgroundColor = [UIColor lightGrayColor];
    [tableview setDelegate:self];
    [tableview setDataSource:self];
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(50, 25, 220, 150)];
    imageview.image = [UIImage imageNamed:@"Icon@2x.png"];
    [header addSubview:imageview];
    [imageview release];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(120.0, 180.0, 200.0, 20.0)];
    label1.text = @"Mapic";
    label1.backgroundColor = [UIColor clearColor];
    label1.font = [UIFont systemFontOfSize:15];
    [header addSubview:label1];
    [label1 release];
    
    tableview.tableHeaderView = header;
    [header release];
    
    [self.view addSubview: tableview];
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
