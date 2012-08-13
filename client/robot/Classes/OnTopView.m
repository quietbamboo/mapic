//
//  OnTopView.m
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OnTopView.h"
@implementation OnTopView
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame userName:(NSString *)userName imageID:(NSString *)imageID imageURL:(NSString *)imageURL
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        imgID = imageID;
        PictureImageview* imageview = [[PictureImageview alloc] initWithFrame:CGRectMake(8, 8, 65, 65)];
        imageview.userInteractionEnabled=YES;
        imageview.layer.cornerRadius = 5.0;
        imageview.layer.masksToBounds = YES;
        UIImage *icon = [UIImage imageNamed:imageURL];
        imageview.image = icon;
        imageview.tag = 0;
        imageview.delegate = self;
        [self addSubview:imageview];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ontopNotification:) name:IFTweetLabelURLNotification object:nil];
        
        CGSize ssize = [[NSString stringWithFormat:@"%@ 的照片上热门榜了。",userName] sizeWithFont:[UIFont systemFontOfSize:18.0f] constrainedToSize:CGSizeMake(220.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
        IFTweetLabel *tweetLabel = [[IFTweetLabel alloc] initWithFrame:CGRectMake(80.0f, 8.0f, ssize.width, ssize.height)];
        [tweetLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
        [tweetLabel setTextColor:[UIColor blackColor]];
        [tweetLabel setBackgroundColor:[UIColor clearColor]];
        [tweetLabel setNumberOfLines:0];
        tweetLabel.delegate = self;
        tweetLabel.expressions = [[NSArray alloc] initWithObjects:
                                  userName,
                                  //@"([hH][tT][tT][pP][sS]?:\\/\\/[^ ,'\">\\]\\)]*[^\\. ,'\">\\]\\)])", // hyperlinks
                                  nil];
        [tweetLabel setText:[NSString stringWithFormat:@"%@ 的照片上热门榜了。",userName]];
        [tweetLabel setLinksEnabled:YES];
        
        [self addSubview:tweetLabel];
        
        UILabel* timelabel = [[UILabel alloc] initWithFrame:CGRectMake(80, tweetLabel.frame.size.height + 5, 220, 20)];
        timelabel.font = [UIFont systemFontOfSize:13];
        timelabel.textColor = [UIColor lightGrayColor];
        timelabel.backgroundColor = [UIColor clearColor];
        timelabel.text = @"1小时前";
        [self addSubview:timelabel];
        if (tweetLabel.frame.size.height + 10 < 81) {
            self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 81);
        }else {
            self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, tweetLabel.frame.size.height + 20);
        }
        
    }
    return self;
}

- (void) pictureevent:(NSInteger) imaagetag{
    [delegate imageID:imgID UIViewType:OnTopViewtype];
}

- (void)IFLabeluserName:(NSString *)userName{
    [delegate userName:userName UIViewType:OnTopViewtype];
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
