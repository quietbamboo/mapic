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
@interface PraisePhotoView : UIView<IFLabelDelegate>{
    id <ImageIdAndUserNameProtocol> delegate;
    NSMutableArray* imagmessageArray;
}
@property (nonatomic) id <ImageIdAndUserNameProtocol> delegate;

- (id)initWithFrame:(CGRect)frame firstname:(NSString *)firstname imagecount:(int)imagecount imageArray:(NSMutableArray *)imageArray;
@end

