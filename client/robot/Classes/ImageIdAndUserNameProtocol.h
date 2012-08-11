//
//  ImageIdAndUserNameProtocol.h
//  template
//
//  Created by yujie liu on 12-8-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
	AttentionViewtype,
    OnTopViewtype,
    PraiseViewtype,
    PraisePhotoViewtype,
    PhotoMessageViewtype,
    NewsMessageViewtype
} ViewType;

@protocol ImageIdAndUserNameProtocol <NSObject>
- (void) imageID :(NSString *)imageID UIViewType:(ViewType)UIViewType;
- (void) userName :(NSString *)userName UIViewType:(ViewType)UIViewType;

@end
