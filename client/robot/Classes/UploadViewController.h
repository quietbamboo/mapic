//
//  UploadViewController.h
//  template
//
//  Created by yujie liu on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface UploadViewController : UIViewController<UIScrollViewDelegate>{

    UIScrollView *scrollview;
}
@property (nonatomic,retain) UIImage *image;
@end
