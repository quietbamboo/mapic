//
//  NewsMessageView.h
//  template
//
//  Created by 健峰 高 on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsMessageView : UIView{
    
    UIImageView* headimageView;
    UIImageView* footimageView;
    UILabel* footlabel;
}

@property (retain, nonatomic) UIImageView* headimageView;
@property (retain, nonatomic) UIImageView* footimageView;
@property (retain, nonatomic) UILabel* footlabel;
- (id)initWithFrame:(CGRect)frame headString:(NSString *)headString footString:(NSString *)footString;
@end
