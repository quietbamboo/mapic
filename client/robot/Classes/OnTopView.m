//
//  OnTopView.m
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OnTopView.h"
#import "IFTweetLabel.h"
@implementation OnTopView
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        imageButton.frame = CGRectMake(5, 10, 50, 50);
        [imageButton setImage:[UIImage imageNamed:@"Icon.png"] forState:UIControlStateNormal];
        [imageButton addTarget:self action:@selector(onClickImage) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:imageButton];
        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ontopNotification:) name:IFTweetLabelURLNotification object:nil];
        
        CGSize ssize = [[NSString stringWithFormat:@"colorcreative 的照片上热门榜了。"] sizeWithFont:[UIFont systemFontOfSize:19.0f] constrainedToSize:CGSizeMake(250.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
        IFTweetLabel *tweetLabel = [[IFTweetLabel alloc] initWithFrame:CGRectMake(65.0f, 0.0f, ssize.width, ssize.height + 30)];
        [tweetLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        [tweetLabel setTextColor:[UIColor blackColor]];
        [tweetLabel setBackgroundColor:[UIColor clearColor]];
        [tweetLabel setNumberOfLines:0];
        tweetLabel.expressions = [[NSArray alloc] initWithObjects:
                                  @"colorcreative",
                                  //@"([hH][tT][tT][pP][sS]?:\\/\\/[^ ,'\">\\]\\)]*[^\\. ,'\">\\]\\)])", // hyperlinks
                                  nil];
        [tweetLabel setText:[NSString stringWithFormat:@"colorcreative 的照片上热门榜了。"]];
        [tweetLabel setLinksEnabled:YES];
        
        [self addSubview:tweetLabel];
        
        UILabel* timelabel = [[UILabel alloc] initWithFrame:CGRectMake(60, tweetLabel.frame.size.height - 10, 250, 20)];
        timelabel.font = [UIFont systemFontOfSize:13];
        timelabel.textColor = [UIColor lightGrayColor];
        timelabel.text = @"1小时前";
        [self addSubview:timelabel];
        
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, tweetLabel.frame.size.height + 10);
    }
    return self;
}

- (void) onClickImage {
    [delegate ontopImage:0];
}

//- (void)ontopNotification:(NSNotification *)notification
//{
//	NSLog(@"ontopNotification: notification = %@", notification.object);
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
