//
//  OnTopView.h
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTweetLabel.h"
@protocol OntopDelegate;
@interface OnTopView : UIView<IFLabelDelegate>{
    id <OntopDelegate> delegate;
}
@property (nonatomic) id <OntopDelegate> delegate;
@end
@protocol OntopDelegate <NSObject>
- (void)ontopImage:(int)imagenum;
- (void)ontopmatch:(NSString *)match;
@end