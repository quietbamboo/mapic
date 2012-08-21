//
//  ThirdNewsViewController.h
//  template
//
//  Created by apple on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HjxPhotoViewController.h"
#import "AppDelegate.h"
#import "JMTabView.h"
#import "MGScrollView.h"
#import "MGStyledBox.h"
#import "MGBoxLine.h"
#import "NewsMessageView.h"
#import "AttentionView.h"
#import "PraiseView.h"
#import "OnTopView.h"
#import "PraisePhotoView.h"
#import "ImageIdAndUserNameProtocol.h"
#import "ASIFormDataRequest.h"
@interface ThirdNewsViewController : UIViewController<UIScrollViewDelegate,JMTabViewDelegate,ImageIdAndUserNameProtocol,ASIHTTPRequestDelegate>{
    NSMutableArray *photomessageArray;
    MGScrollView *scroller;
    NSMutableArray* imgArray;
    JMTabView *tabHeaderView;
}
- (void)addBox:(UIButton *)sender;
- (void)removeBox:(UIButton *)sender;
- (void)moveUp:(UIButton *)sender;
- (void)moveDown:(UIButton *)sender;
- (void)shuffle;

- (MGBox *)parentBoxOf:(UIView *)view;
- (UIButton *)button:(NSString *)title for:(SEL)selector;

@end
