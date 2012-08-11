//
//  PraisePhotoView.h
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTweetLabel.h"
@protocol PraisephotoDelegate;
@interface PraisePhotoView : UIView<IFLabelDelegate>{
    id <PraisephotoDelegate> delegate;
    NSMutableArray* imagmessageArray;
}
@property (nonatomic) id <PraisephotoDelegate> delegate;

- (id)initWithFrame:(CGRect)frame firstname:(NSString *)firstname imagecount:(int)imagecount imageArray:(NSMutableArray *)imageArray;
@end
@protocol PraisephotoDelegate <NSObject>
- (void)praisephotoImage:(NSString *)imgusername;
- (void)praisephotomatch:(NSString *)match;
@end
