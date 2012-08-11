//
//  PraiseView.h
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTweetLabel.h"
#import "ImageIdAndUserNameProtocol.h"
@interface PraiseView : UIView<IFLabelDelegate>{
    id <ImageIdAndUserNameProtocol> delegate;
    NSString* imgID;
}
@property (nonatomic) id <ImageIdAndUserNameProtocol> delegate;

- (id)initWithFrame:(CGRect)frame firstname:(NSString *)firstname secondname:(NSString *)secondname imageID:(NSString *)imageID;

@end

