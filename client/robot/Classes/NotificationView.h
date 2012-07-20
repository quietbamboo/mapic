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
    UILabel *messageLabel;
    UILabel *likeLabel;
}
@property (retain, nonatomic) UILabel *userLabel;
@property (retain, nonatomic) UILabel *messageLabel;
@property (retain, nonatomic) UILabel *likeLabel;
@end
