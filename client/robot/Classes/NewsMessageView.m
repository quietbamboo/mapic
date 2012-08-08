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

@synthesize footimageView = _footimageView;
@synthesize footlabel = _footlabel;
@synthesize numimage;
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame headString:(NSString *)headString footString:(NSString *)footString headimage:(UIImage *)headimage
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        imageButton.frame = CGRectMake(10, 10, 50, 50);
        [imageButton setImage:headimage forState:UIControlStateNormal];
        [imageButton addTarget:self action:@selector(onClickImage) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:imageButton];
        
        _footimageView = [[UIImageView alloc] initWithFrame:CGRectMake(245, 10, 50, 50)];
        _footimageView.image = [UIImage imageNamed:@""];
        [self addSubview:_footimageView];
        
        DetailTextView *label = [[DetailTextView alloc]initWithFrame:CGRectMake(60, 0, 150, 300)];
        [label setText:[NSString stringWithFormat:@"%@ %@",headString,footString] WithFont:[UIFont systemFontOfSize:15] AndColor:[UIColor blackColor]];
        [label setKeyWordTextString:headString WithFont:[UIFont fontWithName:@"SnellRoundhand" size:18] AndColor:[UIColor redColor]];
        CGSize ssize = [label.text sizeWithFont:[UIFont systemFontOfSize:18] constrainedToSize:CGSizeMake(180.0f, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
      
        float sizeheight = 0;
        
        if (ssize.height == 22.0) {
            CGRect rct = label.frame;
            rct.size = CGSizeMake(180, 30);
            label.frame = rct;
            sizeheight = 32;
        }else {
            CGRect rct = label.frame;
            rct.size = ssize;
            label.frame = rct;
            sizeheight = ssize.height;
        }
        label.center = CGPointMake(150, sizeheight/2);
        [self addSubview:label];
        
        _footlabel = [[UILabel alloc] initWithFrame:CGRectMake(60, sizeheight -10, 180, 20)];
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

- (void) onClickImage {
    [delegate clickImage:numimage];
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
