//
//  CellView.m
//  template
//
//  Created by apple on 12-7-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CellView.h"

@implementation CellView

@synthesize imageView = _imageView;
@synthesize namelabel = _namelabel;
@synthesize desclabel = _desclabel;
@synthesize distancelabel = _distancelabel;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 0, 60, 60)];
        _imageView.image = [UIImage imageNamed:@""];
        [self addSubview:_imageView];
        
        _namelabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 6, 133, 24.0)];
        _namelabel.text = @"0";
        _namelabel.font = [UIFont boldSystemFontOfSize:15];     
        _namelabel.textColor = [UIColor blackColor];         
        _namelabel.textAlignment = UITextAlignmentLeft; 
        _namelabel.numberOfLines = 1;
        _namelabel.lineBreakMode = UILineBreakModeTailTruncation;
        [self addSubview:_namelabel];
        
        _distancelabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 30.0, 120, 28.0)];
        _distancelabel.text = @"0";
        _distancelabel.font = [UIFont boldSystemFontOfSize:14];     
        _distancelabel.textColor = [UIColor blueColor];         
        _distancelabel.textAlignment = UITextAlignmentLeft; 
        _distancelabel.numberOfLines = 1;
        _distancelabel.lineBreakMode = UILineBreakModeTailTruncation;
        [self addSubview:_distancelabel];
        
        _desclabel = [[UILabel alloc]initWithFrame:CGRectMake(203.0, 1.0, 85.0, 60.0)];
        _desclabel.text = @"0";
        _desclabel.font = [UIFont boldSystemFontOfSize:10];     
        _desclabel.textColor = [UIColor purpleColor];         
        _desclabel.textAlignment = UITextAlignmentLeft; 
        _desclabel.numberOfLines = 3;
        _desclabel.lineBreakMode = UILineBreakModeTailTruncation;
        [self addSubview:_desclabel];
        
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
