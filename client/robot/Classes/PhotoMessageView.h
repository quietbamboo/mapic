//
//  PhotoMessageView.h
//  template
//
//  Created by yujie liu on 12-8-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoMessageView : UIView{

    UIImageView* headimageView;
    UILabel* footlabel;
}

@property (retain, nonatomic) UIImageView* headimageView;
@property (retain, nonatomic) UILabel* footlabel;

- (id)initWithFrame:(CGRect)frame headString:(NSString *)headString footString:(NSString *)footString;
@end
