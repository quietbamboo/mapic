//
//  UploadViewController.h
//  template
//
//  Created by yujie liu on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface UploadViewController : UIViewController<UIScrollViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIAlertViewDelegate>{

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
@end
