//
//  PraiseView.m
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PraiseView.h"
@implementation PraiseView

@synthesize delegate;
- (id)initWithFrame:(CGRect)frame firstname:(NSString *)firstname secondname:(NSString *)secondname headimage:(UIImage *)headimage
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        imageButton.frame = CGRectMake(8, 8, 65, 65);
        [imageButton setImage:headimage forState:UIControlStateNormal];
        [imageButton addTarget:self action:@selector(onClickImage) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:imageButton];
        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(praiseNotification:) name:IFTweetLabelURLNotification object:nil];
        
        CGSize ssize = [[NSString stringWithFormat:@"%@ 称赞了 %@ 的照片。",firstname,secondname] sizeWithFont:[UIFont systemFontOfSize:19.0f] constrainedToSize:CGSizeMake(220.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
        IFTweetLabel *tweetLabel = [[IFTweetLabel alloc] initWithFrame:CGRectMake(80.0f, 8.0f, ssize.width, ssize.height)];
        [tweetLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
        [tweetLabel setTextColor:[UIColor blackColor]];
        [tweetLabel setBackgroundColor:[UIColor clearColor]];
        [tweetLabel setNumberOfLines:0];
        tweetLabel.delegate = self;
        tweetLabel.expressions = [[NSArray alloc] initWithObjects:
                                  firstname,
                                  secondname,
                                  //@"([hH][tT][tT][pP][sS]?:\\/\\/[^ ,'\">\\]\\)]*[^\\. ,'\">\\]\\)])", // hyperlinks
                                  nil];
        [tweetLabel setText:[NSString stringWithFormat:@"%@ 称赞了 %@ 的照片。",firstname,secondname]];
        [tweetLabel setLinksEnabled:YES];
        
        [self addSubview:tweetLabel];
        UILabel* timelabel = [[UILabel alloc] initWithFrame:CGRectMake(80, tweetLabel.frame.size.height + 5, 220, 20)];
        timelabel.font = [UIFont systemFontOfSize:13];
        timelabel.textColor = [UIColor lightGrayColor];
        timelabel.backgroundColor = [UIColor clearColor];
        timelabel.text = @"3小时前";
        [self addSubview:timelabel];
        if (tweetLabel.frame.size.height + 10 < 81) {
            self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 81);
        }else {
            self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, tweetLabel.frame.size.height + 25);
        }
    }
    return self;
}


- (void) onClickImage {
    [delegate praiseImage:0];
}

- (void)IFLabelmatch:(NSString *)match{
    [delegate praisematch:match];
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
