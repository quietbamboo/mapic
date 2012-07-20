//
//  UserViewController.h
//  template
//
//  Created by apple on 12-7-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HjxPhotoViewController.h"
#import "AppDelegate.h"
#import "JMTabView.h"
#import "NotificationView.h"
@interface UserViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,JMTabViewDelegate>{

     NotificationView *notificationView;
}

@end
