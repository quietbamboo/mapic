//
//  FirstViewController.m
//  template
//
//  Created by apple on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "SettingViewController.h"
#define ButtonTag 1000
#define TAG_VALUE 9000

typedef enum {
    CapLeft          = 0,
    CapMiddle        = 1,
    CapRight         = 2,
    CapLeftAndRight  = 3
} CapLocation;

@interface FirstViewController ()
-(void)addView:(UIView*)subView verticalOffset:(NSUInteger)verticalOffset title:(NSString*)title;
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
- (void)initnaArray:(CLLocationCoordinate2D )sendr{
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1500],@"Distance",@"weibo.png",@"image",[NSNumber numberWithDouble:sendr.latitude - 0.005],@"lat",[NSNumber numberWithDouble:sendr.longitude],@"lon",@"Yale University",@"name",@"Yale University is a private research university in New Haven, Connecticut, and a member of the Ivy League. Founded in 1701 in the Colony of Connecticut, the university is the third-oldest institution of higher education in the United States. Yale has produced many notable alumni, including five U.S. presidents, seventeen U.S. Supreme Court Justices, and several foreign heads of state.",@"dec",nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1200],@"Distance",@"logo.png",@"image",[NSNumber numberWithDouble:sendr.latitude + 0.004],@"lat",[NSNumber numberWithDouble:sendr.longitude],@"lon",@"Harvard University",@"name",@"Harvard University (Harvard University) is the longest in U.S. history one of the first-class academic institution, is located in Cambridge, Massachusetts, and at Boston and across the Charles River. Harvard University has two colleges to recruit students, Harvard College and Radcliffe College, which recruited the students about half of all students at Harvard University. Ivy Harvard University is one of the school.",@"dec",nil];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1100],@"Distance",@"reset.png",@"image",[NSNumber numberWithDouble:sendr.latitude],@"lat",[NSNumber numberWithDouble:sendr.longitude - 0.005],@"lon",@"University of Cambridge",@"name",@"The University of Cambridge (informally Cambridge University, or simply Cambridge) is the second oldest university in England and the fourth oldest in the world. In post-nominals the university's name is abbreviated as Cantab, a shortened form of Cantabrigiensis (an adjective derived from Cantabrigia, the Latinised form of Cambridge).",@"dec",nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1300],@"Distance",@"weibo.png",@"image",[NSNumber numberWithDouble:sendr.latitude],@"lat",[NSNumber numberWithDouble:sendr.longitude + 0.003],@"lon",@"北京大学",@"name",@"北京大学创办于1898年，初名京师大学堂，是中国第一所国立综合性大学，也是当时中国最高教育行政机关。辛亥革命后，于1912年改为现名。作为新文化运动的中心和“五四”运动的策源地，作为中国最早传播马克思主义和民主科学思想的发祥地，作为中国共产党最早的活动基地，北京大学为民族的振兴和解放、国家的建设和发展、社会的文明和进步做出了不可替代的贡献，在中国走向现代化的进程中起到了重要的先锋作用。爱国、进步、民主、科学的传统精神和勤奋、严谨、求实、创新的学风在这里生生不息、代代相传。",@"dec",nil];
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
   //[self.mainMapView removeAnnotations:self.mainMapView.annotations];
    
    for (id<MKAnnotation> myAnnotation in mainMapView.annotations ) {
        if ([myAnnotation isKindOfClass:[MKUserLocation class]]){
            
        }else {
             [self.mainMapView removeAnnotation:myAnnotation];
        }
    }
   // [self.mainMapView.annotations removeAllObjects];
    [self moveToCurrentLocation];
    mainMapView.showsUserLocation = YES;
    //[self initnaArray]; 
    [self doCurl];
   }
- (void) originBu{
    [mainMapView setCenterCoordinate:[mainMapView.userLocation coordinate] animated:YES];
    [self doCurl];
}
- (void)toSettingViewController {
    SettingViewController *setting = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
    [setting release];
}

- (void)toDetailView:(UIButton *)sender {
    //DeatilViewController *detail = [[DeatilViewController alloc] init];
   
    HjxPhotoViewController *hjxPhotoview = [[HjxPhotoViewController alloc] initWithNibName:nil bundle:nil];
    switch ([sender tag] - ButtonTag) {
        case 0:
            hjxPhotoview.clicked = @"tt://photo/top";
            break;
        case 1:
            hjxPhotoview.clicked = @"tt://photo/random";
            break;
        case 2:
            hjxPhotoview.clicked = @"tt://photo/hd";
            break;
        case 3:
            hjxPhotoview.clicked = @"tt://photo/my";
            break;
        case 4:
            hjxPhotoview.clicked = @"tt://photo/like";
            break;
        case 5:
            hjxPhotoview.clicked = @"tt://photo/recent.like";
            break;
        default:
            break;
    }
    hjxPhotoview.delegate = self;
    Place *place = [[Place alloc] init];
    NSDictionary *nsdic = [nsArray objectAtIndex:([sender tag] - ButtonTag) ];
    place.name = [nsdic objectForKey:@"name"];
    place.image = [UIImage imageNamed:[nsdic objectForKey:@"image"]];
    place.latitude = [(NSNumber *)[nsdic objectForKey:@"lat"] doubleValue];
    place.longitude = [(NSNumber *)[nsdic objectForKey:@"lon"] doubleValue];
    place.description = [nsdic objectForKey:@"dec"];
    hjxPhotoview.endPlace = place;
    //[self.navigationController pushViewController:hjxPhotoview animated:YES];
    //[detail release];
    
    self.navigationController.navigationBarHidden = NO;
    [AppDelegate getAppDelegate].centerButton.hidden = YES;
    [self.navigationController pushViewController:hjxPhotoview animated:YES];
    [hjxPhotoview release];
    [place release];
}

- (void)moveToCurrentLocation {
	[mainMapView setCenterCoordinate:[mainMapView.userLocation coordinate] animated:YES];
}

#pragma mark
#pragma mark show Photos and Camera Methods

-(void)showPhotos{
    self.tabBarController.selectedIndex = 0;
    [[[AppDelegate getAppDelegate] centerButton] setHidden:YES];
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.allowsImageEditing = YES;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:imagePickerController animated:YES];
    [imagePickerController release];
}

-(void)showCamera{
    self.tabBarController.selectedIndex = 0;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
         [[[AppDelegate getAppDelegate] centerButton] setHidden:YES];
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentModalViewController:imagePickerController animated:YES];
        [imagePickerController release];
    }
}

#pragma mark
#pragma mark imagePickeDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    //    NSLog(@"image picked %@ with info %@", image, editingInfo);
    //    NSData* jpegData = UIImageJPEGRepresentation (image,0.5);
    //    EXFJpeg* jpegScanner = [[EXFJpeg alloc] init];
    //    [jpegScanner scanImageData: jpegData];
    //    EXFMetaData* exifData = jpegScanner.exifMetaData;
    //    EXFJFIF* jfif = jpegScanner.jfif;
    //    EXFTag* tagDefinition = [exifData tagDefinition: [NSNumber numberWithInt:EXIF_DateTime]];
    //    //EXFTag* latitudeDef = [exifData tagDefinition: [NSNumber numberWithInt:EXIF_GPSLatitude]];
    //    //EXFTag* longitudeDef = [exifData tagDefinition: [NSNumber numberWithInt:EXIF_GPSLongitude]];
    //    id latitudeValue = [exifData tagValue:[NSNumber numberWithInt:EXIF_GPSLatitude]];
    //    id longitudeValue = [exifData tagValue:[NSNumber numberWithInt:EXIF_GPSLongitude]];
    //    id datetime = [exifData tagValue:[NSNumber numberWithInt:EXIF_DateTime]];
    //    id t = [exifData tagValue:[NSNumber numberWithInt:EXIF_Model]];
    
    NSLog(@"this is good");
    //imageView为自己定义的UIImageView
    UIImageWriteToSavedPhotosAlbum(image,nil,nil,nil);
    //[picker.navigationController pushViewController:upload animated:YES];
    [picker dismissModalViewControllerAnimated:YES];
    //[[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
    UploadViewController *upload = [[UploadViewController alloc] init];
    upload.image = image;
    
    [self.navigationController pushViewController:upload animated:YES];
    //[self.tabBarController.view setHidden:YES];
    [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
    [upload release];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    NSLog(@"this is picker");
    [picker dismissModalViewControllerAnimated:YES];
    [[[AppDelegate getAppDelegate] centerButton] setHidden:NO];
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
    CLLocationCoordinate2D coord = newLocation.coordinate;
    [self initnaArray:coord];
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

- (void)directionsViewControllerDidCancel:(HjxPhotoViewController *)viewController{
    
}

- (void)directionsViewController:(HjxPhotoViewController *)viewController toPlace:(Place *)endPlace{
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
#pragma mark showTaBar
-(void) showTabBar:(UITabBarController*) tabbarcontroller {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView*view in tabbarcontroller.view.subviews)
    {
        NSLog(@"%@", view);
        
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x,431, view.frame.size.width, view.frame.size.height)];
            
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width,431)];
        }
        
        
    }
    
    [UIView commitAnimations];
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
    self.navigationController.navigationBarHidden = YES;
    [self showTabBar:self.tabBarController];
    [AppDelegate getAppDelegate].centerButton.hidden = NO;
} 

- (void) loadView {
    UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    [contentView release];
    
    firstView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 431.0f)];
	firstView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:firstView];
    buttons = [[NSArray arrayWithObjects:
                [NSDictionary dictionaryWithObjectsAndKeys:[NSArray arrayWithObjects:@"标准", @"卫星", @"混合", nil], @"titles", [NSValue valueWithCGSize:CGSizeMake(100,38)], @"size", @"bottombarblue.png", @"button-image", @"bottombarblue_pressed.png", @"button-highlight-image", @"blue-divider.png", @"divider-image", [NSNumber numberWithFloat:14.0], @"cap-width", nil],
                nil] retain];
    NSDictionary* blueSegmentedControlData = [buttons objectAtIndex:0];
    NSArray* blueSegmentedControlTitles = [blueSegmentedControlData objectForKey:@"titles"];
    CustomSegmentedControl* blueSegmentedControl = [[[CustomSegmentedControl alloc] initWithSegmentCount:blueSegmentedControlTitles.count segmentsize:[[blueSegmentedControlData objectForKey:@"size"] CGSizeValue] dividerImage:[UIImage imageNamed:[blueSegmentedControlData objectForKey:@"divider-image"]] tag:TAG_VALUE delegate:self] autorelease];
    [self addView:blueSegmentedControl verticalOffset:0 title:@"Blue segmented control"];
   
    UIButton *resetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    resetButton.frame = CGRectMake(10, 306, 90, 38);
    [resetButton setTitle:@"重置" forState:UIControlStateNormal];
    //[resetButton setImage:[UIImage imageNamed:@"reset.png"] forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(removePins) forControlEvents:UIControlEventTouchUpInside];
    [firstView addSubview:resetButton];
    
    UIButton *originButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    originButton.frame = CGRectMake(110, 306, 100, 38);
    [originButton setTitle:@"当前位置" forState:UIControlStateNormal];
    [originButton addTarget:self action:@selector(originBu) forControlEvents:UIControlEventTouchUpInside];
    [firstView addSubview:originButton];
    
    UIButton *curlButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    curlButton.frame = CGRectMake(220, 306, 90, 38);
    [curlButton setTitle:@"关闭" forState:UIControlStateNormal];
    [curlButton addTarget:self action:@selector(doCurl) forControlEvents:UIControlEventTouchUpInside];
    [firstView addSubview:curlButton];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	locationManager.distanceFilter = 1000.0f;
    [locationManager startUpdatingLocation];
    

	secondView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 431.0f)];
	secondView.backgroundColor = [UIColor whiteColor];
    mainMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 431)];  
    mainMapView.mapType = MKMapTypeStandard;   
    mainMapView.zoomEnabled = YES; 
    mainMapView.scrollEnabled = YES;
    mainMapView.showsUserLocation = YES;
    mainMapView.delegate = self;
    [secondView  addSubview:mainMapView];
    [self.view addSubview:secondView];

    isCurl=NO;

    UIButton *curlButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    curlButton.frame = CGRectMake(260, 386, 50, 30);
    [curlButton setTitle:@"翻页" forState:UIControlStateNormal];
    //[curlButton setImage:[UIImage imageNamed:@"reset.png"] forState:UIControlStateNormal];
    [curlButton addTarget:self action:@selector(doCurl) forControlEvents:UIControlEventTouchUpInside];
    [mainMapView addSubview:curlButton];
    
    
    
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
    HGKOptionPanel *panel = [[HGKOptionPanel alloc] initWithFrame:CGRectMake(0, -120, 320, 140)];
    [self.view addSubview:panel];
    [panel release];
    //[self initnaArray];

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
#pragma mark -
#pragma mark PageCurl method
- (void) doCurl
{
	//创建CATransition对象
	CATransition *animation = [CATransition animation];
	//相关参数设置
	[animation setDelegate:self];
	[animation setDuration:0.5f];
	[animation setTimingFunction:UIViewAnimationCurveEaseInOut];
	//向上卷的参数
	if(!isCurl)
	{
		//设置动画类型为pageCurl，并只卷一半
		[animation setType:@"pageCurl"];   
		animation.endProgress=0.6;
	}
	//向下卷的参数
	else
	{
		//设置动画类型为pageUnCurl，并从一半开始向下卷
		[animation setType:@"pageUnCurl"];
		animation.startProgress=0.4;
	}
	//卷的过程完成后停止，并且不从层中移除动画
	[animation setFillMode:kCAFillModeForwards];
	[animation setSubtype:kCATransitionFromBottom];
	[animation setRemovedOnCompletion:NO];
    
	isCurl=!isCurl;
	
	[self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
	[[self.view layer] addAnimation:animation forKey:@"pageCurlAnimation"];

}
#pragma mark -
#pragma mark Three map types of methods
- (void) satelliteBu{
    [mainMapView setMapType:(MKMapTypeSatellite)];
    [self doCurl];
    //mainMapView.mapType = MKMapTypeSatellite;
}
- (void) standardBu{
    [mainMapView setMapType:MKMapTypeStandard];
    [self doCurl];
    //mainMapView.mapType = MKMapTypeStandard;
}
- (void) hybridBu{
    [mainMapView setMapType:MKMapTypeHybrid];
    [self doCurl];
    //mainMapView.mapType = MKMapTypeHybrid;
}
#pragma mark -
#pragma mark CustomSegmentedControlDelegate
-(void)addView:(UIView*)subView verticalOffset:(NSUInteger)verticalOffset title:(NSString*)title
{
    // Figure out the vertical location based on the offset and heights
    //CGFloat elementVerticalLocation = (VERTICAL_HEIGHT + (VERTICAL_SPACING * 2)) * verticalOffset;
    
    //  // Add a label
    //  UILabel* label = [[[UILabel alloc] initWithFrame:CGRectMake(HORIZONTAL_OFFSET, elementVerticalLocation + VERTICAL_OFFSET, 0, 0)] autorelease];
    //  label.backgroundColor = [UIColor clearColor];
    //  label.textColor = [UIColor blueColor];
    //  label.text = title;
    //  [label sizeToFit];
    //  
    //  [self.view addSubview:label];
    
    // Adjust location of new subView and add it
    //  subView.frame = CGRectMake(HORIZONTAL_OFFSET, elementVerticalLocation + 5 + VERTICAL_OFFSET, subView.frame.size.width, subView.frame.size.height);
    subView.frame = CGRectMake(10, 364, subView.frame.size.width, subView.frame.size.height);
    [firstView addSubview:subView];
}

-(UIImage*)image:(UIImage*)image withCap:(CapLocation)location capWidth:(NSUInteger)capWidth buttonWidth:(NSUInteger)buttonWidth
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(buttonWidth, image.size.height), NO, 0.0);
    
    if (location == CapLeft)
        // To draw the left cap and not the right, we start at 0, and increase the width of the image by the cap width to push the right cap out of view
        [image drawInRect:CGRectMake(0, 0, buttonWidth + capWidth, image.size.height)];
    else if (location == CapRight)
        // To draw the right cap and not the left, we start at negative the cap width and increase the width of the image by the cap width to push the left cap out of view
        [image drawInRect:CGRectMake(0.0-capWidth, 0, buttonWidth + capWidth, image.size.height)];
    else if (location == CapMiddle)
        // To draw neither cap, we start at negative the cap width and increase the width of the image by both cap widths to push out both caps out of view
        [image drawInRect:CGRectMake(0.0-capWidth, 0, buttonWidth + (capWidth * 2), image.size.height)];
    
    UIImage* resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}


- (UIButton*) buttonFor:(CustomSegmentedControl*)segmentedControl atIndex:(NSUInteger)segmentIndex;
{
    NSUInteger dataOffset = segmentedControl.tag - TAG_VALUE ;
    NSDictionary* data = [buttons objectAtIndex:dataOffset];
    NSArray* titles = [data objectForKey:@"titles"];
    
    CapLocation location;
    if (segmentIndex == 0)
        location = CapLeft;
    else if (segmentIndex == titles.count - 1)
        location = CapRight;
    else
        location = CapMiddle;
    
    UIImage* buttonImage = nil;
    UIImage* buttonPressedImage = nil;
    
    CGFloat capWidth = [[data objectForKey:@"cap-width"] floatValue];
    CGSize buttonSize = [[data objectForKey:@"size"] CGSizeValue];
    
    if (location == CapLeftAndRight)
    {
        buttonImage = [[UIImage imageNamed:[data objectForKey:@"button-image"]] stretchableImageWithLeftCapWidth:capWidth topCapHeight:0.0];
        buttonPressedImage = [[UIImage imageNamed:[data objectForKey:@"button-highlight-image"]] stretchableImageWithLeftCapWidth:capWidth topCapHeight:0.0];
    }
    else
    {
        buttonImage = [self image:[[UIImage imageNamed:[data objectForKey:@"button-image"]] stretchableImageWithLeftCapWidth:capWidth topCapHeight:0.0] withCap:location capWidth:capWidth buttonWidth:buttonSize.width];
        buttonPressedImage = [self image:[[UIImage imageNamed:[data objectForKey:@"button-highlight-image"]] stretchableImageWithLeftCapWidth:capWidth topCapHeight:0.0] withCap:location capWidth:capWidth buttonWidth:buttonSize.width];
    }
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0, 0.0, buttonSize.width, buttonSize.height);
    
    [button setTitle:[titles objectAtIndex:segmentIndex] forState:UIControlStateNormal];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonPressedImage forState:UIControlStateHighlighted];
    [button setBackgroundImage:buttonPressedImage forState:UIControlStateSelected];
    button.adjustsImageWhenHighlighted = NO;
    
    if (segmentIndex == 0)
        button.selected = YES;
    return button;
}
- (void) touchUpInsideSegmentIndex:(NSUInteger)segmentIndex{
    
    switch (segmentIndex) {
        case 0:
            [self standardBu];
            break;
        case 1:
            [self satelliteBu];
            break;
        default:
            [self hybridBu];
            break;
    }
}
@end
