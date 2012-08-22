//
//  PraisePhotoView.h
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTweetLabel.h"
#import "ImageIdAndUserNameProtocol.h"
#import "PictureImageview.h"
@interface PraisePhotoView : UIView<IFLabelDelegate,pictureimageDelegate>{
    id <ImageIdAndUserNameProtocol> delegate;
    NSMutableArray* imagmessageArray;
}
@property (nonatomic) id <ImageIdAndUserNameProtocol> delegate;

- (id)initWithFrame:(CGRect)frame praiseArray:(NSArray *)praiseArray imageArray:(NSMutableArray *)imageArray timestring:(NSString *)timestring;
@end

