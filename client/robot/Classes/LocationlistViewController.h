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
#import "EGORefreshTableHeaderView.h"
#import "HjxPhotoViewController.h"
@interface LocationlistViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,DirectionsViewControllerDelegate,EGORefreshTableHeaderDelegate,JMTabViewDelegate>{

    NSMutableArray *nsArray;
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL                isloading;
}

@end
