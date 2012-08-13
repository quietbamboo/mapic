//
//  PictureImageview.h
//  template
//
//  Created by apple on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol pictureimageDelegate;
@interface PictureImageview : UIImageView{
    id <pictureimageDelegate> delegate;
}
@property (nonatomic) id <pictureimageDelegate> delegate;
@end

@protocol pictureimageDelegate <NSObject>
- (void) pictureevent:(NSInteger) imaagetag;
@end