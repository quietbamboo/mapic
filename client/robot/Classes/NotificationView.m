//
//  NotificationView.m
//  template
//
//  Created by apple on 12-7-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NotificationView.h"

@implementation NotificationView
@synthesize userLabel = _userLabel;
@synthesize followerLabel = _followerLabel;
@synthesize likeLabel = _likeLabel;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(frame.origin.x,frame.origin.y,140, 47)];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView  *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height)];
        imageView.image = [UIImage imageNamed:@"notificationToast.png"];
        [self addSubview:imageView];
        [imageView release];
        
        UIImageView  *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(5,2,25,30)];
        imageView1.image = [UIImage imageNamed:@"notificationToastCommentIcon.png"];
        [self addSubview:imageView1];
        [imageView1 release];
        
        UIImageView  *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(50,2,25,30)];
        imageView2.image = [UIImage imageNamed:@"notificationToastFollowerIcon.png"];
        [self addSubview:imageView2];
        [imageView2 release];
        
        UIImageView  *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(95,2,25,30)];
        imageView3.image = [UIImage imageNamed:@"notificationToastLikeIcon.png"];
        [self addSubview:imageView3];
        [imageView3 release];
        
        _userLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 10, 30)];
        _userLabel.text = @"0";
        _userLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_userLabel];
       
        _followerLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, 10, 30)];
        _followerLabel.text =@"0"; 
        _followerLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_followerLabel];
        
        _likeLabel= [[UILabel alloc] initWithFrame:CGRectMake(125, 0, 10, 30)];
        _likeLabel.text = @"";
        _likeLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_likeLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.hidden = YES;
}
- (void)dealloc{
    [_likeLabel release];
    [_followerLabel release];
    [_userLabel release];
    [super dealloc];
}
@end
