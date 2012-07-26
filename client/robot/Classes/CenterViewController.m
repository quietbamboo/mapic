//
//  CenterViewController.m
//  template
//
//  Created by apple on 12-7-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
#pragma mark
#pragma mark show Photos and Camera Methods

-(void)showPhotos{
    self.tabBarController.selectedIndex = 0;
    [[[AppDelegate getAppDelegate] centerButton] setHidden:YES];
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.allowsImageEditing = YES;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:imagePickerController animated:YES];
    [imagePickerController release];
}

-(void)showCamera{
    self.tabBarController.selectedIndex = 0;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [[[AppDelegate getAppDelegate] centerButton] setHidden:YES];
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentModalViewController:imagePickerController animated:YES];
        [imagePickerController release];
    }
}

#pragma mark
#pragma mark imagePickeDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    //    NSLog(@"image picked %@ with info %@", image, editingInfo);
    //    NSData* jpegData = UIImageJPEGRepresentation (image,0.5);
    //    EXFJpeg* jpegScanner = [[EXFJpeg alloc] init];
    //    [jpegScanner scanImageData: jpegData];
    //    EXFMetaData* exifData = jpegScanner.exifMetaData;
    //    EXFJFIF* jfif = jpegScanner.jfif;
    //    EXFTag* tagDefinition = [exifData tagDefinition: [NSNumber numberWithInt:EXIF_DateTime]];
    //    //EXFTag* latitudeDef = [exifData tagDefinition: [NSNumber numberWithInt:EXIF_GPSLatitude]];
    //    //EXFTag* longitudeDef = [exifData tagDefinition: [NSNumber numberWithInt:EXIF_GPSLongitude]];
    //    id latitudeValue = [exifData tagValue:[NSNumber numberWithInt:EXIF_GPSLatitude]];
    //    id longitudeValue = [exifData tagValue:[NSNumber numberWithInt:EXIF_GPSLongitude]];
    //    id datetime = [exifData tagValue:[NSNumber numberWithInt:EXIF_DateTime]];
    //    id t = [exifData tagValue:[NSNumber numberWithInt:EXIF_Model]];
    
    NSLog(@"this is good");
    //imageView为自己定义的UIImageView
    UIImageWriteToSavedPhotosAlbum(image,nil,nil,nil);
    //[picker.navigationController pushViewController:upload animated:YES];
    [picker dismissModalViewControllerAnimated:YES];
    //[[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
    UploadViewController *upload = [[UploadViewController alloc] init];
    upload.image = image;
    
    [self.navigationController pushViewController:upload animated:YES];
    //[self.tabBarController.view setHidden:YES];
    [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
    [upload release];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    NSLog(@"this is picker");
    [picker dismissModalViewControllerAnimated:YES];
    [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
}
@end
