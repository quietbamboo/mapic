//
//  NewsMessageView.h
//  template
//
//  Created by 健峰 高 on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTweetLabel.h"
#import "ImageIdAndUserNameProtocol.h"
@interface NewsMessageView : UIView<IFLabelDelegate>{
    
    UIImageView* footimageView;
    UILabel* footlabel;
    id<ImageIdAndUserNameProtocol> delegate;
    int numimage;
    NSString* imgID;
}

@property (retain, nonatomic) UIImageView* footimageView;
@property (retain, nonatomic) UILabel* footlabel;
@property (nonatomic) int numimage;
@property (nonatomic) id <ImageIdAndUserNameProtocol> delegate;

- (id)initWithFrame:(CGRect)frame headString:(NSString *)headString footString:(NSString *)footString imageID:(NSString *)imageID;
@end
