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
#import "PictureImageview.h"
@interface PhotoMessageView : UIView<IFLabelDelegate,pictureimageDelegate>{
    UILabel* footlabel;
    id <ImageIdAndUserNameProtocol> delegate;
    int butnum;
    NSString* imgID;
    PictureImageview* imageview;
}

@property (retain, nonatomic) UILabel* footlabel;
@property (nonatomic) int butnum;
@property (nonatomic) id <ImageIdAndUserNameProtocol> delegate;
@property (retain, nonatomic) PictureImageview* imageview;

- (id)initWithFrame:(CGRect)frame clickTextArray:(NSArray *)clickTextArray allString:(NSString *)allString imageID:(NSString *)imageID;
@end
