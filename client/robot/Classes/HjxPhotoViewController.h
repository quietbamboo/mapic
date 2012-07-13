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


//@class AdMobView;

NSString* photoList;
@protocol DirectionsViewControllerDelegate;
@interface HjxPhotoViewController : TTPhotoViewController<UIAlertViewDelegate, GADBannerViewDelegate> {

//    GADBannerView *adMobAd;
//    NSTimer *adTimer;
//    UIView *adBanner;
//    UIImageView* crossButton;
    
	TTActivityLabel *listlabel;
	UIBarButtonItem* _goodButton;
	UIBarButtonItem* _badButton;
	UIBarButtonItem* _saveButton;
	UIBarButtonItem* _reportButton;
    UIBarButtonItem* _playButton;
}




//@property (nonatomic, retain) NSTimer *adTimer;
//@property (nonatomic, retain) GADBannerView *adMobAd;
@property (nonatomic, retain) TTActivityLabel *listlabel;
@property (nonatomic, retain) NSString* clicked;
@property (nonatomic, assign) id<DirectionsViewControllerDelegate> delegate;
@property (nonatomic, retain) Place *endPlace;
@end
@protocol DirectionsViewControllerDelegate <NSObject>

- (void)directionsViewControllerDidCancel:(HjxPhotoViewController *)viewController;
- (void)directionsViewController:(HjxPhotoViewController *)viewController toPlace:(Place *)endPlace;
@end