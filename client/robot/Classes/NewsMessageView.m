//
//  NewsMessageView.m
//  template
//
//  Created by 健峰 高 on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NewsMessageView.h"
#import "DetailTextView.h"
@implementation NewsMessageView

@synthesize footlabel = _footlabel;
@synthesize numimage;
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame headString:(NSString *)headString footString:(NSString *)footString imageID:(NSString *)imageID imageURL:(NSString *)imageURL image1ID:(NSString *)image1ID image1URL:(NSString *)image1URL
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        imgID = imageID;
        
        PictureImageview* imageview = [[PictureImageview alloc] initWithFrame:CGRectMake(5, 10, 50, 50)];
        imageview.userInteractionEnabled=YES;
        imageview.layer.cornerRadius = 5.0;
        imageview.layer.masksToBounds = YES;
        UIImage *icon = [UIImage imageNamed:imageURL];
        imageview.image = icon;
        [icon release];
        imageview.tag = 0;
        imageview.delegate = self;
        [self addSubview:imageview];
        [imageview release];
        
        if ([image1ID isEqualToString:@""]) {
            
        }else {
            img1ID = image1ID;
            PictureImageview* imageview1 = [[PictureImageview alloc] initWithFrame:CGRectMake(245, 10, 50, 50)];
            imageview1.userInteractionEnabled=YES;
            imageview1.layer.cornerRadius = 5.0;
            imageview1.layer.masksToBounds = YES;
            UIImage *icon1 = [UIImage imageNamed:image1URL];
            imageview1.image = icon1;
            [icon1 release];
            imageview1.tag = 1;
            imageview1.delegate = self;
            [self addSubview:imageview1];
            [imageview1 release];
        }
        
//        DetailTextView *label = [[DetailTextView alloc]initWithFrame:CGRectMake(60, 0, 150, 300)];
//        [label setText:[NSString stringWithFormat:@"%@ %@",headString,footString] WithFont:[UIFont systemFontOfSize:15] AndColor:[UIColor blackColor]];
//        [label setKeyWordTextString:headString WithFont:[UIFont fontWithName:@"SnellRoundhand" size:18] AndColor:[UIColor redColor]];
//        CGSize ssize = [label.text sizeWithFont:[UIFont systemFontOfSize:18] constrainedToSize:CGSizeMake(180.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
//      
//        float sizeheight = 0;
//        
//        if (ssize.height == 22.0) {
//            CGRect rct = label.frame;
//            rct.size = CGSizeMake(180, 30);
//            label.frame = rct;
//            sizeheight = 32;
//        }else {
//            CGRect rct = label.frame;
//            rct.size = ssize;
//            label.frame = rct;
//            sizeheight = ssize.height;
//        }
//        label.center = CGPointMake(150, sizeheight/2);
//        [self addSubview:label];
        
        CGSize ssize = [[NSString stringWithFormat:@"%@ %@",headString,footString] sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(180.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
        IFTweetLabel *tweetLabel = [[IFTweetLabel alloc] initWithFrame:CGRectMake(65.0f, 5.0f, ssize.width, ssize.height)];
        [tweetLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [tweetLabel setTextColor:[UIColor blackColor]];
        [tweetLabel setBackgroundColor:[UIColor clearColor]];
        [tweetLabel setNumberOfLines:0];
        tweetLabel.delegate = self;
        tweetLabel.expressions = [[NSArray alloc] initWithObjects:
                                  headString,
                                  //@"([hH][tT][tT][pP][sS]?:\\/\\/[^ ,'\">\\]\\)]*[^\\. ,'\">\\]\\)])", // hyperlinks
                                  nil];
        [tweetLabel setText:[NSString stringWithFormat:@"%@ %@",headString,footString]];
        [tweetLabel setLinksEnabled:YES];
        
        [self addSubview:tweetLabel];
        [tweetLabel release];
        
        _footlabel = [[UILabel alloc] initWithFrame:CGRectMake(60, tweetLabel.frame.size.height + 5, 180, 20)];
        _footlabel.text = @"";
        _footlabel.font = [UIFont boldSystemFontOfSize:12];     
        _footlabel.textColor = [UIColor scrollViewTexturedBackgroundColor];         
        _footlabel.textAlignment = UITextAlignmentLeft;
        _footlabel.backgroundColor = [UIColor clearColor];
        _footlabel.numberOfLines = 1;
        _footlabel.lineBreakMode = UILineBreakModeTailTruncation;
        [self addSubview:_footlabel];
        [_footlabel release];
        if (ssize.height < 54) {
            _footlabel.frame = CGRectMake(60, 40, 180, 20);
            self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 70);
        }else {
            self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, tweetLabel.frame.size.height + 25);
        }
        
    }
    return self;
}

#pragma mark pictureimageDelegate

- (void) pictureevent:(NSInteger) imaagetag{
    if (imaagetag == 0) {
        [delegate imageID:imgID UIViewType:NewsMessageViewtype];
    }else {
        [delegate imageID:img1ID UIViewType:NewsMessageViewtype];
    }

}

#pragma mark IFLabelDelegate
- (void)IFLabeluserName:(NSString *)userName{
    [delegate userName:userName UIViewType:NewsMessageViewtype];
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
