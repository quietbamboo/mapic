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
   // NSLog(@"this is :::::*:*:%@:*:*:::::",imagearray);
    
//    NSBundle *bundle = [NSBundle mainBundle];
//    for (int i=0; i< kNumberOfPhotos; i++) {
//        NSString *path = [bundle pathForResource:[NSString stringWithFormat:@"%d", i + 1] ofType:@"jpg"];
//        UIImage *image = [UIImage imageWithContentsOfFile:path];
//        if (image) {
//            images = [images arrayByAddingObject:image];
//        }
//    }
    
       return images;
}


- (void)_demoAsyncDataLoading
{
    _MBProgress = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _MBProgress.labelText = @"正在下载请稍后！";
    _MBProgress.mode = MBProgressHUDModeDeterminate;
    _MBProgress.xOffset = 0;
    _MBProgress.yOffset = 0;
    //_MBProgress.color = [UIColor blueColor];
    _MBProgress.progress = 0.0;
    [_MBProgress show:YES];

    _items = [NSArray array];
    //load the placeholder image
    for (int i=0; i < kNumberOfPhotos; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder.png"]];
        imageView.frame = CGRectMake(0, 0, 44, 44);
        imageView.clipsToBounds = YES;
        _items = [_items arrayByAddingObject:imageView];
    }
    
    [self reloadData];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self
            selector:@selector(changeProgress:) userInfo:nil repeats:YES];
    
}       
- (void)changeProgress:(NSTimer *)timer{
    _MBProgress.progress = myProgressIndicator.progress*2;
    if (myProgressIndicator.progress > 0.5) {
        [_MBProgress setHidden:YES];
        [timer invalidate];
        NSLog(@"this is timer not work");
    }
}	
- (void)uploadSomethingFiveTimes
{     
    myProgressIndicator = [[UIProgressView alloc] initWithFrame:CGRectZero];
    
    ASINetworkQueue *myQueue = [ASINetworkQueue queue];
    [myQueue cancelAllOperations];
    [myQueue setDownloadProgressDelegate:myProgressIndicator];
    [myQueue setDelegate:self];
    [myQueue setRequestDidFinishSelector:@selector(queueComplete:)];
    
    NSArray *arrayOfLines = [imagearray componentsSeparatedByString:@"_-_-_"];
	int photonum = 25;
    if (kNumberOfPhotos >= [arrayOfLines count] ) {
        photonum = [arrayOfLines count];
    }
    for (int i = 0; i < photonum; i++) {
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

//    int i;
//    for (i=0; i<5; i++) {
//        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//        [request setDownloadDestinationPath:NSTemporaryDirectory()];
//    	[request setDidFailSelector:@selector(uploadFailed:)];
//        [request setDidFinishSelector:@selector(uploadFinished:)];
//        [myQueue addOperation:request];
//    }
    [myQueue go];
}
-(NSString *)GetTempPath:(NSString*)filename{  
    NSString *tempPath = NSTemporaryDirectory();  
    return [tempPath stringByAppendingPathComponent:filename];  
} 

- (void)uploadFailed:(ASIHTTPRequest *)theRequest
{
    NSLog(@"this is filedd");
}

- (void)uploadFinished:(ASIHTTPRequest *)theRequest
{   
   // NSLog(@"this is data %@",[[theRequest responseData] description]);
    [imagemuarray addObject:[UIImage imageWithData:[theRequest responseData]]];
 
}


- (void)queueComplete:(ASINetworkQueue *)queue
{   
    NSLog(@"progres is %f", [myProgressIndicator progress]);
    [self reloadData];
    
    
    for (int i = 0; i < [imagemuarray count]; i++) {
        UIImageView *imageView = [_items objectAtIndex:i];
        UIImage *image = [imagemuarray objectAtIndex:i];
        imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        
        [self performSelector:@selector(animateUpdate:) 
                   withObject:[NSArray arrayWithObjects:imageView, image, nil]
                   afterDelay:0.2 + (arc4random()%3) + (arc4random() %10 * 0.1)];
    }

}


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
