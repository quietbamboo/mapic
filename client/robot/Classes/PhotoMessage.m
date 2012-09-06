//
//  PhotoMessage.m
//  template
//
//  Created by yujie liu on 12-9-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PhotoMessage.h"

@implementation PhotoMessage
@synthesize imageURLString;
@synthesize image;
@synthesize allString;
@synthesize imageID;
@synthesize clickTextArray;
@synthesize phototime;

- (void) dealloc
{
    [phototime release];
    [clickTextArray release];
    [imageID release];
    [allString release];
    [image release];
    [imageURLString release];
	[super dealloc];
}

@end
