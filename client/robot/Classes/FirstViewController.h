//
//  FirstViewController.h
//  template
//
//  Created by apple on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "DeatilViewController.h"
#import "Place.h"
#import "PlaceMark.h"
#import "RegexKitLite.h"
#import "AppDelegate.h"
#import "UploadViewController.h"
#import "HjxPhotoViewController.h"
#import "CustomSegmentedControl.h"
#import "HGKOptionPanel.h"
#import "MTLocateMeBarButtonItem.h"
#import "MTLocationManager.h"
#import "FKFilterPickerController.h"
#import "FKImagePickerController.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
@interface FirstViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,DirectionsViewControllerDelegate,CustomSegmentedControlDelegate,ASIHTTPRequestDelegate>{
    BOOL canChangeMap;
    UIImageView *routeView;
	NSArray *routes;
	UIColor *lineColor;
    NSMutableArray *nsArray;
    BOOL                isinitArray;
    NSArray* buttons;
    UIView *secondView;
    HGKOptionPanel *panel;
    BOOL showlogin;
    MBProgressHUD  * _MBProgress;
}
@property (nonatomic, retain) UIBarButtonItem *locationItem;
@property (retain, nonatomic) MKMapView *mainMapView;
@property (nonatomic, retain) UIColor *lineColor;
-(void) showRouteFrom: (Place *) start to:(Place *) end;
-(void) showRouteLine:(Place *) endPlace;
-(void)showPhotos;
-(void)showCamera;
@end
