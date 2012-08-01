//
//  BDViewController.m
//  BDDynamicGridViewDemo
//
//  Created by Nor Oh on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BDViewController.h"
#import "BDViewController+Private.h"
#import "BDRowInfo.h"
@interface BDViewController (){
}

@end

@implementation BDViewController

- (id) initWithImageArray:(NSString *)imageNSArray{
    self =  [super init];
    if (self) {
        imagearray = imageNSArray;
        imagemuarray = [[NSMutableArray alloc] initWithCapacity:0];
        [self uploadSomethingFiveTimes];
        indextemp = 0;
        end = 0;
        isloading = NO;
    }
    
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.delegate = self;
    
    self.onLongPress = ^(UIView* view, NSInteger viewIndex){
        NSLog(@"Long press on %@, at %d", view, viewIndex);
    };

    self.onSingleTap = ^ (UIView *view,NSInteger viewIndex){
        NSLog(@"SingleTap meshtods ");
    };
    self.onDoubleTap = ^(UIView* view, NSInteger viewIndex){
        NSLog(@"Double tap on %@, at %d", view, viewIndex);
    };
    [self _demoAsyncDataLoading];
    [self buildBarButtons];
}

- (void)animateReload
{   
    if (_items != nil) {
        [_items removeAllObjects];
        [imagemuarray removeAllObjects];
    }
    indextemp = 0;
    isloading = YES;
    [self uploadSomethingFiveTimes];
    [self _demoAsyncDataLoading];
}

- (NSUInteger)numberOfViews
{
    return _items.count;
}

-(NSUInteger)maximumViewsPerCell
{
    return 5;
}

- (UIView *)viewAtIndex:(NSUInteger)index rowInfo:(BDRowInfo *)rowInfo
{
    UIImageView * imageView = [_items objectAtIndex:index];
    return imageView;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    //Call super when overriding this method, in order to benefit from auto layout.
    [super shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
    return YES;
}

- (CGFloat)rowHeightForRowInfo:(BDRowInfo *)rowInfo
{
//    if (rowInfo.viewsPerCell == 1) {
//        return 125  + (arc4random() % 55);
//    }else {
//        return 100;
//    }
    return 55 + (arc4random() % 125);
}

#pragma  mark UIscrollerDelegateMethods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint pt = [scrollView contentOffset];
    if ( (pt.y - 60) > (_tableView.contentSize.height - _tableView.bounds.size.height) && !isloading && scrollView.isDragging){
        isloading = YES;
        NSLog(@"woyao jiazai ");
        [self uploadSomethingFiveTimes];
        [self _demoAsyncDataLoading];
    }
   
}

@end