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
@interface OnTopView : UIView<IFLabelDelegate>{
    id <ImageIdAndUserNameProtocol> delegate;
    NSString* imgID;
}
@property (nonatomic) id <ImageIdAndUserNameProtocol> delegate;
- (id)initWithFrame:(CGRect)frame userName:(NSString *)userName imageID:(NSString *)imageID;
@end