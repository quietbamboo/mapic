//
//  AttentionView.h
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTweetLabel.h"
@protocol AttentionDelegate;
@interface AttentionView : UIView<IFLabelDelegate>{
    id <AttentionDelegate> delegate;
}
@property (nonatomic) id <AttentionDelegate> delegate;

- (id)initWithFrame:(CGRect)frame firstname:(NSString *)firstname secondname:(NSString *)secondname;
@end

@protocol AttentionDelegate <NSObject>
- (void)attentionmatch:(NSString *)match;
@end