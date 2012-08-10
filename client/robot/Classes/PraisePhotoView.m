//
//  PraisePhotoView.m
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PraisePhotoView.h"
#import "IFTweetLabel.h"
@implementation PraisePhotoView
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame firstname:(NSString *)firstname imagecount:(int)imagecount imageArray:(NSMutableArray *)imageArray
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(praisephotoNotification:) name:IFTweetLabelURLNotification object:nil];
        
        CGSize ssize = [[NSString stringWithFormat:@"%@ 称赞了8张照片",firstname] sizeWithFont:[UIFont systemFontOfSize:19.0f] constrainedToSize:CGSizeMake(300.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
        IFTweetLabel *tweetLabel = [[IFTweetLabel alloc] initWithFrame:CGRectMake(10.0f, 0.0f, ssize.width, ssize.height)];
        [tweetLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
        [tweetLabel setTextColor:[UIColor blackColor]];
        [tweetLabel setBackgroundColor:[UIColor clearColor]];
        [tweetLabel setNumberOfLines:0];
        tweetLabel.expressions = [[NSArray alloc] initWithObjects:
                                  firstname,
                                  //@"([hH][tT][tT][pP][sS]?:\\/\\/[^ ,'\">\\]\\)]*[^\\. ,'\">\\]\\)])", // hyperlinks
                                  nil];
        [tweetLabel setText:[NSString stringWithFormat:@"%@ 称赞了%d张照片",firstname,imagecount]];
        [tweetLabel setLinksEnabled:YES];
        
        [self addSubview:tweetLabel];
        
        int iby = 0; 
        for (int i = 0; i < imagecount; i++) {
            if (i%4 == 0) {
                iby = tweetLabel.frame.size.height + (i/4*73); 
            }
            NSDictionary *nsdic = [imageArray objectAtIndex:i];
            UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            imageButton.frame = CGRectMake(8 + i%4 * 73, iby, 65, 65);
            [imageButton setImage:[UIImage imageNamed:[nsdic objectForKey:@"imag"]] forState:UIControlStateNormal];
            [imageButton addTarget:self action:@selector(onClickImage) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:imageButton];
        }
        UILabel* timelabel = [[UILabel alloc] initWithFrame:CGRectMake(20, iby + 73, 250, 20)];
        timelabel.font = [UIFont systemFontOfSize:13];
        timelabel.textColor = [UIColor lightGrayColor];
        timelabel.backgroundColor = [UIColor clearColor];
        timelabel.text = @"1小时前";
        [self addSubview:timelabel];
        
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, iby + 93);
    }
    return self;
}

- (void) onClickImage {
    [delegate praisephotoImage:0];
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