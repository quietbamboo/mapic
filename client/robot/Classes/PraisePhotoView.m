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
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(praisephotoNotification:) name:IFTweetLabelURLNotification object:nil];
        
        CGSize ssize = [[NSString stringWithFormat:@"colorcreative 称赞了8张照片"] sizeWithFont:[UIFont systemFontOfSize:19.0f] constrainedToSize:CGSizeMake(300.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
        IFTweetLabel *tweetLabel = [[IFTweetLabel alloc] initWithFrame:CGRectMake(10.0f, 0.0f, ssize.width, ssize.height + 30)];
        [tweetLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        [tweetLabel setTextColor:[UIColor blackColor]];
        [tweetLabel setBackgroundColor:[UIColor clearColor]];
        [tweetLabel setNumberOfLines:0];
        tweetLabel.expressions = [[NSArray alloc] initWithObjects:
                                  @"colorcreative",
                                  //@"([hH][tT][tT][pP][sS]?:\\/\\/[^ ,'\">\\]\\)]*[^\\. ,'\">\\]\\)])", // hyperlinks
                                  nil];
        [tweetLabel setText:[NSString stringWithFormat:@"colorcreative 称赞了8张照片"]];
        [tweetLabel setLinksEnabled:YES];
        
        [self addSubview:tweetLabel];
        
        int iby = 0; 
        for (int i = 0; i < 8; i++) {
            if (i%4 == 0) {
                iby = tweetLabel.frame.size.height + (i/4*50); 
            }
            UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            imageButton.frame = CGRectMake(10 + i%4 * 60, iby, 50, 50);
            [imageButton setImage:[UIImage imageNamed:@"Icon.png"] forState:UIControlStateNormal];
            [imageButton addTarget:self action:@selector(onClickImage) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:imageButton];
        }
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, iby + 60);
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
