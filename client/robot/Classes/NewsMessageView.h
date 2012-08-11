//
//  NewsMessageView.h
//  template
//
//  Created by 健峰 高 on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTweetLabel.h"
@protocol NewsMessageDelegate;
@interface NewsMessageView : UIView<IFLabelDelegate>{
    
    UIImageView* footimageView;
    UILabel* footlabel;
    id<NewsMessageDelegate> delegate;
    int numimage;
}

@property (retain, nonatomic) UIImageView* footimageView;
@property (retain, nonatomic) UILabel* footlabel;
@property (nonatomic) int numimage;
@property (nonatomic) id <NewsMessageDelegate> delegate;

- (id)initWithFrame:(CGRect)frame headString:(NSString *)headString footString:(NSString *)footString headimage:(UIImage *)headimage;
@end

@protocol NewsMessageDelegate <NSObject>
- (void)clickImage:(int)imagenum;
- (void)newsmessagematch:(NSString *)match;
@end