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

#pragma mark -- 
#pragma mark default Methods

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

    
    UILabel *namelabel=[[UILabel alloc] initWithFrame:CGRectMake(0.0f, 340.0f, 60.0f, 20.0f)];
    namelabel.font=[UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    namelabel.textColor=[UIColor blueColor];
    namelabel.text = NSLocalizedString(@"景点名称：", nil);
    namelabel.textAlignment = UITextAlignmentCenter;
    namelabel.backgroundColor = [UIColor clearColor];
    [scrollview addSubview:namelabel];
    [namelabel release];
    
    UITextField* text = [[UITextField alloc] initWithFrame:CGRectMake(65, 340, 220, 30)];
    text.borderStyle = UITextBorderStyleRoundedRect;//设置文本框边框风格
    text.autocorrectionType = UITextAutocorrectionTypeYes;//启用自动提示更正功能
    text.placeholder = @"Enter the place name";//设置默认显示文本
    text.returnKeyType = UIReturnKeyDone;//设置键盘完成按钮，相应的还有“Return”"Gｏ""Google"等
    text.clearButtonMode = UITextFieldViewModeWhileEditing;
    [text setBackgroundColor:[UIColor whiteColor]];
    [scrollview addSubview:text];
    
    UILabel *textlabel=[[UILabel alloc] initWithFrame:CGRectMake(0.0f, 440.0f, 60.0f, 20.0f)];
    textlabel.font=[UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    textlabel.textColor=[UIColor blueColor];
    textlabel.text = NSLocalizedString(@"简介：", nil);
    textlabel.textAlignment = UITextAlignmentCenter;
    textlabel.backgroundColor = [UIColor clearColor];
    [scrollview addSubview:textlabel];
    [textlabel release];
    
    UITextView *textView = [[[UITextView  alloc] initWithFrame:CGRectMake(65, 440, 250, 200)] autorelease]; //初始化大小并自动释放
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
    
    [self.view addSubview: scrollview];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:(1.0/255.0) green:(1.0 / 255.0) blue:(1.0 / 255.0) alpha:1];
    [AppDelegate getAppDelegate].centerButton.hidden = YES;
    [self hideTabBar:self.tabBarController];
    scrollview.contentSize = CGSizeMake(320,900);
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

#pragma mark --
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


#pragma mark --
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

#pragma mark -- 
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
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImageWriteToSavedPhotosAlbum(saveimage,nil,nil,nil);
    }

    [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
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
