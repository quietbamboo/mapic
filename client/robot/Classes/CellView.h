//
//  CellView.h
//  template
//
//  Created by apple on 12-7-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellView : UIView{

    UIImageView* imageView;
    UILabel *namelabel;
    UILabel *desclabel;
    UILabel *distancelabel;
}

@property (retain, nonatomic) UILabel *namelabel;
@property (retain, nonatomic) UILabel *desclabel;
@property (retain, nonatomic) UILabel *distancelabel;
@property (nonatomic, retain) UIImageView *imageView;
@end
