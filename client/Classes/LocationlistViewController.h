//
//  LocationlistViewController.h
//  template
//
//  Created by yujie liu on 12-7-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeatilViewController.h"
#import "AppDelegate.h"
@interface LocationlistViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,DirectionsViewControllerDelegate>{

    NSMutableArray *nsArray;
}

@end
