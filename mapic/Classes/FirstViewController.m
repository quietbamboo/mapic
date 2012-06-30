//
//  FirstViewController.m
//  template
//
//  Created by apple on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "CameraViewController.h"
#import "SettingViewController.h"
#import "PlaceAnnotaion.h"
@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize mainMapView;

+ (CGFloat)annotationPadding;
{
    return 10.0f;
}
+ (CGFloat)calloutHeight;
{
    return 40.0f;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (id)init {
    self = [super init];
    if (self) {
        canChangeMap = YES;
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
} 


- (void) loadView {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    [contentView release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"主页";
    UIBarButtonItem *btnSetting = [[UIBarButtonItem alloc] 
                                initWithTitle:@"设置"                                            
                                style:UIBarButtonItemStyleBordered 
                                target:self 
                                action:@selector(toSettingViewController)];
    self.navigationItem.rightBarButtonItem = btnSetting;
    [btnSetting release];
    UIBarButtonItem *btnCamera = [[UIBarButtonItem alloc] 
                                  initWithTitle:@"拍照"                                            
                                  style:UIBarButtonItemStyleBordered 
                                  target:self 
                                  action:@selector(toCameraViewController)];
    self.navigationItem.leftBarButtonItem = btnCamera;
    [btnCamera release];
    
    mainMapView = [[MKMapView alloc] initWithFrame:self.view.bounds];  
    mainMapView.mapType = MKMapTypeStandard;   
    mainMapView.zoomEnabled = YES; 
    mainMapView.scrollEnabled = YES;
    mainMapView.showsUserLocation = YES;
    mainMapView.delegate = self;
    UILongPressGestureRecognizer *lpress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    lpress.minimumPressDuration = 0.5;//按0.5秒响应longPress方法
    lpress.allowableMovement = 10.0;
    [self.mainMapView addGestureRecognizer:lpress];//m_mapView是MKMapView的实例
    [lpress release];
    [self.view  addSubview:mainMapView];
    [mainMapView autorelease];
	// Do any additional setup after loading the view.
}

- (void)toCameraViewController{

    CameraViewController *camera = [[CameraViewController alloc] init];
    [self.navigationController pushViewController:camera animated:YES];
    [camera release];
}
- (void)toSettingViewController{
    SettingViewController *setting = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
    [setting release];
}

- (void)toDetailView:(UIButton *)sender {
    DeatilViewController *detail = [[DeatilViewController alloc] init];
    detail.delegate = self;
    [self.navigationController pushViewController:detail animated:YES];
    [detail release];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark
#pragma mark MKMapViewDelegate methods

- (void) mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    canChangeMap = NO;
}
- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    if (canChangeMap) {
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(mainMapView.userLocation.location.coordinate,10000, 10000); 
        [mainMapView setRegion:viewRegion];
        
        PlaceAnnotaion *place = [[PlaceAnnotaion alloc] init];
        place.titleName = @"清河北大";
        place.subtitleName = nil;
        place.longitude = [NSNumber numberWithDouble: -122.419281];
        place.latitude = [NSNumber numberWithDouble:37.786996];
        place.image = [UIImage imageNamed:@"andong.jpg"];
        [self.mainMapView addAnnotation:place];
        [place release];
        
    }
    
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // handle our two custom annotations
    //

    if ([annotation isKindOfClass:[PlaceAnnotaion class]])   // for City of San Francisco
    {
        static NSString* SFAnnotationIdentifier = @"SFAnnotationIdentifier";
        MKPinAnnotationView* pinView =
        (MKPinAnnotationView *)[mainMapView dequeueReusableAnnotationViewWithIdentifier:SFAnnotationIdentifier];
        if (!pinView)
        {
            MKAnnotationView *annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation
                                                                             reuseIdentifier:SFAnnotationIdentifier] autorelease];
            annotationView.canShowCallout = YES;
            
            PlaceAnnotaion *place = annotation;
            UIImage *flagImage = place.image;
            
            CGRect resizeRect;
            
            resizeRect.size = flagImage.size;
            CGSize maxSize = CGRectInset(self.view.bounds,
                                         [FirstViewController annotationPadding],
                                         [FirstViewController annotationPadding]).size;
            maxSize.height -= self.navigationController.navigationBar.frame.size.height + [FirstViewController calloutHeight];
            if (resizeRect.size.width > maxSize.width)
                resizeRect.size = CGSizeMake(maxSize.width - 200, resizeRect.size.height / resizeRect.size.width * maxSize.width - 300);
            if (resizeRect.size.height > maxSize.height)
                resizeRect.size = CGSizeMake(resizeRect.size.width / resizeRect.size.height * maxSize.height - 200, maxSize.height - 300);
            
            resizeRect.origin = (CGPoint){0.0f, 0.0f};
            UIGraphicsBeginImageContext(resizeRect.size);
            [flagImage drawInRect:resizeRect];
            UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            annotationView.image = resizedImage;
            annotationView.opaque = NO;
            
            UIButton *accesbutton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [accesbutton addTarget:self action:@selector(toDetailView:) 
                         forControlEvents:UIControlEventTouchUpInside];
            [annotationView setRightCalloutAccessoryView:accesbutton];
            return annotationView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    
    return nil;
}

#pragma mark 
#pragma mark DirectionsViewControllerDelegate methods
- (void)directionsViewControllerDidCancel:(DeatilViewController *)viewController{
}
- (void)directionsViewController:(DeatilViewController *)viewController routeFromAddress:(NSString *)startAddress toAddress:(NSString *)endAddress{
    [viewController.navigationController popViewControllerAnimated:YES];
//    MKPolyline *routeLine = [MKPolyline polylineWithPoints:points count:2;
//                             [mainMapView addOverlay:routeLine];
//                             [mainMapView setVisibleMapRect:routeVisableRegion animated:YES]; 
}












@end
