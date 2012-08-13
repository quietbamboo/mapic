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
    
    UIImageView* footimageView;
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

- (id)initWithFrame:(CGRect)frame headString:(NSString *)headString footString:(NSString *)footString imageID:(NSString *)imageID imageURL:(NSString *)imageURL image1ID:(NSString *)image1ID image1URL:(NSString *)image1URL;
@end
