//
//  FirstViewController.h
//  template
//
//  Created by apple on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeatilViewController.h"
@interface FirstViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate,DirectionsViewControllerDelegate>{
    BOOL canChangeMap;
}

@property (strong, nonatomic) MKMapView *mainMapView;

@end
