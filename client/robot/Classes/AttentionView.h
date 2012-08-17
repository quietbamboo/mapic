//
//  AttentionView.h
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTweetLabel.h"
#import "ImageIdAndUserNameProtocol.h"
@interface AttentionView : UIView<IFLabelDelegate>{
    id <ImageIdAndUserNameProtocol> delegate;
}
@property (nonatomic) id <ImageIdAndUserNameProtocol> delegate;

- (id)initWithFrame:(CGRect)frame firstname:(NSString *)firstname attentionArray:(NSArray *)attentionArray;
@end

