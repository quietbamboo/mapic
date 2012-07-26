//
//  HjxPhotoViewController.m
//  template
//
//  Created by Jim on 9/17/10.
//  Copyright 2010 Blue Sky Software. All rights reserved.
//

#import "HjxPhotoViewController.h"

@implementation HjxPhotoViewController

//@synthesize listlabel;
//@synthesize adMobAd;
//@synthesize adTimer;
@synthesize clicked;
@synthesize delegate = _delegate;
@synthesize endPlace;
//@synthesize MBProgress;
static const NSTimeInterval kSlideshowInterval = 6;
#pragma mark
#pragma mark BarAnimation
///////////////////////////////////////////////////////////////////////////////////////////////////

- (void)showBarsAnimationDidStop {
	self.navigationController.navigationBarHidden = NO;
	//[self.navigationController setNavigationBarHidden:NO animated:YES];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)hideBarsAnimationDidStop {
	self.navigationController.navigationBarHidden = YES;
    //	[self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (void)showBars:(BOOL)show animated:(BOOL)animated {
	
	[super showBars:show animated:animated];
	
    
	CGFloat alpha = show ? 1 : 0;
	if (alpha == _toolbar.alpha)
		return;
	
	//NSLog(@"Show bars, %@, animated %@",  (show ? @"YES" : @"NO"), (animated ? @"Ani" : @"noani"));
	
	if (animated) {
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:TT_TRANSITION_DURATION];
		[UIView setAnimationDelegate:self];
		if (show) {
			[UIView setAnimationDidStopSelector:@selector(showBarsAnimationDidStop)];
		} else {
			[UIView setAnimationDidStopSelector:@selector(hideBarsAnimationDidStop)];
		}
	} else {
		if (show) {
			[self showBarsAnimationDidStop];
		} else {
			[self hideBarsAnimationDidStop];
		}
	}
	
	[self showCaptions:show];
	
	_toolbar.alpha = alpha;
    
	
	if (animated) {
		[UIView commitAnimations];
	}
}
#pragma mark
#pragma mark move to photo

- (void)moveToPhoto:(id<TTPhoto>)photo {
	id<TTPhoto> previousPhoto = [_centerPhoto autorelease];
	_centerPhoto = [photo retain];
	[self didMoveToPhoto:_centerPhoto fromPhoto:previousPhoto];
}
#pragma mark
#pragma mark showCaptions
- (void)showCaptions:(BOOL)show {
	for (TTPhotoView* photoView in _scrollView.visiblePages.objectEnumerator) {
		photoView.hidesCaption = !show;
	}
}
#pragma mark
#pragma mark Activity
- (void)showActivity{
//    
//	CGRect screenFrame = [UIScreen mainScreen].bounds;
//	listlabel = [[[TTActivityLabel alloc] initWithStyle:TTActivityLabelStyleWhiteBox] autorelease];
//	listlabel.text = @"Downloading photo list ...";
//	[listlabel sizeToFit];
//	listlabel.frame = CGRectMake(0, screenFrame.size.height / 2.2,  screenFrame.size.width, screenFrame.size.height / 12);
//	[self.view addSubview:listlabel];
    _MBProgress = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _MBProgress.labelText = @"正在下载请稍后！";
    _MBProgress.mode = MBProgressHUDModeDeterminate;
    _MBProgress.xOffset = 0;
    _MBProgress.yOffset = 0;
    //_MBProgress.color = [UIColor blueColor];
    _MBProgress.progress = 0.6;
    [_MBProgress show:YES];
}

- (void)stopActivity{
	//[listlabel setHidden:YES];
    [_MBProgress hide:YES];
}


- (void)updateChrome {
    if (_photoSource.numberOfPhoto < 2) {
        self.title = _photoSource.title;
        
    } else {
        self.title = [NSString stringWithFormat:
                      TTLocalizedString(@"%d of %d", @"Current page in photo browser (1 of 10)"),
                      _centerPhotoIndex+1, _photoSource.numberOfPhoto];
    }
    
    if (![self.presentedViewController isKindOfClass:[TTThumbsViewController class]]) {
        if (_photoSource.numberOfPhoto > 1) {
            self.navigationItem.rightBarButtonItem =
            [[[UIBarButtonItem alloc] initWithTitle:TTLocalizedString(@"See All",
                                                                      @"See all photo thumbnails")
                                              style:UIBarButtonItemStyleBordered
                                             target:self
                                             action:@selector(seeAllAction)]
             autorelease];
            
        } else {
            self.navigationItem.rightBarButtonItem = nil;
        }
        
    } else {
        self.navigationItem.rightBarButtonItem = nil;
    }
    
//    UIBarButtonItem* playButton = [_toolbar itemWithTag:1];
//    playButton.enabled = _photoSource.numberOfPhoto > 1;
//    _previousButton.enabled = _centerPhotoIndex > 0;
//    _nextButton.enabled = _centerPhotoIndex >= 0 && _centerPhotoIndex < _photoSource.numberOfPhoto-1;
}


#pragma mark
#pragma mark Timer
- (void) handleTimer: (id) timer{
	//using this to grach
	//NSString* clicked = [[TTNavigator navigator] URL];
	//NSLog(@"Clicked %@", clicked);
	NSString* urlString;
    NSString* titleString;
	NSString *prefix = @"pet";//[[[NSBundle mainBundle] infoDictionary] objectForKey:@"prefix"];
	NSString *baseurl = @"http://iphone.dotaart.com/asian/new";//[[[NSBundle mainBundle] infoDictionary] objectForKey:@"baseurl"];
	if([clicked isEqualToString:@"tt://photo/all"]){
		urlString = [NSString stringWithFormat:@"%@/list.php?tag=all&prefix=%@", baseurl, prefix];
		titleString = @"Most Recent";
	}else if([clicked isEqualToString:@"tt://photo/top"]){
		urlString = [NSString stringWithFormat:@"%@/list.php?tag=top&prefix=%@", baseurl, prefix];
		titleString = @"Top Ranked";
	}else if([clicked isEqualToString:@"tt://photo/random"]){
		urlString = [NSString stringWithFormat:@"%@/list.php?tag=random&prefix=%@", baseurl, prefix];
		titleString = @"Random";
	}else if([clicked isEqualToString:@"tt://photo/hd"]){
		urlString = [NSString stringWithFormat:@"%@/list.php?tag=hd&prefix=%@", baseurl, prefix];
		titleString = @"HD";
	}else if([clicked isEqualToString:@"tt://photo/my"]){
		urlString = [NSString stringWithFormat:@"%@/mylist.php?prefix=%@", baseurl, prefix];
		titleString = @"My Uploads";
	}else if([clicked isEqualToString:@"tt://photo/like"]){
		urlString = [NSString stringWithFormat:@"%@/mylike.php?prefix=%@", baseurl, prefix];
		titleString = @"My Likes";
		
		//viral
    }else if([clicked isEqualToString:@"tt://photo/recent.like"]){
		urlString = [NSString stringWithFormat:@"%@/list.php?tag=recent.like&prefix=%@", baseurl, prefix];
		titleString = @"Recently Liked";
        
	}else if([clicked isEqualToString:@"tt://photo/recent.like.asian"]){
		urlString = [NSString stringWithFormat:@"%@/list.php?tag=recent.like.asian&prefix=%@", baseurl, prefix];
		titleString = @"Recently Liked Asian";
        
	}else if([clicked isEqualToString:@"tt://photo/recent.like.western"]){
		urlString = [NSString stringWithFormat:@"%@/list.php?tag=recent.like.western&prefix=%@", baseurl, prefix];
		titleString = @"Recently Liked Western";
        
	}else if([clicked isEqualToString:@"tt://photo/viral.hour"]){
		urlString = [NSString stringWithFormat:@"%@/list.php?tag=viral.hour&prefix=%@", baseurl, prefix];
		titleString = @"Viral Last Hour";
	}else if([clicked isEqualToString:@"tt://photo/viral.day"]){
		urlString = [NSString stringWithFormat:@"%@/list.php?tag=viral.day&prefix=%@", baseurl, prefix];
		titleString = @"Viral Last Day";
	}else if([clicked isEqualToString:@"tt://photo/viral.week"]){
		urlString = [NSString stringWithFormat:@"%@/list.php?tag=viral.week&prefix=%@", baseurl, prefix];
		titleString = @"Viral Last Week";
	}else{
		return;
	}
	
	[timer invalidate];
    progressIndicator = [[UIProgressView alloc] initWithFrame:CGRectZero];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:
                                   [NSURL URLWithString:urlString]];
	[request setPostValue:[[UIDevice currentDevice] uniqueIdentifier] forKey:@"id"];
	[request setTimeOutSeconds:20];
    
    #if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0
        [request setShouldContinueWhenAppEntersBackground:YES];
    #endif
	[request setUploadProgressDelegate:progressIndicator];
	[request setDelegate:self];
	[request setDidFailSelector:@selector(uploadFailed:)];
	[request setDidFinishSelector:@selector(uploadFinished:)];
    [request startAsynchronous];
}       
	

- (void)uploadFailed:(ASIHTTPRequest *)theRequest
{

}

- (void)uploadFinished:(ASIHTTPRequest *)theRequest
{
    NSString* titleString;
    NSString *returnString = [[NSString alloc] initWithData: theRequest.responseData encoding:NSUTF8StringEncoding];
    photoList = returnString;
	
	//split _-_-_
	NSArray *arrayOfLines = [returnString componentsSeparatedByString:@"_-_-_"];
	NSArray *photoArray = [NSArray array];
	int i;
	
	for(i = 0 ; i < [arrayOfLines count] ; i++){
		//NSLog([arrayOfLines objectAtIndex:i]);
		NSArray *lineparts = [[arrayOfLines objectAtIndex:i] componentsSeparatedByString:@"-----"];
		if([lineparts count] <= 1){
			continue;
		}
		
		//there is a bug for in review pictures/banned pictures
		MockPhoto *newPhoto = 
		[[[MockPhoto alloc]
		  initWithURL:[lineparts objectAtIndex:0]
		  smallURL:[[lineparts objectAtIndex:0] stringByReplacingOccurrencesOfString:@"upload" withString:@"thumbnail"]
		  size:CGSizeMake(320, 480)
		  caption:[NSString stringWithFormat:@"From %@", [lineparts objectAtIndex:1]]
		  ] autorelease];
		
		photoArray = [photoArray arrayByAddingObject:newPhoto];
        self.photoSource = [[[MockPhotoSource alloc]
                             initWithType:MockPhotoSourceNormal
                             //initWithType:MockPhotoSourceDelayed
                             // initWithType:MockPhotoSourceLoadError
                             // initWithType:MockPhotoSourceDelayed|MockPhotoSourceLoadError
                             title:titleString
                             photos:photoArray
                             photos2:nil
                             ] autorelease];
        
        [self stopActivity];
    }
}

#pragma mark
#pragma mark Seven methods About UIBarButtonItem

- (void)seeAllAction {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"see all success!"
                          //message:[NSString stringWithFormat:@"Photo size: %iX%i\nView it in your photo album", [self centerPhotoView].image.size.width, img.size.height]
                          //0X1081212928 ??
                                                    message:[NSString stringWithFormat:@"see all"]
                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
}
- (void)messageAction {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"message success!"
                          //message:[NSString stringWithFormat:@"Photo size: %iX%i\nView it in your photo album", [self centerPhotoView].image.size.width, img.size.height]
                          //0X1081212928 ??
                                                    message:[NSString stringWithFormat:@"message"]
                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
}
- (void)saveAction {
	UIImage *img = [self centerPhotoView].image;
    //UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), self);
	UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
	//Get the filename of the sound file:
	//	NSString *music_path = [NSString stringWithFormat:@"%@%@",
	//					  [[NSBundle mainBundle] resourcePath],
	//					  @"beep.wav"];
	//NSLog(@"photo index %@", _photoSource );
	
	//itootSound* sound;
	//sound = [itootSound alloc];
	//[sound playSound:@"beep.wav"];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Download success!"
                          //message:[NSString stringWithFormat:@"Photo size: %iX%i\nView it in your photo album", [self centerPhotoView].image.size.width, img.size.height]
                          //0X1081212928 ??
                                                    message:[NSString stringWithFormat:@"View it in your photo album"]
                                                   delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
	[alert addButtonWithTitle:@"Goto uploader's profile"];
	[alert addButtonWithTitle:@"Goto image's profile"];
	[alert show];
	[alert release];
}

- (void)reportAction{
	//NSLog(@"good %d", _centerPhotoIndex);
	//when this is my uploads, report means remove the image permanently
	
	
	//check whether current file is this user's
	//if so pop up for delete confirmation
	//else pop up for report confirmation
	//file format : d7cd992a67d3b3cf37ebfe68b1e3a3fbc433a8f6___1284834179___.jpg
	
	NSArray *arrayOfLines = [photoList componentsSeparatedByString:@"_-_-_"];
	NSArray *lineparts = [[arrayOfLines objectAtIndex:_centerPhotoIndex] componentsSeparatedByString:@"-----"];
	NSArray *lineparts2 = [[lineparts objectAtIndex:0] componentsSeparatedByString:@"/"];
	NSString *filename = [lineparts2 objectAtIndex:([lineparts2 count] - 1)];
	NSArray *lp3 = [filename componentsSeparatedByString:@"___"];
	NSString *userId = [lp3 objectAtIndex:0];
	NSString *device_id = [NSString stringWithFormat:@"%@", [[UIDevice currentDevice] uniqueIdentifier]];
	//NSLog(filename);
	
	if([device_id isEqualToString:userId]){
		//delete?
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Delete your photo?"
														message:@"Caution! Do you want to permanently remove this photo?\nIt can not be restored!" 
													   delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
		[alert addButtonWithTitle:@"Delete"];
		[alert show];
		[alert release];
	}else {
		//report?
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Report this photo?"
														message:@"Are you sure this photo contains sexual / violation / unrelated or other unsuitable contents?" 
													   delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
		[alert addButtonWithTitle:@"Yes"];
		[alert show];
		[alert release];
	}
}

- (void)goodAction{
	//NSLog(@"good %d", _centerPhotoIndex);
	NSArray *arrayOfLines = [photoList componentsSeparatedByString:@"_-_-_"];
	NSArray *lineparts = [[arrayOfLines objectAtIndex:_centerPhotoIndex] componentsSeparatedByString:@"-----"];
	NSArray *lineparts2 = [[lineparts objectAtIndex:0] componentsSeparatedByString:@"/"];
	NSString *filename = [lineparts2 objectAtIndex:([lineparts2 count] - 1)];
	//NSLog(filename);
	
	NSString *device_id = [NSString stringWithFormat:@"%@", [[UIDevice currentDevice] uniqueIdentifier]];
	NSString *prefix = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"prefix"];
	NSString *baseurl = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"baseurl"];
	NSString *requestString = [NSString stringWithFormat:@"id=%@&filename=%@&prefix=%@&rate=1", device_id, filename, prefix];
	NSData *requestData = [NSData dataWithBytes: [requestString UTF8String] length: [requestString length]];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString:
                                                                              [NSString stringWithFormat:@"%@/rate.php", baseurl]]];
	[request setHTTPMethod: @"POST"];
	[request setHTTPBody: requestData];
	// now lets make the connection to the web
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *response = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	
	NSString* msg = [NSString stringWithFormat:@"%@", response];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank you for your rating" message:msg 
												   delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
	[alert addButtonWithTitle:@"Goto uploader's profile"];
	[alert addButtonWithTitle:@"Goto image's profile"];
	[alert show];
	[alert release];
}

- (void)badAction {	
	//NSLog(@"bad %d", _centerPhotoIndex);
	NSArray *arrayOfLines = [photoList componentsSeparatedByString:@"_-_-_"];
	NSArray *lineparts = [[arrayOfLines objectAtIndex:_centerPhotoIndex] componentsSeparatedByString:@"-----"];
	NSArray *lineparts2 = [[lineparts objectAtIndex:0] componentsSeparatedByString:@"/"];
	NSString *filename = [lineparts2 objectAtIndex:([lineparts2 count] - 1)];
	//NSLog(filename);
	
	NSString *device_id = [NSString stringWithFormat:@"%@", [[UIDevice currentDevice] uniqueIdentifier]];
	NSString *prefix = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"prefix"];
	NSString *baseurl = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"baseurl"];
	NSString *requestString = [NSString stringWithFormat:@"id=%@&filename=%@&prefix=%@&rate=-1", device_id, filename, prefix];
	NSData *requestData = [NSData dataWithBytes: [requestString UTF8String] length: [requestString length]];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: 
                                                                              [NSString stringWithFormat:@"%@/rate.php", baseurl]]];
	[request setHTTPMethod: @"POST"];
	[request setHTTPBody: requestData];
	// now lets make the connection to the web
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *response = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	
	NSString* msg = [NSString stringWithFormat:@"%@", response];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank you for your rating" message:msg 
												   delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
	[alert addButtonWithTitle:@"Goto uploader's profile"];
	[alert addButtonWithTitle:@"Goto image's profile"];
	[alert show];
	[alert release];
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)nextAction {
//	[self pauseAction];
//	if (_centerPhotoIndex < _photoSource.numberOfPhoto - 1) {
//		_scrollView.centerPageIndex = _centerPhotoIndex+1;
//	}
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)previousAction {
//    
//	[self pauseAction];
//	if (_centerPhotoIndex > 0) {
//		_scrollView.centerPageIndex = _centerPhotoIndex-1;
//	}
//}
//
//- (void)playAction {
//    if (!_slideshowTimer) {
//        UIBarButtonItem* pauseButton =
//        [[[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemPause
//                                                       target: self
//                                                       action: @selector(pauseAction)]
//         autorelease];
//        pauseButton.tag = 1;
//        
//        [_toolbar replaceItemWithTag:1 withItem:pauseButton];
//        
//        _slideshowTimer = [NSTimer scheduledTimerWithTimeInterval:kSlideshowInterval
//                                                           target:self
//                                                         selector:@selector(slideshowTimer)
//                                                         userInfo:nil
//                                                          repeats:YES];
//    }
//}
#pragma mark
#pragma mark DirectionsViewControllerDelegate
- (void)toWriteRoute{
    [_delegate directionsViewController:self toPlace:endPlace];
}
- (void)toCloseSelf{
    [_delegate directionsViewControllerDidCancel:self];
}

#pragma mark
#pragma mark default Mthods
- (void)viewDidLoad {
    //only called once when entering the image section
	
	[self showActivity];
    
    NSLog(@"View did log");
    [NSTimer scheduledTimerWithTimeInterval: 0.2
									 target: self
								   selector: @selector(handleTimer:)
								   userInfo: nil
									repeats: NO];
    ////init ads anyway, but default not shown
    //[self initAds];
    
}

- (void)viewWillAppear:(BOOL)animated{
    //could be called multiple times returning from thumbnail view
    self.navigationController.navigationBarHidden = NO;
    [super viewWillAppear:animated];
    NSLog(@"view will appear");
    //parallel with loading photo list
    
    
    
    //not vip, show ads
	//if(![AppDelegate isAdsFree]){
        //first, show big ads
        
        // if(random() % 50 == 1){
        //     NSString *inneractive = [AppDelegate getAdjustedString:@"inneractive"];
        //     [InneractiveAd DisplayAd:(NSString*)inneractive withType:IaAdType_FullScreen withRoot:self.view withReload:30];
        // }
        
        
        
        //then start timer to periodic select two ads to show
//        adTimer = [NSTimer scheduledTimerWithTimeInterval: 5
//                                                   target: self
//                                                 selector: @selector(handleAdTimer:)
//                                                 userInfo: nil
//                                                  repeats: YES];
//	}//*/
    
}

- (void)loadView {
	CGRect screenFrame = TTScreenBounds();
	self.view = [[[UIView alloc] initWithFrame:screenFrame] autorelease];
	
	CGRect innerFrame = CGRectMake(0, 0,
								   screenFrame.size.width, screenFrame.size.height);
	_innerView = [[UIView alloc] initWithFrame:innerFrame];
	_innerView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:_innerView];
	
	_scrollView = [[TTScrollView alloc] initWithFrame:screenFrame];
	_scrollView.delegate = self;
	_scrollView.dataSource = self;
	_scrollView.backgroundColor = [UIColor blackColor];
	_scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
	[_innerView addSubview:_scrollView];
	
	
    _routeButton = [[UIBarButtonItem alloc] initWithTitle:@"路线" style:UIBarButtonItemStyleBordered target:self action:@selector(toWriteRoute)];
	_saveButton = [[UIBarButtonItem alloc] initWithImage:
				   TTIMAGE(@"bundle://Three20.bundle/images/download.png")
												   style:UIBarButtonItemStylePlain target:self action:@selector(saveAction)];
	
	_reportButton = [[UIBarButtonItem alloc] initWithImage:
					 TTIMAGE(@"bundle://Three20.bundle/images/warning.png")
													 style:UIBarButtonItemStylePlain target:self action:@selector(reportAction)];
	//NSString* goodPath = [NSString stringWithFormat:@"%@/good.png", [ [NSBundle mainBundle]resourcePath ]];
	//NSString* badPath = [NSString stringWithFormat:@"%@/bad.png", [ [NSBundle mainBundle]resourcePath ]];
	_goodButton = [[UIBarButtonItem alloc] initWithImage:
				   //[UIImage imageNamed:@"warning.png"]
				   TTIMAGE(@"bundle://Three20.bundle/images/good.png")
												   style:UIBarButtonItemStylePlain target:self action:@selector(goodAction)];
	
	_badButton = [[UIBarButtonItem alloc] initWithImage:
				  //[UIImage imageNamed:@"bad.png"]
				  TTIMAGE(@"bundle://Three20.bundle/images/bad.png")
												  style:UIBarButtonItemStylePlain target:self action:@selector(badAction)];
    
//	_previousButton = [[UIBarButtonItem alloc] initWithImage:
//					   TTIMAGE(@"bundle://Three20.bundle/images/previousIcon.png")
//													   style:UIBarButtonItemStylePlain target:self action:@selector(previousAction)];
//	_nextButton = [[UIBarButtonItem alloc] initWithImage:
//				   TTIMAGE(@"bundle://Three20.bundle/images/nextIcon.png")
//												   style:UIBarButtonItemStylePlain target:self action:@selector(nextAction)];
//	_playButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:
//                    UIBarButtonSystemItemPlay target:self action:@selector(playAction)] autorelease];
//	_playButton.tag = 1;
	
    _messageButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"notificationToastCommentIcon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(messageAction)];
    
	UIBarItem* space = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:
						 UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease];
	
	_toolbar = [[UIToolbar alloc] initWithFrame:
				CGRectMake(0, screenFrame.size.height - TTToolbarHeight(),
						   screenFrame.size.width, TTToolbarHeight())];
	//if (self.navigationBarStyle == UIBarStyleDefault) {
	//_toolbar.tintColor = [UIColor blackColor];//TTSTYLEVAR(toolbarTintColor);
	//}
	
	_toolbar.barStyle = UIBarStyleBlackTranslucent;//self.navigationBarStyle;
	_toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
	_toolbar.items = [NSArray arrayWithObjects: _routeButton, space,
					  _badButton, space, _saveButton, space, _goodButton, space,_messageButton,
                      space, _reportButton, nil];
	
	[_innerView addSubview:_toolbar];
    
}

//- (void)updateToolbarWithOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    
//	//adMobAd.frame = CGRectMake([self getAdmobX], 0, //self.view.frame.size.height - TTToolbarHeight() - 50,
//	//						   TTScreenBounds().size.width, [self getAdHeight]);
//	//adBanner.frame = CGRectMake(0 , 0, //self.view.frame.size.height - TTToolbarHeight() - 50,
//     //                           TTScreenBounds().size.width, [self getAdHeight]);
//    //crossButton.frame = CGRectMake([self getCrossX], [self getAdHeight], 20, 20);  
//    
//	//_toolbar.frame = CGRectMake(0, TTScreenBounds().size.height - TTToolbarHeight(),
//	//							TTScreenBounds().size.width, TTToolbarHeight()); //cause tool bar bug!
//    _toolbar.frame = CGRectMake(0, self.view.frame.size.height - TTToolbarHeight(),
//								self.view.frame.size.width, TTToolbarHeight());
//}//*/


///////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)viewDidUnload {
//	[super viewDidUnload];
- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
	
    
    NSLog(@"release timer in viewWillDisappear");
    
    //if not vip, stop timer here
  //  if(![AppDelegate isAdsFree] && adTimer && adTimer.isValid){
    //    [adTimer invalidate];
   // }
    
    
    //important for solving the crashing problem
	//adMobAd.delegate = nil;
    
    if(true)return;
    
    
    //seems the following code will cause crashing if run ...
    
    _scrollView.delegate = nil;
	_scrollView.dataSource = nil;
    
    
	TT_RELEASE_SAFELY(_innerView);
	TT_RELEASE_SAFELY(_scrollView);
	TT_RELEASE_SAFELY(_photoStatusView);
	TT_RELEASE_SAFELY(_nextButton);
	TT_RELEASE_SAFELY(_previousButton);
	TT_RELEASE_SAFELY(_saveButton);
	TT_RELEASE_SAFELY(_goodButton);
	TT_RELEASE_SAFELY(_badButton);
	TT_RELEASE_SAFELY(_reportButton);
    TT_RELEASE_SAFELY(_routeButton);
       TT_RELEASE_SAFELY(_messageButton);
	TT_RELEASE_SAFELY(_toolbar);
	
	
	//TT_RELEASE_SAFELY(adMobAd);
	TT_RELEASE_SAFELY(photoList);
    
    //TT_RELEASE_SAFELY(crossButton);
   // TT_RELEASE_SAFELY(adBanner);
    
    
}

- (void)dealloc {
    [super release];
    [_MBProgress release];
}
#pragma mark
#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
	
	NSString *device_id = [NSString stringWithFormat:@"%@", [[UIDevice currentDevice] uniqueIdentifier]];
	NSArray *arrayOfLines = [photoList componentsSeparatedByString:@"_-_-_"];
	NSArray *lineparts = [[arrayOfLines objectAtIndex:_centerPhotoIndex] componentsSeparatedByString:@"-----"];
	NSArray *lineparts2 = [[lineparts objectAtIndex:0] componentsSeparatedByString:@"/"];
	NSString *filename = [lineparts2 objectAtIndex:([lineparts2 count] - 1)];
	NSArray *lineparts3 = [filename componentsSeparatedByString:@"___"];
	NSString *hisId = [lineparts3 objectAtIndex:0];
	
	NSString *prefix = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"prefix"];
    NSLog(@"this is prefix *****%@****",prefix);
	NSString *baseurl = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"baseurl"];
    NSLog(@"this is baseurl ******%@****",baseurl);
	NSString *statUrl = @"%@/stat.php?id=%@&prefix=%@&command=%@";
    NSLog(@"this is statUrl *****%@******",statUrl);
	NSString *imgUrl = @"%@/img.php?imageId=%@&prefix=%@";
	NSLog(@"this is imgUrl *****%@*******",imgUrl);
	if([[alertView title] isEqualToString:@"Thank you for your rating"] ||
	   [[alertView title] isEqualToString:@"Download success!"]){
		
        
		NSLog(@" clicked rating button %d", buttonIndex);
		if(buttonIndex == 1){
			//go to uploader
			NSString* urlx = [NSString stringWithFormat:statUrl, baseurl, hisId, prefix, @"my"];
			NSLog(@" clicked rating button %d %@", buttonIndex, urlx);
			
            //[[TTNavigator navigator] openURLs:urlx]; //fix crashing bug!!
            [[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:urlx]];
            
		}else if(buttonIndex == 2){
			NSString* urlx = [NSString stringWithFormat:imgUrl, baseurl, filename, prefix];
			NSLog(@" clicked rating button %d %@", buttonIndex, urlx);
			
            //[[TTNavigator navigator] openURLs:urlx];
            [[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:urlx]];
            
		}
	}
	
	if( ([[alertView title] isEqualToString:@"Delete your photo?"] && buttonIndex == 1) ||
       ([[alertView title] isEqualToString:@"Report this photo?"] && buttonIndex == 1))
	{
		
		//report
		NSString *command = @"";
		if([[alertView title] isEqualToString:@"Delete your photo?"] && buttonIndex == 1)
			command = @"Delete";
		if([[alertView title] isEqualToString:@"Report this photo?"] && buttonIndex == 1)
			command = @"Report";
		
		
		NSString *requestString = [NSString stringWithFormat:@"id=%@&filename=%@&prefix=%@&command=%@", device_id, filename, prefix, command];
		NSData *requestData = [NSData dataWithBytes: [requestString UTF8String] length: [requestString length]];
		NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: 
                                                                                  [NSString stringWithFormat:@"%@/report.php", baseurl]]];
		[request setHTTPMethod: @"POST"];
		[request setHTTPBody: requestData];
		// now lets make the connection to the web
		NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
		NSString *response = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
		
		
		NSString* msg = [NSString stringWithFormat:@"%@", response];
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@ feedback", command] message:msg 
													   delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
		[alert addButtonWithTitle:@"OK"];
		[alert show];
		[alert release];
		
	}
}


- (TTPhotoView*)centerPhotoView {
	return (TTPhotoView*)_scrollView.centerPage;
}
#pragma mark
#pragma mark about ad
- (double)getCrossX {
    // if([AppDelegate isIpad])
    return (TTScreenBounds().size.width + 728) / 2 - 20;
    // else
    //     return (TTScreenBounds().size.width + 320) / 2 - 20;
}

- (double)getAdmobX {
    return TTScreenBounds().size.width - ([self getCrossX] + 20);
}

- (double)getAdHeight {
    // if([AppDelegate isIpad])
    return 90;
    // else
    //   return 50;
}
////admob delegate
//- (void)adView:(GADBannerView *)view
//didFailToReceiveAdWithError:(GADRequestError *)error{
//    //only when admob fail show inneractive
//    NSLog(@"admob ad fail");
//    adBanner.hidden = NO;
//   // NSString *inneractive = [AppDelegate getAdjustedString:@"inneractive"];
//   // [InneractiveAd DisplayAd:(NSString*)inneractive withType:IaAdType_Banner withRoot:adBanner withReload:15];
//}
//
//- (void)adViewDidReceiveAd:(GADBannerView *)view{
//    NSLog(@"admob ad success");
//    adBanner.hidden = YES;
//}
////handle touch event
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//    // CGPoint touchLocation = [touch locationInView:adBanner];
//    
//    NSLog(@"touch x %f y %f", touchLocation.x, touchLocation.y );
//    //if((touchLocation.x - 310) * (touchLocation.x - 310) + (touchLocation.y - 60) * (touchLocation.y - 60) <= 10 * 10){
//    if((touchLocation.x - ([self getCrossX] + 10)) * (touchLocation.x - ([self getCrossX] + 10)) + 
//       (touchLocation.y - ([self getAdHeight] + 10)) * (touchLocation.y - ([self getAdHeight] + 10)) <= 11 * 11){
//        //close all ads
//        NSLog(@"cross clicked");
//        adMobAd.hidden = YES;
//        adBanner.hidden = YES;
//        crossButton.hidden = YES;
//    }
//}
////periodic change ads
//- (void) handleAdTimer: (id)timer{
//    
//    NSString* prefix = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"prefix"];
//    if([prefix isEqualToString:@"background"] ||
//       [prefix isEqualToString:@"baby"] ||
//       [prefix isEqualToString:@"pet"]){
//        return;
//    }
//    
//    // NSLog(@"in timer %f, %f, %d", TTScreenBounds().size.height, TTScreenBounds().size.width, (int)[AppDelegate isIpad]);
//    crossButton.hidden = NO;
//    adMobAd.hidden = NO;
//    adBanner.hidden = NO;
//    [adMobAd loadRequest:[GADRequest request]];
//}
//- (void) initAds{
//    NSLog(@"initAds");    
//    CGRect adFrame = CGRectZero;
//    // if([AppDelegate isIpad])
//    adFrame.size = GAD_SIZE_728x90;
//    // else
//    //     adFrame.size = GAD_SIZE_320x50;
//    adMobAd = [[GADBannerView alloc]initWithFrame:adFrame];
//    // adMobAd.adUnitID = [AppDelegate getAdjustedString:@"admob"];
//    adMobAd.delegate = self;
//    
//    //CGRectMake(0.0,self.view.frame.size.height -GAD_SIZE_320x50.height,GAD_SIZE_320x50.width,GAD_SIZE_320x50.height)];
//    adMobAd.rootViewController = self;
//    [adMobAd loadRequest:[GADRequest request]];
//    
//    //banner for inneractive ads
//    // if([AppDelegate isIpad]) {
//    adBanner = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TTScreenBounds().size.width, 90)];
//    // } else {
//    //     adBanner = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TTScreenBounds().size.width, 60)];
//    // }
//    
//    crossButton = [[UIImageView alloc] initWithFrame:CGRectMake([self getCrossX], [self getAdHeight], 20, 20)];  
//    [crossButton setImage:TTIMAGE(@"bundle://Three20.bundle/images/cross.jpg")];
//    
//    [self.view addSubview:adMobAd];
//    [self.view addSubview:adBanner];
//    [self.view addSubview:crossButton];
//    [self.view bringSubviewToFront:adBanner];
//    [self.view bringSubviewToFront:adMobAd];
//    [self.view bringSubviewToFront:crossButton];
//    adMobAd.hidden = YES;
//    adBanner.hidden = YES;
//    crossButton.hidden = YES;
//    
//}
@end