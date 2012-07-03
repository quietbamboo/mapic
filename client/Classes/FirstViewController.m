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
@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize mainMapView;
@synthesize lineColor;

#pragma mark
#pragma mark get some annotaion size
+ (CGFloat)annotationPadding
{
    return 10.0f;
}

+ (CGFloat)calloutHeight
{
    return 40.0f;
}

#pragma mark
#pragma mark to other view Methods
- (void)removePins {
    [self.mainMapView removeAnnotations:self.mainMapView.annotations];
}

- (void)toCameraViewController {
    CameraViewController *camera = [[CameraViewController alloc] init];
    [self.navigationController pushViewController:camera animated:YES];
    [camera release];
}

- (void)toSettingViewController {
    SettingViewController *setting = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
    [setting release];
}

- (void)toDetailView:(UIButton *)sender {
    DeatilViewController *detail = [[DeatilViewController alloc] init];
    detail.delegate = self;
    Place *place = [[Place alloc] init];
    place.name = @"清河北大";
    place.image = [UIImage imageNamed:@"andong.jpg"];
    place.description = nil;
    place.longitude = 116.319281;
    place.latitude = 39.936996;
    detail.endPlace = place;
    [self.navigationController pushViewController:detail animated:YES];
    [detail release];
    [place release];
}

- (void)moveToCurrentLocation {
	[mainMapView setCenterCoordinate:[mainMapView.userLocation coordinate] animated:YES];
}

#pragma mark 
#pragma mark Google get polyLine Methods

-(NSMutableArray *)decodePolyLine: (NSMutableString *)encoded {
	[encoded replaceOccurrencesOfString:@"\\\\" withString:@"\\"
								options:NSLiteralSearch
								  range:NSMakeRange(0, [encoded length])];
	NSInteger len = [encoded length];
	NSInteger index = 0;
	NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
	NSInteger lat=0;
	NSInteger lng=0;
	while (index < len) {
		NSInteger b;
		NSInteger shift = 0;
		NSInteger result = 0;
		do {
			b = [encoded characterAtIndex:index++] - 63;
			result |= (b & 0x1f) << shift;
			shift += 5;
		} while (b >= 0x20);
		NSInteger dlat = ((result & 1) ? ~(result >> 1) : (result >> 1));
		lat += dlat;
		shift = 0;
		result = 0;
		do {
			b = [encoded characterAtIndex:index++] - 63;
			result |= (b & 0x1f) << shift;
			shift += 5;
		} while (b >= 0x20);
		NSInteger dlng = ((result & 1) ? ~(result >> 1) : (result >> 1));
		lng += dlng;
		NSNumber *latitude = [[[NSNumber alloc] initWithFloat:lat * 1e-5] autorelease];
		NSNumber *longitude = [[[NSNumber alloc] initWithFloat:lng * 1e-5] autorelease];
		printf("[%f,", [latitude doubleValue]);
		printf("%f]", [longitude doubleValue]);
		CLLocation *loc = [[[CLLocation alloc] initWithLatitude:[latitude floatValue] longitude:[longitude floatValue]] autorelease];
		[array addObject:loc];
	}
	
	return array;
}

-(NSArray*) calculateRoutesFrom:(CLLocationCoordinate2D) f to: (CLLocationCoordinate2D) t {
	NSString* saddr = [NSString stringWithFormat:@"%f,%f", f.latitude, f.longitude];
	NSString* daddr = [NSString stringWithFormat:@"%f,%f", t.latitude, t.longitude];
	
	NSString* apiUrlStr = [NSString stringWithFormat:@"http://maps.google.com/maps?output=dragdir&saddr=%@&daddr=%@", saddr, daddr];
	NSURL* apiUrl = [NSURL URLWithString:apiUrlStr];
	NSLog(@"api url: %@", apiUrl);
	NSString *apiResponse = [NSString stringWithContentsOfURL:apiUrl];
	NSString* encodedPoints = [apiResponse stringByMatching:@"points:\\\"([^\\\"]*)\\\"" capture:1L];
	
	return [self decodePolyLine:[encodedPoints mutableCopy]];
}

-(void) centerMap {
	MKCoordinateRegion region;
    
	CLLocationDegrees maxLat = -90;
	CLLocationDegrees maxLon = -180;
	CLLocationDegrees minLat = 90;
	CLLocationDegrees minLon = 180;
	for(int idx = 0; idx < routes.count; idx++)
	{
		CLLocation* currentLocation = [routes objectAtIndex:idx];
		if(currentLocation.coordinate.latitude > maxLat)
			maxLat = currentLocation.coordinate.latitude;
		if(currentLocation.coordinate.latitude < minLat)
			minLat = currentLocation.coordinate.latitude;
		if(currentLocation.coordinate.longitude > maxLon)
			maxLon = currentLocation.coordinate.longitude;
		if(currentLocation.coordinate.longitude < minLon)
			minLon = currentLocation.coordinate.longitude;
	}
	region.center.latitude     = (maxLat + minLat) / 2;
	region.center.longitude    = (maxLon + minLon) / 2;
	region.span.latitudeDelta  = maxLat - minLat;
	region.span.longitudeDelta = maxLon - minLon;
	
	[mainMapView setRegion:region animated:YES];
}

-(void) showRouteFrom: (Place*) f to:(Place*) t {
	
	if(routes) {
		[mainMapView removeAnnotations:[mainMapView annotations]];
		[routes release];
	}
	
	PlaceMark* from = [[[PlaceMark alloc] initWithPlace:f] autorelease];
	PlaceMark* to = [[[PlaceMark alloc] initWithPlace:t] autorelease];
	
	[mainMapView addAnnotation:from];
	[mainMapView addAnnotation:to];
	
	routes = [[self calculateRoutesFrom:from.coordinate to:to.coordinate] retain];
	
	[self updateRouteView];
	[self centerMap];
}

-(void) updateRouteView {
	CGContextRef context = 	CGBitmapContextCreate(nil, 
												  routeView.frame.size.width, 
												  routeView.frame.size.height, 
												  8, 
												  4 * routeView.frame.size.width,
												  CGColorSpaceCreateDeviceRGB(),
												  kCGImageAlphaPremultipliedLast);
	
	CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
	CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
	CGContextSetLineWidth(context, 6.0);
	
	for(int i = 0; i < routes.count; i++) {
		CLLocation* location = [routes objectAtIndex:i];
		CGPoint point = [mainMapView convertCoordinate:location.coordinate toPointToView:routeView];
		
		if(i == 0) {
			CGContextMoveToPoint(context, point.x, routeView.frame.size.height - point.y);
		} else {
			CGContextAddLineToPoint(context, point.x, routeView.frame.size.height - point.y);
		}
	}
	CGContextStrokePath(context);
	CGImageRef image = CGBitmapContextCreateImage(context);
	UIImage* img = [UIImage imageWithCGImage:image];
	routeView.image = img;
	CGContextRelease(context);
}

#pragma mark
#pragma mark CLLocationManagerDelegate Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	mainMapView.region = MKCoordinateRegionMake(newLocation.coordinate, MKCoordinateSpanMake(0.01f, 0.01f));
	[manager stopUpdatingHeading];
}

#pragma mark
#pragma mark MKMapViewDelegate Methods
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
	routeView.hidden = YES;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
	[self updateRouteView];
	routeView.hidden = NO;
	[routeView setNeedsDisplay];
}
- (void) mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    canChangeMap = NO;
}
- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    if (canChangeMap) {
//        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(mainMapView.userLocation.location.coordinate,1000, 1000); 
//        [mainMapView setRegion:viewRegion];
        
        Place *place = [[Place alloc] init];
        place.name = @"清河北大";
        place.image = [UIImage imageNamed:@"andong.jpg"];
        place.description = nil;
        place.longitude = 116.319281;
        place.latitude = 39.936996;
        PlaceMark *placeMark = [[PlaceMark alloc] initWithPlace:place];
        [self.mainMapView addAnnotation:placeMark];
        [place release];
        [placeMark release];
    }
    
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // handle our two custom annotations
    //

    if ([annotation isKindOfClass:[PlaceMark class]])   // for City of San Francisco
    {
        static NSString* SFAnnotationIdentifier = @"SFAnnotationIdentifier";
        MKPinAnnotationView* pinView =
        (MKPinAnnotationView *)[mainMapView dequeueReusableAnnotationViewWithIdentifier:SFAnnotationIdentifier];
        if (!pinView)
        {
            MKAnnotationView *annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation
                                                                             reuseIdentifier:SFAnnotationIdentifier] autorelease];
            annotationView.canShowCallout = YES;
            
            PlaceMark *placeMark = annotation;
            UIImage *flagImage = placeMark.place.image;
            
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

- (void)directionsViewController:(DeatilViewController *)viewController toPlace:(Place *)endPlace{
    [viewController.navigationController popViewControllerAnimated:YES];
    
    Place* home = [[[Place alloc] init] autorelease];
	home.name = @"Current Location";
	home.description = nil;
	home.latitude = mainMapView.userLocation.location.coordinate.latitude;
	home.longitude = mainMapView.userLocation.location.coordinate.longitude;
    home.image = nil;

    [self showRouteFrom:home to:endPlace];
}

#pragma mark
#pragma mark default Mthods
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
    
    UIButton *resetButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    resetButton.frame = CGRectMake(270, 386, 40, 40);
    [resetButton setTitle:@"重置" forState:UIControlStateNormal];
    [resetButton setImage:[UIImage imageNamed:@"reset.png"] forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(removePins) forControlEvents:UIControlEventTouchUpInside];
    
    mainMapView = [[MKMapView alloc] initWithFrame:self.view.bounds];  
    mainMapView.mapType = MKMapTypeStandard;   
    mainMapView.zoomEnabled = YES; 
    mainMapView.scrollEnabled = YES;
    mainMapView.showsUserLocation = YES;
    mainMapView.delegate = self;
    
    [mainMapView addSubview:resetButton];
    [self.view  addSubview:mainMapView];
    routeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, mainMapView.frame.size.width, mainMapView.frame.size.height)];
    routeView.userInteractionEnabled = NO;
    [mainMapView addSubview:routeView];
    
    
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	locationManager.distanceFilter = 1000.0f;
    [locationManager startUpdatingLocation];
    MKCoordinateSpan theSpan; 
    theSpan.latitudeDelta = 0.05f; 
    theSpan.longitudeDelta = 0.05f; 
    MKCoordinateRegion theRegion; 
	CLLocationCoordinate2D cr  = locationManager.location.coordinate;
    theRegion.center = cr; //[[locationManager location] coordinate]; 
    theRegion.span = theSpan; 
    [mainMapView setRegion:theRegion]; 
    
    
    self.lineColor = [UIColor blackColor];
    
    [mainMapView autorelease];
	// Do any additional setup after loading the view.
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

- (void)dealloc {
	if(routes) {
		[routes release];
	}
	[routeView release];
    [super dealloc];
}

@end
