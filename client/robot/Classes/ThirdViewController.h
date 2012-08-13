//
//  UserViewController.h
//  template
//
//  Created by apple on 12-7-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HjxPhotoViewController.h"
#import "AppDelegate.h"
#import "JMTabView.h"
#import "NotificationView.h"
#import "MGScrollView.h"
#import "MGStyledBox.h"
#import "MGBoxLine.h"
#import "NewsMessageView.h"
#import "AttentionView.h"
#import "PraiseView.h"
#import "OnTopView.h"
#import "PraisePhotoView.h"
#import "ImageIdAndUserNameProtocol.h"
#import "ThirdNewsViewController.h"
@interface ThirdViewController : UIViewController<UIScrollViewDelegate,JMTabViewDelegate,ImageIdAndUserNameProtocol>{
    NSMutableArray *photomessageArray;
    NotificationView *notificationView;
    MGScrollView *scroller;
    NSMutableArray* imgArray;
    ThirdNewsViewController* thirdnews;
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
