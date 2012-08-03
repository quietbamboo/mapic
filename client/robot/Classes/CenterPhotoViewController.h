//
//  CenterViewController.h
//  template
//
//  Created by apple on 12-7-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "UploadViewController.h"
#import "FKFilterPickerController.h"
#import "FKImagePickerController.h"
@interface CenterPhotoViewController : UIViewController<FKImagePickerDelegate,UIScrollViewDelegate>{
    UIScrollView *scrollview;
    UIImagePickerController *imgPicker;
    UIPopoverController *pop; // for ipad
    //	UIActivityIndicatorView *indicator;
	UIImage *image;
	TTActivityLabel *label;
	UIImageView *imageView;
}
@property (nonatomic,retain) UIImage *image;
@property (nonatomic, retain) TTActivityLabel *label;
@property (nonatomic, retain) UIImagePickerController *imgPicker;
@property (nonatomic, retain) UIPopoverController *pop;
@property (nonatomic, retain) UIImageView *imageView;
-(void)showPhotos;
-(void)showCamera;
@end
