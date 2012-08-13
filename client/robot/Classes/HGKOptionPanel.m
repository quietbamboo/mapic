//
//  HGKOptionPanel.m
//  iNVASIVE
//
//  Created by Jon Arrien Fernández on 18/08/11.
//  Copyright 2011 Hegaka. All rights reserved.
//

#import "HGKOptionPanel.h"

#import <QuartzCore/QuartzCore.h>

@implementation HGKOptionPanel

@synthesize btnShowHide,isExpanded;



- (id)initWithFrame:(CGRect)frame
{   
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        isExpanded = YES;
        btnShowHide = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnShowHide setFrame:CGRectMake(145, frame.size.height - 30, 30, 30)];
        [btnShowHide setImage:[UIImage imageNamed:@"iconCollapse.png"] forState:UIControlStateNormal];
        [btnShowHide addTarget:self action:@selector(controlPanelShowHide:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnShowHide];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
   // isExpanded = YES;
}
-(void) changebackgroundColor:(NSTimer *) sender{
    [sender invalidate];
    self.backgroundColor = [UIColor clearColor];
}
-(void) controlPanelShowHide:(id)sender
{
    CGRect frame = self.frame;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    if (!self.isExpanded)
    {
        self.isExpanded = YES;
        
        frame.origin.y -= (self.frame.size.height - 30);
        self.frame = frame;
        [NSTimer scheduledTimerWithTimeInterval:0.35f target:self selector:@selector(changebackgroundColor:) userInfo:nil repeats:NO];

        [self.btnShowHide setImage:[UIImage imageNamed:@"iconCollapse.png"] forState:UIControlStateNormal];
    } else {
        self.isExpanded = NO;
   
        frame.origin.y += (self.frame.size.height - 30);
        self.frame = frame;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.35];
               [self.btnShowHide setImage:[UIImage imageNamed:@"iconExpand.png"] forState:UIControlStateNormal];
    }
    [UIView commitAnimations];
    if (self.isExpanded)
        [self.btnShowHide setImage:[UIImage imageNamed:@"iconCollapse.png"] forState:UIControlStateNormal];
    else
        [self.btnShowHide setImage:[UIImage imageNamed:@"iconExpand.png"] forState:UIControlStateNormal];

}

- (void) dealloc{
    [super dealloc];
    //[btnShowHide release];
    btnShowHide = nil;
}

@end
