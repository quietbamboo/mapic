//
//  PraisePhotoView.h
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PraisephotoDelegate;
@interface PraisePhotoView : UIView{
    id <PraisephotoDelegate> delegate;
}
@property (nonatomic) id <PraisephotoDelegate> delegate;
@end
@protocol PraisephotoDelegate <NSObject>
- (void)praisephotoImage:(int)imagenum;
@end
