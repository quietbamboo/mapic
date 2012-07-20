//
//  NotificationView.h
//  template
//
//  Created by apple on 12-7-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationView : UIView{
    
    UILabel *userLabel;
    UILabel *followerLabel;
    UILabel *likeLabel;
}
@property (retain, nonatomic) UILabel *userLabel;
@property (retain, nonatomic) UILabel *followerLabel;
@property (retain, nonatomic) UILabel *likeLabel;
@end
