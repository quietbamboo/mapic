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
#import "RegexKitLite.h"
#import "AppDelegate.h"
#import "ImagePickeDelegateMthods.h"

@interface FirstViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate,DirectionsViewControllerDelegate>{
    BOOL canChangeMap;
    UIImageView *routeView;
	NSArray *routes;
	UIColor *lineColor;
    NSMutableArray *nsArray;
    ImagePickeDelegateMthods *imagePickeDelegate;
    BOOL                isinitArray;
}

@property (retain, nonatomic) MKMapView *mainMapView;
@property (nonatomic, retain) UIColor *lineColor;
-(void) showRouteFrom: (Place *) start to:(Place *) end;
-(void) showRouteLine:(Place *) endPlace;
-(void)showPhotos;
-(void)showCamera;
@end
