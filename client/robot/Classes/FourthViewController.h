//
//  SettingViewController.h
//  template
//
//  Created by apple on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@class TTTQuadrantControl;
@interface FourthViewController : UITableViewController{
    
    TTTQuadrantControl *_quadrantControl;
}


@property (nonatomic, retain) TTTQuadrantControl *quadrantControl;
@end
