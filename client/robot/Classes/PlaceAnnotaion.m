//
//  PlaceAnnotaion.m
//  template
//
//  Created by apple on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PlaceAnnotaion.h"

@implementation PlaceAnnotaion
@synthesize image;
@synthesize latitude;
@synthesize longitude;
@synthesize titleName;
@synthesize subtitleName;


- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = [latitude doubleValue];
    theCoordinate.longitude = [longitude doubleValue];
    return theCoordinate; 
}

- (void)dealloc
{
    [image release];
    [super dealloc];  
}

- (NSString *)title
{
    return self.titleName;
}

// optional
- (NSString *)subtitle
{
    return self.subtitleName;
}

@end
