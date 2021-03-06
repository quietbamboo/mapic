//
//  PhotoMessageView.m
//  template
//
//  Created by yujie liu on 12-8-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PhotoMessageView.h"
@implementation PhotoMessageView

@synthesize footlabel = _footlabel;
@synthesize butnum = _butnum;
@synthesize delegate;
@synthesize imageview = _imageview;
- (id)initWithFrame:(CGRect)frame clickTextArray:(NSArray *)clickTextArray allString:(NSString *)allString imageID:(NSString *)imageID
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        imgID = imageID;
        
        _imageview = [[PictureImageview alloc] initWithFrame:CGRectMake(8, 8, 65, 65)];
        _imageview.userInteractionEnabled=YES;
        _imageview.layer.cornerRadius = 5.0;
        _imageview.layer.masksToBounds = YES;
        _imageview.image = [UIImage imageNamed:@""];
        _imageview.tag = 0;
        _imageview.delegate = self;
        [self addSubview:_imageview];
        
        CGSize ssize = [[NSString stringWithFormat:@"%@",allString] sizeWithFont:[UIFont systemFontOfSize:19.0f] constrainedToSize:CGSizeMake(240.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
        IFTweetLabel *tweetLabel = [[IFTweetLabel alloc] initWithFrame:CGRectMake(80.0f, 0.0f, ssize.width, ssize.height)];
        [tweetLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
        [tweetLabel setTextColor:[UIColor blackColor]];
        [tweetLabel setBackgroundColor:[UIColor clearColor]];
        [tweetLabel setNumberOfLines:0];
        tweetLabel.delegate = self;
        tweetLabel.expressions = clickTextArray;
        [tweetLabel setText:[NSString stringWithFormat:@"%@",allString]];
        [tweetLabel setLinksEnabled:YES];
        [self addSubview:tweetLabel];
        
        _footlabel = [[UILabel alloc] initWithFrame:CGRectMake(80, tweetLabel.frame.size.height - 5, 180, 20)];
        _footlabel.text = @"";
        _footlabel.font = [UIFont boldSystemFontOfSize:13];     
        _footlabel.textColor = [UIColor lightGrayColor];         
        _footlabel.textAlignment = UITextAlignmentLeft;
        _footlabel.backgroundColor = [UIColor clearColor];
        _footlabel.numberOfLines = 1;
        _footlabel.lineBreakMode = UILineBreakModeTailTruncation;
        [self addSubview:_footlabel];
         self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, tweetLabel.frame.size.height + 10);
    }
    return self;
}

#pragma mark pictureimageDelegate

- (void) pictureevent:(NSInteger) imaagetag{
    [delegate imageID:imgID UIViewType:PhotoMessageViewtype];
}

#pragma mark IFLabelDelegate

- (void)IFLabeluserName:(NSString *)userName{
    [delegate userName:userName UIViewType:PhotoMessageViewtype];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [delegate touchesBegan:touches withEvent:event UIViewType:PhotoMessageViewtype];
}
- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
     [delegate touchesBegan:touches withEvent:event UIViewType:PhotoMessageViewtype];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
