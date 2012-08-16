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
- (id)initWithFrame:(CGRect)frame headString:(NSString *)headString footString:(NSString *)footString imageID:(NSString *)imageID imageURL:(NSString *)imageURL
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
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
        
        CGSize ssize = [[NSString stringWithFormat:@"%@ %@",headString,footString] sizeWithFont:[UIFont systemFontOfSize:19.0f] constrainedToSize:CGSizeMake(240.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
        IFTweetLabel *tweetLabel = [[IFTweetLabel alloc] initWithFrame:CGRectMake(80.0f, 0.0f, ssize.width, ssize.height)];
        [tweetLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
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
        
        _footlabel = [[UILabel alloc] initWithFrame:CGRectMake(80, tweetLabel.frame.size.height - 5, 180, 20)];
        _footlabel.text = @"";
        _footlabel.font = [UIFont boldSystemFontOfSize:15];     
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

- (void) pictureevent:(NSInteger) imaagetag{
    [delegate imageID:imgID UIViewType:PhotoMessageViewtype];
}

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
