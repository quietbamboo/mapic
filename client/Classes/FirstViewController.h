//
//  FirstViewController.h
//  template
//
//  Created by apple on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeatilViewController.h"
#import "Place.h"
#import "PlaceMark.h"
#import "BaseViewController.h"
#import "RegexKitLite.h"
@interface FirstViewController : BaseViewController <MKMapViewDelegate,CLLocationManagerDelegate,DirectionsViewControllerDelegate>{
    BOOL canChangeMap;
    UIImageView* routeView;
	NSArray* routes;
	UIColor* lineColor;
}

@property (strong, nonatomic) MKMapView *mainMapView;
@property (nonatomic, retain) UIColor* lineColor;
-(void) showRouteFrom: (Place*) start to:(Place*) end;
@end
