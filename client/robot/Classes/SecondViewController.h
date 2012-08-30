//
//  LocationlistViewController.h
//  template
//
//  Created by yujie liu on 12-7-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMTabView.h"
#import "AppDelegate.h"
#import "ODRefreshControl.h"
#import "HjxPhotoViewController.h"
#import "CellView.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
@interface SecondViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate,DirectionsViewControllerDelegate,JMTabViewDelegate,ASIHTTPRequestDelegate>{
    
    NSMutableArray *nsArray;
    BOOL isloading;
    ODRefreshControl *refreshControl;
    CLLocationCoordinate2D coord;
    MBProgressHUD  * _MBProgress;
}

@end
