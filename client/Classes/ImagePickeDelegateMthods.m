//
//  ImagePickeDelegateMthods.m
//  template
//
//  Created by yujie liu on 12-7-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ImagePickeDelegateMthods.h"

@implementation ImagePickeDelegateMthods
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    
    NSLog(@"this is good");
     //imageView为自己定义的UIImageView
    [picker dismissModalViewControllerAnimated:YES];
    [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];

}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"this is info");
  //  imageView.image = image; //imageView为自己定义的UIImageView
    [picker dismissModalViewControllerAnimated:YES];
        [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
}
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
