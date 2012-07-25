//
//  ImagePickeViewController.m
//  template
//
//  Created by yujie liu on 12-7-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ImagePickeViewController.h"

@interface ImagePickeViewController ()

@end

@implementation ImagePickeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) loadView {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
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

- (void)viewDidLoad
{    
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, 200, 300, 80);
    [button setTitle:NSLocalizedString(@"Show Picker", @"") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showPicker:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)showPicker:(id)sender
{
    FKImagePickerController *imagePicker = [[FKImagePickerController alloc] init];
    imagePicker.delegate = self;
    [self presentModalViewController:imagePicker animated:YES];
}

#pragma mark - FKImagePickerDelegate

- (void)imagePickerController:(FKImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"this is sss  s s ");
}

- (void)imagePickerControllerDidCancel:(FKImagePickerController *)picker
{
    [self dismissModalViewControllerAnimated:YES];
    NSLog(@"this is good");
}

//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
//    NSLog(@"this is picker");
//    [picker dismissModalViewControllerAnimated:YES];
//    //[[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
//}
@end
