//
//  OnTopView.h
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTweetLabel.h"
#import "ImageIdAndUserNameProtocol.h"
#import "PictureImageview.h"
@interface OnTopView : UIView<IFLabelDelegate,pictureimageDelegate>{
    id <ImageIdAndUserNameProtocol> delegate;
    NSString* imgID;
}
@property (nonatomic) id <ImageIdAndUserNameProtocol> delegate;
- (id)initWithFrame:(CGRect)frame praiseArray:(NSArray *)praiseArray imageArray:(NSMutableArray *)imageArray timestring:(NSString *)timestring;
@end