//
//  PraisePhotoView.m
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PraisePhotoView.h"
@implementation PraisePhotoView
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame praiseArray:(NSArray *)praiseArray imageArray:(NSMutableArray *)imageArray timestring:(NSString *)timestring
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(praisephotoNotification:) name:IFTweetLabelURLNotification object:nil];
        
        CGSize ssize = [[NSString stringWithFormat:@"%@ 称赞了%d张照片",[praiseArray objectAtIndex:0],imageArray.count] sizeWithFont:[UIFont systemFontOfSize:19.0f] constrainedToSize:CGSizeMake(300.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
        IFTweetLabel *tweetLabel = [[IFTweetLabel alloc] initWithFrame:CGRectMake(10.0f, 0.0f, ssize.width, ssize.height)];
        [tweetLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
        [tweetLabel setTextColor:[UIColor blackColor]];
        [tweetLabel setBackgroundColor:[UIColor clearColor]];
        tweetLabel.delegate = self;
        [tweetLabel setNumberOfLines:0];
        tweetLabel.expressions = praiseArray;
        [tweetLabel setText:[NSString stringWithFormat:@"%@ 称赞了%d张照片",[praiseArray objectAtIndex:0],imageArray.count]];
        [tweetLabel setLinksEnabled:YES];
        
        [self addSubview:tweetLabel];
        imagmessageArray = imageArray;
        int iby = 0; 
        for (NSInteger i = 0; i < imageArray.count; i++) {
            if (i%4 == 0) {
                iby = tweetLabel.frame.size.height + (i/4*73); 
            }
            NSDictionary *nsdic = [imageArray objectAtIndex:i];
            PictureImageview* imageview = [[PictureImageview alloc] initWithFrame:CGRectMake(8 + i%4 * 73, iby, 65, 65)];
            imageview.userInteractionEnabled=YES;
            imageview.layer.cornerRadius = 5.0;
            imageview.layer.masksToBounds = YES;
            UIImage *icon = [UIImage imageNamed:[nsdic objectForKey:@"username"]];
            imageview.image = icon;
            imageview.tag = i;
            imageview.delegate = self;
            [self addSubview:imageview];
        }
        UILabel* timelabel = [[UILabel alloc] initWithFrame:CGRectMake(20, iby + 73, 250, 20)];
        timelabel.font = [UIFont systemFontOfSize:13];
        timelabel.textColor = [UIColor lightGrayColor];
        timelabel.backgroundColor = [UIColor clearColor];
        timelabel.text = timestring;
        [self addSubview:timelabel];
        
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, iby + 93);
    }
    return self;
}

- (void) pictureevent:(NSInteger) imaagetag{
    NSDictionary *img = [imagmessageArray objectAtIndex:imaagetag];
    [delegate imageID:[img objectForKey:@"imagID"] UIViewType:PraisePhotoViewtype];
}

- (void)IFLabeluserName:(NSString *)userName{
    [delegate userName:userName UIViewType:PraisePhotoViewtype];
}

//- (void)praisephotoNotification:(NSNotification *)notification
//{
//	NSLog(@"praisephotoNotification: notification = %@", notification.object);
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
