//
//  OnTopView.h
//  template
//
//  Created by apple on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol OntopDelegate;
@interface OnTopView : UIView{
    id <OntopDelegate> delegate;
}
@property (nonatomic) id <OntopDelegate> delegate;
@end
@protocol OntopDelegate <NSObject>
- (void)ontopImage:(int)imagenum;
@end