//
//  CenterViewController.m
//  template
//
//  Created by apple on 12-7-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CenterPhotoViewController.h"

@interface CenterPhotoViewController ()

@end

@implementation CenterPhotoViewController
@synthesize image;
@synthesize label;
@synthesize imgPicker;
@synthesize pop;
@synthesize imageView;

#define SCROLLVIEW    1000

#pragma mark
#pragma mark Default Methods

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
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:(1.0/255.0) green:(1.0 / 255.0) blue:(1.0 / 255.0) alpha:1];
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
    scrollview.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    scrollview.contentMode = UIViewContentModeScaleToFill;
    scrollview.tag = SCROLLVIEW;
    scrollview.pagingEnabled = YES;
    scrollview.scrollEnabled = YES;
    scrollview.showsVerticalScrollIndicator = YES;
    scrollview.showsHorizontalScrollIndicator = NO;
    
    scrollview.delegate = self;
    [self.view addSubview:scrollview];
	// Do any additional setup after loading the view.

    
    UILabel *namelabel=[[UILabel alloc] initWithFrame:CGRectMake(0.0f, 340.0f, 90.0f, 20.0f)];
    namelabel.font=[UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    namelabel.textColor=[UIColor whiteColor];
    namelabel.text = NSLocalizedString(@"景点名称：", nil);
    namelabel.textAlignment = UITextAlignmentCenter;
    namelabel.backgroundColor = [UIColor clearColor];
    [scrollview addSubview:namelabel];
    [namelabel release];
    
    UITextField* text = [[UITextField alloc] initWithFrame:CGRectMake(90, 335, 220, 30)];
    text.borderStyle = UITextBorderStyleRoundedRect;
    text.autocorrectionType = UITextAutocorrectionTypeYes;
    text.placeholder = @"Enter the place name";
    text.returnKeyType = UIReturnKeyDone;
    text.clearButtonMode = UITextFieldViewModeWhileEditing;
    text.tag = 0;
    text.delegate = self;
    [text setBackgroundColor:[UIColor whiteColor]];
    [scrollview addSubview:text];
    
    UILabel *textlabel=[[UILabel alloc] initWithFrame:CGRectMake(0.0f, 400.0f, 60.0f, 20.0f)];
    textlabel.font=[UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    textlabel.textColor=[UIColor whiteColor];
    textlabel.text = NSLocalizedString(@"简介：", nil);
    textlabel.textAlignment = UITextAlignmentCenter;
    textlabel.backgroundColor = [UIColor clearColor];
    [scrollview addSubview:textlabel];
    [textlabel release];
    
    UITextView *textView = [[[UITextView  alloc] initWithFrame:CGRectMake(65, 400, 250, 200)] autorelease];
    textView.textColor = [UIColor blackColor]; 
    textView.font = [UIFont fontWithName:@"Arial" size:18.0];  
    textView.delegate = self;
    textView.backgroundColor = [UIColor whiteColor];
    textView.text = @"";

    textView.returnKeyType = UIReturnKeyDone;  
    textView.keyboardType = UIKeyboardTypeDefault;  
    textView.scrollEnabled = YES;  
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [scrollview addSubview: textView];
    
    UIButton *uploadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    uploadButton.frame = CGRectMake(60, 645, 200, 50);
    [uploadButton setTitle:@"上    传" forState:UIControlStateNormal];
    uploadButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [uploadButton addTarget:self action:@selector(toupload) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:uploadButton];
    
    [self.view addSubview: scrollview];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    
    [AppDelegate getAppDelegate].centerButton.hidden = YES;
    [self hideTabBar:self.tabBarController];
    scrollview.contentSize = CGSizeMake(320,750);
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

#pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView{
    if (scrollview.contentOffset.y >= 270) {
        CGRect rect = self.view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        rect.origin.y = -120.0f;
        self.view.frame = rect;
        [UIView commitAnimations];
    }else {
        scrollview.contentOffset = CGPointMake(0, 270);
        CGRect rect = self.view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        rect.origin.y = -120.0f;
        self.view.frame = rect;
        [UIView commitAnimations];
    }
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text  
{  
    if ([text isEqualToString:@"\n"]) {  
        [textView resignFirstResponder]; 
        CGRect rect = self.view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        rect.origin.y = 0.0f;
        self.view.frame = rect;
        [UIView commitAnimations];
        return NO;  
    }  
    return YES;  
} 
#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (scrollview.contentOffset.y >= 270) {
        
    }else {
        CGRect rect = self.view.frame;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        rect.origin.y = -240.0f;
        self.view.frame = rect;
        [UIView commitAnimations];
    }

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;{
    [textField resignFirstResponder];
    CGRect rect = self.view.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    rect.origin.y = 0.0f;
    self.view.frame = rect;
    [UIView commitAnimations];
    return YES;
}
#pragma mark
#pragma mark toButton
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
#pragma mark Upload
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
	
	// now lets make the connection to the web
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	//NSLog(@"sending returned");
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	if([returnData length] == 0){
		returnString = @"Either you don't have network access or our server is down.\nTry again later:)";
	}
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


#pragma mark
#pragma mark show Photos and Camera Methods

-(void)showPhotos{
    self.tabBarController.selectedIndex = 2;
    FKImagePickerController *imagePicker = [[FKImagePickerController alloc] initWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    imagePicker.delegate = self;
    [self presentModalViewController:imagePicker animated:YES];
    //TODO: move this line to the didShow delegate function of the imagePicker
    [AppDelegate getAppDelegate].centerButton.hidden = YES;

}

-(void)showCamera{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
         self.tabBarController.selectedIndex = 2;
         FKImagePickerController *imagePicker = [[FKImagePickerController alloc] initWithSourceType:UIImagePickerControllerSourceTypeCamera];
         imagePicker.delegate = self;
        [self presentModalViewController:imagePicker animated:YES];
         //TODO: move this line to the didShow delegate function of the imagePicker
         [AppDelegate getAppDelegate].centerButton.hidden = YES;
     }
}

#pragma mark
#pragma mark FKImagePickerDelegate Methods

- (void)imagePickerController:(FKImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
       
//    UIImageWriteToSavedPhotosAlbum(image,nil,nil,nil);
//        [picker dismissModalViewControllerAnimated:YES];
//   [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
//   UploadViewController *upload = [[UploadViewController alloc] init];
//    upload.image = image;
//    
//     [self.navigationController pushViewController:upload animated:YES];
//      //[self.tabBarController.view setHidden:YES];
//     [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
//     [upload release];
    [self dismissModalViewControllerAnimated:YES]; 
    UIImage *saveimage = [info objectForKey:UIImagePickerControllerEditedImage];
    //  self.image = saveimage;
    //imageView.image = saveimage;
//    
//    if (info == nil) {
//        NSLog(@"not get image ");
//    }
//    if (saveimage == nil) {
//        NSLog(@"not get imgesssssss");
//    }
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    imageview.image = saveimage;
    [scrollview addSubview:imageview];
    [imageview release];
    UIImageWriteToSavedPhotosAlbum(saveimage, nil, nil, nil);
   
    self.navigationController.navigationBarHidden = NO;
   // [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
}
- (void)imagePickerControllerDidCancel:(FKImagePickerController *)picker{
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(hidenSome) userInfo:nil repeats:NO];
     
}
- (void) hidenSome{
    self.tabBarController.selectedIndex = 0;
    [self dismissModalViewControllerAnimated:YES];
    [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
}

//#pragma mark
//#pragma mark imagePickeDelegate
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
//    //    NSLog(@"image picked %@ with info %@", image, editingInfo);
//    //    NSData* jpegData = UIImageJPEGRepresentation (image,0.5);
//    //    EXFJpeg* jpegScanner = [[EXFJpeg alloc] init];
//    //    [jpegScanner scanImageData: jpegData];
//    //    EXFMetaData* exifData = jpegScanner.exifMetaData;
//    //    EXFJFIF* jfif = jpegScanner.jfif;
//    //    EXFTag* tagDefinition = [exifData tagDefinition: [NSNumber numberWithInt:EXIF_DateTime]];
//    //    //EXFTag* latitudeDef = [exifData tagDefinition: [NSNumber numberWithInt:EXIF_GPSLatitude]];
//    //    //EXFTag* longitudeDef = [exifData tagDefinition: [NSNumber numberWithInt:EXIF_GPSLongitude]];
//    //    id latitudeValue = [exifData tagValue:[NSNumber numberWithInt:EXIF_GPSLatitude]];
//    //    id longitudeValue = [exifData tagValue:[NSNumber numberWithInt:EXIF_GPSLongitude]];
//    //    id datetime = [exifData tagValue:[NSNumber numberWithInt:EXIF_DateTime]];
//    //    id t = [exifData tagValue:[NSNumber numberWithInt:EXIF_Model]];
//    
//    NSLog(@"this is good");
//    //imageView为自己定义的UIImageView
//    UIImageWriteToSavedPhotosAlbum(image,nil,nil,nil);
//    //[picker.navigationController pushViewController:upload animated:YES];
//    [picker dismissModalViewControllerAnimated:YES];
//    //[[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
//    UploadViewController *upload = [[UploadViewController alloc] init];
//    upload.image = image;
//    
//    [self.navigationController pushViewController:upload animated:YES];
//    //[self.tabBarController.view setHidden:YES];
//    [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
//    [upload release];
//    
//}
//
//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
//    NSLog(@"this is picker");
//    [picker dismissModalViewControllerAnimated:YES];
//    [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
//}

@end
