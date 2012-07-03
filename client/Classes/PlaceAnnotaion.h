//
//  PlaceAnnotaion.h
//  template
//
//  Created by apple on 12-6-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlaceAnnotaion : NSObject<MKAnnotation>
{
    UIImage *image;
    NSNumber *latitude;
    NSNumber *longitude;
    NSString *titleName;
    NSString *subtitleName;
}

@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;
@property (nonatomic, copy) NSString *titleName;
@property (nonatomic, copy) NSString *subtitleName;
@end
