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
#import "PictureImageview.h"
@interface NewsMessageView : UIView<IFLabelDelegate,pictureimageDelegate>{
    
    UILabel* footlabel;
    id<ImageIdAndUserNameProtocol> delegate;
    int numimage;
    NSString* imgID;
    NSString* img1ID;
}

@property (retain, nonatomic) UIImageView* footimageView;
@property (retain, nonatomic) UILabel* footlabel;
@property (nonatomic) int numimage;
@property (nonatomic) id <ImageIdAndUserNameProtocol> delegate;

- (id)initWithFrame:(CGRect)frame clickTextArray:(NSArray *)clickTextArray allString:(NSString *)allString headimageID:(NSString *)headimageID headimageURL:(NSString *)headimageURL footimageID:(NSString *)footimageID footimageURL:(NSString *)footimageURL;
@end
