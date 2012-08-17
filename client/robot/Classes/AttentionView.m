//
//  AttentionView.m
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AttentionView.h"
#import "IFTweetLabel.h"
@implementation AttentionView
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame firstname:(NSString *)firstname attentionArray:(NSArray *)attentionArray
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(attentionNotification:) name:IFTweetLabelURLNotification object:nil];
        
        CGSize ssize = [firstname sizeWithFont:[UIFont systemFontOfSize:19.0f] constrainedToSize:CGSizeMake(320.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
        IFTweetLabel *tweetLabel = [[IFTweetLabel alloc] initWithFrame:CGRectMake(5.0f, 0.0f, ssize.width, ssize.height)];
        [tweetLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
        [tweetLabel setTextColor:[UIColor blackColor]];
        [tweetLabel setBackgroundColor:[UIColor clearColor]];
        [tweetLabel setNumberOfLines:0];
        tweetLabel.delegate = self;
        tweetLabel.expressions = attentionArray; //[[NSArray alloc] initWithObjects:
//                                  firstname,
//                                  secondname,
//                                  //@"([hH][tT][tT][pP][sS]?:\\/\\/[^ ,'\">\\]\\)]*[^\\. ,'\">\\]\\)])", // hyperlinks
//                                  nil];
        [tweetLabel setText:firstname];
        [tweetLabel setLinksEnabled:YES];

        [self addSubview:tweetLabel];
        
        UILabel* timelabel = [[UILabel alloc] initWithFrame:CGRectMake(10, tweetLabel.frame.size.height, 320, 20)];
        timelabel.textColor = [UIColor lightGrayColor];
        timelabel.font = [UIFont systemFontOfSize:13];
        timelabel.backgroundColor = [UIColor clearColor];
        timelabel.text = @"5小时前";
        [self addSubview:timelabel];
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, tweetLabel.frame.size.height + 20);
    }
    return self;
}

- (void) onClickImage:(id)send{
    [delegate imageID:@"" UIViewType:OnTopViewtype];
}

- (void)IFLabeluserName:(NSString *)userName{
    [delegate userName:userName UIViewType:OnTopViewtype];
}
//- (void)attentionNotification:(NSNotification *)notification
//{
//	NSLog(@"attentionNotification: notification = %@", notification.object);
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
