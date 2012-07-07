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
#define ButtonTag 1000
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
#pragma mark init nsArray
- (void)initnaArray{
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1500],@"Distance",@"weibo.png",@"image",[NSNumber numberWithDouble:39.946996],@"lat",[NSNumber numberWithDouble:116.339281],@"lon",@"Yale University",@"name",@"Yale University is a private research university in New Haven, Connecticut, and a member of the Ivy League. Founded in 1701 in the Colony of Connecticut, the university is the third-oldest institution of higher education in the United States. Yale has produced many notable alumni, including five U.S. presidents, seventeen U.S. Supreme Court Justices, and several foreign heads of state.",@"dec",nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1200],@"Distance",@"logo.png",@"image",[NSNumber numberWithDouble:39.966996],@"lat",[NSNumber numberWithDouble:116.329281],@"lon",@"Harvard University",@"name",@"Harvard University (Harvard University) is the longest in U.S. history one of the first-class academic institution, is located in Cambridge, Massachusetts, and at Boston and across the Charles River. Harvard University has two colleges to recruit students, Harvard College and Radcliffe College, which recruited the students about half of all students at Harvard University. Ivy Harvard University is one of the school.",@"dec",nil];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1100],@"Distance",@"reset.png",@"image",[NSNumber numberWithDouble:39.976996],@"lat",[NSNumber numberWithDouble:116.359281],@"lon",@"University of Cambridge",@"name",@"The University of Cambridge (informally Cambridge University, or simply Cambridge) is the second oldest university in England and the fourth oldest in the world. In post-nominals the university's name is abbreviated as Cantab, a shortened form of Cantabrigiensis (an adjective derived from Cantabrigia, the Latinised form of Cambridge).",@"dec",nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1300],@"Distance",@"weibo.png",@"image",[NSNumber numberWithDouble:37.775812],@"lat",[NSNumber numberWithDouble:-122.406403],@"lon",@"北京大学",@"name",@"北京大学创办于1898年，初名京师大学堂，是中国第一所国立综合性大学，也是当时中国最高教育行政机关。辛亥革命后，于1912年改为现名。作为新文化运动的中心和“五四”运动的策源地，作为中国最早传播马克思主义和民主科学思想的发祥地，作为中国共产党最早的活动基地，北京大学为民族的振兴和解放、国家的建设和发展、社会的文明和进步做出了不可替代的贡献，在中国走向现代化的进程中起到了重要的先锋作用。爱国、进步、民主、科学的传统精神和勤奋、严谨、求实、创新的学风在这里生生不息、代代相传。",@"dec",nil];
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1400],@"Distance",@"logo.png",@"image",[NSNumber numberWithDouble:37.775812],@"lat",[NSNumber numberWithDouble:-122.426403],@"lon",@"故宫",@"name",@"在北京市中心，也称紫禁城，是明清两代的皇宫，先后居住过24个皇帝。现辟为故宫博物院。紫禁城被称为“殿宇之海”，总面积72万多平方米，有殿宇宫室9999间半。周围环绕着高10米，长3400米的宫墙，墙外有52米宽的护城河。紫禁城分外朝和内廷两大部分。外朝以太和、中和、保和三大殿为中心，文华、武英殿为两翼；内廷以乾清宫、交泰殿、坤宁宫为中心，东西六宫为两翼，布局严谨有序。一条从午门、三大殿、后三宫直达御花园的钦安殿和神武门的中路，构成了整个故宫的中轴。这个中轴又在北京城的中轴线上。在紫禁城中轴宫殿两旁，还对称分布着许多殿宇，也都宏伟华丽。紫禁城4个城角都有精巧玲珑的角楼，所谓“九梁十八柱”，异常美观。故宫博物院内陈列我国各个朝代的艺术珍品，是中国最丰富的文化和艺术的宝库。故宫的整个建筑金碧辉煌，庄严绚丽，被誉为世界五大宫之一（北京故宫、凡尔赛宫、白金汉宫、白宫、克里姆林宫），并为联合国科教文组织列为“世界文化遗产”。",@"dec",nil];
    NSDictionary *dic6 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1600],@"Distance",@"reset.png",@"image",[NSNumber numberWithDouble:37.775812],@"lat",[NSNumber numberWithDouble:-122.416403],@"lon",@"北海公园",@"name",@"位于故宫西北。北海占地70余万平方米，水面占全园面积一半以上。北海及其南面的中海和南海均为皇城内最重要的皇家园林，因位于紫禁城西，当时统称为西苑。琼华岛是北海景物的中心，也是历代帝王心目中的海上仙山。清顺治8年（公元1651年）在琼华岛山顶建喇嘛塔（白塔），山前建佛寺。北海北岸布置了几组宗教建筑，有：小西天、大西天、阐福寺，西天梵境等，还有五色琉璃镶砌的九龙壁，两面各有蟠龙9条，戏珠于波涛云际，造型生动，色彩明快。园内还保存有文物铁影壁、一座16面多角形塔式石幢、495方历代著名书法家真迹、万岁山团城和承光殿玉佛等",@"dec",nil];
    nsArray = [[NSMutableArray alloc] initWithCapacity:0];
    if (isinitArray) {
        [nsArray removeAllObjects];
        [nsArray addObject:dic1];
        [nsArray addObject:dic2];
        [nsArray addObject:dic3];
        [nsArray addObject:dic4];
        [nsArray addObject:dic5];
        [nsArray addObject:dic6];
    }else {
        [nsArray addObject:dic1];
        [nsArray addObject:dic2];
        [nsArray addObject:dic3];
        [nsArray addObject:dic4];
        [nsArray addObject:dic5];
        [nsArray addObject:dic6];
    }
     for (NSUInteger i = 0; i < [nsArray count]; i++) {
         Place *place = [[Place alloc] init];
         NSDictionary *nsdic = [nsArray objectAtIndex:i];
         place.btnTag = ButtonTag + i;
         place.name = [nsdic objectForKey:@"name"];
         place.image = [UIImage imageNamed:[nsdic objectForKey:@"image"]];
         place.latitude = [(NSNumber *)[nsdic objectForKey:@"lat"] doubleValue];
         place.longitude = [(NSNumber *)[nsdic objectForKey:@"lon"] doubleValue];
         place.description = [NSString stringWithFormat:@"距离:%d%@",[(NSNumber *)[nsdic objectForKey:@"Distance"] intValue],@"米"];
         PlaceMark *placeMark = [[PlaceMark alloc] initWithPlace:place];
         [self.mainMapView addAnnotation:placeMark];
         [place release];
         [placeMark release];
    }
}
- (void)updateMapSlider: (UISlider *) sender{
    
    //  NSLog(@"this is ******%f**",mapslider.value);
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(mainMapView.userLocation.location.coordinate,sender.value, sender.value); 
    [mainMapView setRegion:viewRegion animated:YES];
}
#pragma mark
#pragma mark to other view Methods
- (void)removePins {
    isinitArray = YES;
   [self.mainMapView removeAnnotations:self.mainMapView.annotations];
   // [self.mainMapView.annotations removeAllObjects];
    [self moveToCurrentLocation];
    mainMapView.showsUserLocation = YES;
    [self initnaArray]; 
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
    NSDictionary *nsdic = [nsArray objectAtIndex:([sender tag] - ButtonTag) ];
    place.name = [nsdic objectForKey:@"name"];
    place.image = [UIImage imageNamed:[nsdic objectForKey:@"image"]];
    place.latitude = [(NSNumber *)[nsdic objectForKey:@"lat"] doubleValue];
    place.longitude = [(NSNumber *)[nsdic objectForKey:@"lon"] doubleValue];
    place.description = [nsdic objectForKey:@"dec"];
    detail.endPlace = place;
    [self.navigationController pushViewController:detail animated:YES];
    [detail release];
    [place release];
}

- (void)moveToCurrentLocation {
	[mainMapView setCenterCoordinate:[mainMapView.userLocation coordinate] animated:YES];
}

#pragma mark
#pragma mark show Photos and Camera Methods

-(void)showPhotos{
    [[[AppDelegate getAppDelegate] centerButton] setHidden:YES];
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = imagePickeDelegate;
    imagePickerController.allowsImageEditing = YES;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:imagePickerController animated:YES];
    [imagePickerController release];
}

-(void)showCamera{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
         [[[AppDelegate getAppDelegate] centerButton] setHidden:YES];
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        imagePickerController.delegate = imagePickeDelegate;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentModalViewController:imagePickerController animated:YES];
        [imagePickerController release];
    }
}


#pragma mark 
#pragma mark Google get polyLine Methods
-(void) showRouteLine:(Place *)endPlace{
    Place* home = [[[Place alloc] init] autorelease];
	home.name = @"Current Location";
	home.description = nil;
	home.latitude = mainMapView.userLocation.location.coordinate.latitude;
	home.longitude = mainMapView.userLocation.location.coordinate.longitude;
    home.image = nil;
    
    [self showRouteFrom:home to:endPlace];
}

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
	//NSLog(@"api url: %@", apiUrl);
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
        [self moveToCurrentLocation];
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
            accesbutton.tag = placeMark.place.btnTag;
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
        imagePickeDelegate = [[ImagePickeDelegateMthods alloc] init];
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    //[self moveToCurrentLocation];
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
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	locationManager.distanceFilter = 1000.0f;
    [locationManager startUpdatingLocation];
    
    mainMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 430)];  
    mainMapView.mapType = MKMapTypeStandard;   
    mainMapView.zoomEnabled = YES; 
    mainMapView.scrollEnabled = YES;
    mainMapView.showsUserLocation = YES;
    mainMapView.delegate = self;
    [self.view  addSubview:mainMapView];
    
    UIButton *resetButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    resetButton.frame = CGRectMake(270, 386, 40, 40);
    [resetButton setTitle:@"重置" forState:UIControlStateNormal];
    [resetButton setImage:[UIImage imageNamed:@"reset.png"] forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(removePins) forControlEvents:UIControlEventTouchUpInside];
    [mainMapView addSubview:resetButton];
    
    routeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, mainMapView.frame.size.width, mainMapView.frame.size.height)];
    routeView.userInteractionEnabled = NO;
    [mainMapView addSubview:routeView];

   UISlider  *mapslider = [[[UISlider alloc] initWithFrame:CGRectMake(60, 10, 200, 10)] autorelease];
    mapslider.maximumValue = 10000;
    mapslider.minimumValue = 0;
    mapslider.value = 1000;
    [mapslider addTarget:self action:@selector(updateMapSlider:) forControlEvents:UIControlEventTouchUpInside];
    [mainMapView addSubview:mapslider];
    //[mapslider release];
   
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
    isinitArray = NO;
    [self initnaArray];

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
