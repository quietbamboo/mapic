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

#pragma mark default Methods

- (id) initWithImageArray:(NSString *)imageNSArray{
    self =  [super init];
    if (self) {
        imagearray = imageNSArray;
        imagemuarray = [[NSMutableArray alloc] initWithCapacity:0];
        [self uploadSomethingFiveTimes];
        indextemp = 0;
        endProgress = 1;
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    //Call super when overriding this method, in order to benefit from auto layout.
    [super shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
    return YES;
}

#pragma mark reload image methods

- (void)animateReload
{   
    if (_items != nil) {
        [_items removeAllObjects];
        [imagemuarray removeAllObjects];
    }
    indextemp = 0;
    endProgress = 1;
    isloading = YES;
    [self uploadSomethingFiveTimes];
    [self _demoAsyncDataLoading];
}

#pragma mark BDDynamicGridViewDelegate Methods
- (NSUInteger)numberOfViews
{
    return _items.count;
}

-(NSUInteger)maximumViewsPerCell
{
    return 4;
}

- (NSUInteger)minimumViewsPerCell{
    return 2;
}

- (CGFloat)rowHeightForRowInfo:(BDRowInfo *)rowInfo
{
//    if (rowInfo.viewsPerCell == 1) {
//        return 125  + (arc4random() % 55);
//    }else {
//        return 100;
//    }
    return 65 + (arc4random() % 125);
}

- (UIView *)viewAtIndex:(NSUInteger)index rowInfo:(BDRowInfo *)rowInfo
{
    UIImageView * imageView = [_items objectAtIndex:index];
    return imageView;
}

#pragma  mark UIscrollerDelegateMethods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint pt = [scrollView contentOffset];
    if ( (pt.y - 40) > (_tableView.contentSize.height - _tableView.bounds.size.height) && !isloading && scrollView.isDragging){
        isloading = YES;
        NSLog(@"woyao jiazai ");
        endProgress = 1;
        [self uploadSomethingFiveTimes];
        [self _demoAsyncDataLoading];
    }
}

@end
