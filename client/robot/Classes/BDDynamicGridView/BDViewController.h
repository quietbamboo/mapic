//
//  BDViewController.h
//  BDDynamicGridViewDemo
//
//  Created by Nor Oh on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDDynamicGridViewController.h"
#import "MockPhotoSource.h"
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "MBProgressHUD.h"
@interface BDViewController : BDDynamicGridViewController <BDDynamicGridViewDelegate,UIScrollViewDelegate> {
    NSMutableArray * _items;
    NSString *imagearraystr;
    UIProgressView *myProgressIndicator;
    NSMutableArray *imagemuarray;
    MBProgressHUD *_MBProgress;
    int indextemp;
    float endProgress;
    BOOL isloading;
}
- (id) initWithImageArrayStr:(NSString *)imageNSArrayStr;
@end
