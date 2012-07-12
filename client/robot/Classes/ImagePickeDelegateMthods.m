//
//  ImagePickeDelegateMthods.m
//  template
//
//  Created by yujie liu on 12-7-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ImagePickeDelegateMthods.h"
//#import "EXFJpeg.h"
@implementation ImagePickeDelegateMthods
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
}
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
//    NSLog(@"this is info");
//  //  imageView.image = image; //imageView为自己定义的UIImageView
//    [picker dismissModalViewControllerAnimated:YES];
//        [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
//}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    NSLog(@"this is picker");
    [picker dismissModalViewControllerAnimated:YES];
    [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSLog(@"this is nav will show");
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
        NSLog(@"this is nav did show");
}
@end
