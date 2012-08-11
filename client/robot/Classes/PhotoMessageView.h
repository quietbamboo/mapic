//
//  PhotoMessageView.h
//  template
//
//  Created by yujie liu on 12-8-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTweetLabel.h"
#import "ImageIdAndUserNameProtocol.h"
@interface PhotoMessageView : UIView<IFLabelDelegate>{
    UILabel* footlabel;
    id <ImageIdAndUserNameProtocol> delegate;
    int butnum;
    NSString* imgID;
}

@property (retain, nonatomic) UILabel* footlabel;
@property (nonatomic) int butnum;
@property (nonatomic) id <ImageIdAndUserNameProtocol> delegate;

- (id)initWithFrame:(CGRect)frame headString:(NSString *)headString footString:(NSString *)footString imageID:(NSString *)imageID;

@end
