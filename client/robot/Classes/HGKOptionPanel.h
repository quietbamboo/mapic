//
//  HGKOptionPanel.h
//  iNVASIVE
//
//  Created by Jon Arrien Fernández on 18/08/11.
//  Copyright 2011 Hegaka. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDefaultMargin 10


@interface HGKOptionPanel : UIView {
    
    UIButton *btnShowHide;
    Boolean isExpanded;
    
}

@property (nonatomic, retain) UIButton *btnShowHide;
@property  Boolean isExpanded;
-(void) controlPanelShowHide:(id)sender;


@end
