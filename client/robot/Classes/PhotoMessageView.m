//
//  PhotoMessageView.m
//  template
//
//  Created by yujie liu on 12-8-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PhotoMessageView.h"
#import "DetailTextView.h"
@implementation PhotoMessageView

@synthesize headimageView = _headimageView;
@synthesize footlabel = _footlabel;

- (id)initWithFrame:(CGRect)frame headString:(NSString *)headString footString:(NSString *)footString
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        _headimageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 50, 50)];
        _headimageView.image = [UIImage imageNamed:@""];
        [self addSubview:_headimageView];
        
        DetailTextView *label = [[DetailTextView alloc]initWithFrame:CGRectMake(60, 0, 260, 300)];
        [label setText:[NSString stringWithFormat:@"%@ %@",headString,footString] WithFont:[UIFont systemFontOfSize:15] AndColor:[UIColor blackColor]];
        [label setKeyWordTextString:headString WithFont:[UIFont fontWithName:@"SnellRoundhand" size:18] AndColor:[UIColor redColor]];
        CGSize ssize = [label.text sizeWithFont:[UIFont systemFontOfSize:18] constrainedToSize:CGSizeMake(260.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
        
        float sizeheight = 0;
        
        if (ssize.height == 22.0) {
            CGRect rct = label.frame;
            rct.size = CGSizeMake(260, 30);
            label.frame = rct;
            sizeheight = 32;
        }else {
            CGRect rct = label.frame;
            rct.size = ssize;
            label.frame = rct;
            sizeheight = ssize.height;
        }
        label.center = CGPointMake(190, sizeheight/2);
        [self addSubview:label];
        
        _footlabel = [[UILabel alloc] initWithFrame:CGRectMake(60, sizeheight -5, 180, 20)];
        _footlabel.text = @"";
        _footlabel.font = [UIFont boldSystemFontOfSize:15];     
        _footlabel.textColor = [UIColor lightGrayColor];         
        _footlabel.textAlignment = UITextAlignmentLeft;
        _footlabel.backgroundColor = [UIColor clearColor];
        _footlabel.numberOfLines = 1;
        _footlabel.lineBreakMode = UILineBreakModeTailTruncation;
        [self addSubview:_footlabel];
    }
    return self;
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
