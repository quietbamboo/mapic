//
//  BDViewController+Private.m
//  BDDynamicGridViewDemo
//
//  Created by Nor Oh on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BDViewController+Private.h"
#define kNumberOfPhotos 25
@implementation BDViewController (Private)

-(void)buildBarButtons
{
    UIBarButtonItem * reloadButton = [[UIBarButtonItem alloc] initWithTitle:@"Lay it!"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(animateReload)];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects: reloadButton, nil];
}

#pragma mark load image Methods

-(NSArray*)_imagesFromBundle
{
    NSArray *images = [NSArray array];
    NSArray *arrayOfLines = [imagearray componentsSeparatedByString:@"_-_-_"];
	
    for (int i=0; i< [arrayOfLines count]; i++) {
        NSArray *lineparts = [[arrayOfLines objectAtIndex:i] componentsSeparatedByString:@"-----"];
        NSString *path = [[lineparts objectAtIndex:0] stringByReplacingOccurrencesOfString:@"upload" withString:@"thumbnail"];
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:path]]];
        if (image) {
            images = [images arrayByAddingObject:image];
        }
    }
    return images;
}

- (void)_demoAsyncDataLoading
{
    if (_MBProgress != nil) {
        [_MBProgress setHidden:YES];
    }
    _MBProgress = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _MBProgress.labelText = @"正在下载请稍后！";
    _MBProgress.mode = MBProgressHUDModeDeterminate;
    _MBProgress.xOffset = 0;
    _MBProgress.yOffset = 0;
    //_MBProgress.color = [UIColor blueColor];
    _MBProgress.progress = 0.0;
    [_MBProgress show:YES];
    if (_items ==nil) {
        _items = [[NSMutableArray alloc] initWithCapacity:0];
    }
    //load the placeholder image
    for (int i = indextemp; i < (indextemp + 12); i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder.png"]];
        imageView.frame = CGRectMake(0, 0, 44, 44);
        imageView.clipsToBounds = YES;
        [_items addObject:imageView];
        // _items = [_items arrayByAddingObject:imageView];
    }
    [self reloadData];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self
                                   selector:@selector(changeProgress:) userInfo:nil repeats:YES];
}

- (void)changeProgress:(NSTimer *)timer{
    _MBProgress.progress = myProgressIndicator.progress;
    if (myProgressIndicator.progress >= (endProgress - 0.001)) {
        [_MBProgress setHidden:YES];
        [timer invalidate];
        NSLog(@"this is timer not work");
    }
}

- (void)uploadSomethingFiveTimes
{
    if (myProgressIndicator != nil) {
        myProgressIndicator.progress = 0.0f;
    }else {
        myProgressIndicator = [[UIProgressView alloc] initWithFrame:CGRectZero];
    }
    
    ASINetworkQueue *myQueue = [ASINetworkQueue queue];
    [myQueue cancelAllOperations];
    [myQueue setDownloadProgressDelegate:myProgressIndicator];
    [myQueue setDelegate:self];
    [myQueue setRequestDidFinishSelector:@selector(queueComplete:)];
    
    NSArray *arrayOfLines = [imagearray componentsSeparatedByString:@"_-_-_"];
    //	int photonum = 25;
    if ((indextemp + 12) >= [arrayOfLines count] ) {
        indextemp = [arrayOfLines count] - 12;
    }
    for (int i = indextemp; i < (indextemp + 12); i++) {
        NSArray *lineparts = [[arrayOfLines objectAtIndex:i] componentsSeparatedByString:@"-----"];
        NSString *path = [[lineparts objectAtIndex:0] stringByReplacingOccurrencesOfString:@"upload" withString:@"thumbnail"];
        NSLog(@"this is %@",path);
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:path]];
        //[request setDownloadDestinationPath:NSTemporaryDirectory()];
        [request setDelegate:self];
    	[request setDidFailSelector:@selector(uploadFailed:)];
        [request setDidFinishSelector:@selector(uploadFinished:)];
        [myQueue addOperation:request];
    }
    [myQueue go];
}

#pragma mark ASIHTTPRequestDelegate Methods

- (void)queueComplete:(ASINetworkQueue *)queue
{
    NSLog(@"progres is pro %f", [myProgressIndicator progress]);
    NSLog(@"progres is end  %f", endProgress);
    if (myProgressIndicator.progress >= (endProgress - 0.001) ) {
        [self reloadData];
        int begin = 0;
        if ((indextemp - 12) <= 0 ) {
            begin = 0;
        }else {
            begin = indextemp - 12;
        }
        for (int i = begin; i < indextemp; i++) {
            UIImageView *imageView = [_items objectAtIndex:i];
            UIImage *image = [imagemuarray objectAtIndex:i];
            imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
            
            [self performSelector:@selector(animateUpdate:)
                       withObject:[NSArray arrayWithObjects:imageView, image, nil]
                       afterDelay:0.2 + (arc4random()%3) + (arc4random() %10 * 0.1)];
            isloading = NO;
        }
    }
}
- (void)uploadFailed:(ASIHTTPRequest *)theRequest
{
    NSLog(@"this is filedd");
    endProgress = endProgress - (float)1.0/12.0;
    NSLog(@"this is filed progres end is  %f", endProgress);
    if (myProgressIndicator.progress >= (endProgress - 0.001) ) {
        [self reloadData];
        int begin = 0;
        if ((indextemp - 12) <= 0 ) {
            begin = 0;
        }else {
            begin = indextemp - 12;
        }
        for (int i = begin; i < indextemp; i++) {
            UIImageView *imageView = [_items objectAtIndex:i];
            UIImage *image = [imagemuarray objectAtIndex:i];
            imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
            
            [self performSelector:@selector(animateUpdate:)
                       withObject:[NSArray arrayWithObjects:imageView, image, nil]
                       afterDelay:0.2 + (arc4random()%3) + (arc4random() %10 * 0.1)];
            isloading = NO;
        }
    }
}

- (void)uploadFinished:(ASIHTTPRequest *)theRequest
{
    // NSLog(@"this is data %@",[[theRequest responseData] description]);
    [imagemuarray addObject:[UIImage imageWithData:[theRequest responseData]]];
    indextemp ++;
}

#pragma mark update ItemsArray To imageMuArray Methods
- (void) animateUpdate:(NSArray*)objects
{
    UIImageView *imageView = [objects objectAtIndex:0];
    UIImage* image = [objects objectAtIndex:1];
    [UIView animateWithDuration:0.5
                     animations:^{
                         imageView.alpha = 0.f;
                     } completion:^(BOOL finished) {
                         imageView.image = image;
                         [UIView animateWithDuration:0.5
                                          animations:^{
                                              imageView.alpha = 1;
                                          } completion:^(BOOL finished) {
                                              NSArray *visibleRowInfos =  [self visibleRowInfos];
                                              for (BDRowInfo *rowInfo in visibleRowInfos) {
                                                  [self updateLayoutWithRow:rowInfo animiated:YES];
                                              }
                                          }];
                     }];
}

@end
