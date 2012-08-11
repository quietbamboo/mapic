//
//  PhotoMessageView.h
//  template
//
//  Created by yujie liu on 12-8-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTweetLabel.h"
@protocol PhotoMessageDelegate;
@interface PhotoMessageView : UIView<IFLabelDelegate>{

    UILabel* footlabel;
    id <PhotoMessageDelegate> delegate;
    int butnum;
}

@property (retain, nonatomic) UILabel* footlabel;
@property (nonatomic) int butnum;
@property (nonatomic) id <PhotoMessageDelegate> delegate;

- (id)initWithFrame:(CGRect)frame headString:(NSString *)headString footString:(NSString *)footString heimage:(UIImage *)heimage;

@end

@protocol PhotoMessageDelegate <NSObject>
- (void)clickImage:(int)imagenum;
- (void)photomessagematch:(NSString *)match;
@end