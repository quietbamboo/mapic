//
//  PhotoMessage.h
//  template
//
//  Created by yujie liu on 12-9-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoMessage : NSObject{

    UIImage *image;
    NSString *imageURLString;
    NSArray* clickTextArray;
    NSString* allString;
    NSString* imageID;
    NSString* phototime;
}

@property (nonatomic,retain) UIImage *image;
@property (nonatomic, retain) NSString *imageURLString;
@property (nonatomic, retain) NSArray* clickTextArray;
@property (nonatomic, retain) NSString* allString;
@property (nonatomic, retain) NSString* imageID;
@property (nonatomic, retain) NSString* phototime;
@end
