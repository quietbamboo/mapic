//
//  PraiseView.m
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PraiseView.h"
#import "IFTweetLabel.h"
@implementation PraiseView

@synthesize delegate;
- (id)initWithFrame:(CGRect)frame firstname:(NSString *)firstname secondname:(NSString *)secondname headimage:(UIImage *)headimage
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        imageButton.frame = CGRectMake(5, 10, 50, 50);
        [imageButton setImage:headimage forState:UIControlStateNormal];
        [imageButton addTarget:self action:@selector(onClickImage) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:imageButton];
        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(praiseNotification:) name:IFTweetLabelURLNotification object:nil];
        
        CGSize ssize = [[NSString stringWithFormat:@"%@ 称赞了 %@ 的的撒发生法是否 dsafsdaf 照片。",firstname,secondname] sizeWithFont:[UIFont systemFontOfSize:19.0f] constrainedToSize:CGSizeMake(250.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
        IFTweetLabel *tweetLabel = [[IFTweetLabel alloc] initWithFrame:CGRectMake(65.0f, 0.0f, ssize.width, ssize.height + 30)];
        [tweetLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        [tweetLabel setTextColor:[UIColor blackColor]];
        [tweetLabel setBackgroundColor:[UIColor clearColor]];
        [tweetLabel setNumberOfLines:0];
        tweetLabel.expressions = [[NSArray alloc] initWithObjects:
                                  firstname,
                                  secondname,
                                  //@"([hH][tT][tT][pP][sS]?:\\/\\/[^ ,'\">\\]\\)]*[^\\. ,'\">\\]\\)])", // hyperlinks
                                  nil];
        [tweetLabel setText:[NSString stringWithFormat:@"%@ 称赞了 %@ 的的撒发生法是否 dsafsdaf 照片。",firstname,secondname]];
        [tweetLabel setLinksEnabled:YES];
        
        [self addSubview:tweetLabel];
        UILabel* timelabel = [[UILabel alloc] initWithFrame:CGRectMake(60, tweetLabel.frame.size.height - 10, 250, 20)];
        timelabel.font = [UIFont systemFontOfSize:13];
        timelabel.textColor = [UIColor lightGrayColor];
        timelabel.text = @"3小时前";
        [self addSubview:timelabel];
        
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, tweetLabel.frame.size.height + 10);
    }
    return self;
}


- (void) onClickImage {
    [delegate praiseImage:0];
}

//- (void)praiseNotification:(NSNotification *)notification
//{
//	NSLog(@"praiseNotification: notification = %@", notification.object);
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
