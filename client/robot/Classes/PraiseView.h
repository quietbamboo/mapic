//
//  PraiseView.h
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PraiseDelegate;
@interface PraiseView : UIView{
    id <PraiseDelegate> delegate;
}
@property (nonatomic) id <PraiseDelegate> delegate;

- (id)initWithFrame:(CGRect)frame firstname:(NSString *)firstname secondname:(NSString *)secondname headimage:(UIImage *)headimage;

@end

@protocol PraiseDelegate <NSObject>
- (void)praiseImage:(int)imagenum;
@end