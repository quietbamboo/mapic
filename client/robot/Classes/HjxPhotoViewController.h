//
//  HjxPhotoViewController.h
//  template
//
//  Created by Jim on 9/17/10.
//  Copyright 2010 Blue Sky Software. All rights reserved.
//

#import "Three20/Three20.h"
#import "MockPhotoSource.h"
//#import "itootSound.h"
//#import "AdMobDelegateProtocol.h"
//#import "AdMobView.h"
#import "GADBannerView.h"
#import "InneractiveAd.h"
#import "Place.h"
#import "MBProgressHUD.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequestDelegate.h"
#import "ASIProgressDelegate.h"
#import "BDViewController.h"
#import "PhotoMessageViewController.h"
#import "HMGLTransitionManager.h"
#import "Switch3DTransition.h"
//@class AdMobView;

NSString* photoList;
@protocol DirectionsViewControllerDelegate;
@interface HjxPhotoViewController : TTPhotoViewController<UIAlertViewDelegate, GADBannerViewDelegate,ASIHTTPRequestDelegate,ModalControllerDelegate> {

//    GADBannerView *adMobAd;
//    NSTimer *adTimer;
//    UIView *adBanner;
//    UIImageView* crossButton;
    
	//TTActivityLabel *listlabel;
    NSTimer* _MBhideTimer;
    MBProgressHUD  * _MBProgress;
	UIBarButtonItem* _goodButton;
	UIBarButtonItem* _badButton;
	UIBarButtonItem* _saveButton;
	UIBarButtonItem* _reportButton;
    UIBarButtonItem* _messageButton;
    UIBarButtonItem* _routeButton;
    UIProgressView *progressIndicator;
}




//@property (nonatomic, retain) NSTimer *adTimer;
//@property (nonatomic, retain) GADBannerView *adMobAd;
//@property (nonatomic, retain) TTActivityLabel *listlabel;
//@property (nonatomic, retain) MBProgressHUD *MBProgress;
@property (nonatomic, retain) NSString* clicked;
@property (nonatomic, assign) id<DirectionsViewControllerDelegate> delegate;
@property (nonatomic, retain) Place *endPlace;
@end
@protocol DirectionsViewControllerDelegate <NSObject>

- (void)directionsViewControllerDidCancel:(HjxPhotoViewController *)viewController;
- (void)directionsViewController:(HjxPhotoViewController *)viewController toPlace:(Place *)endPlace;
@end