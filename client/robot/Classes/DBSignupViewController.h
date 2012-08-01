//
//  DBSignupViewController.h
//  DBSignup
//
//  Created by Davide Bettio on 7/4/11.
//  Copyright 2011 03081340121. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "US2ValidatorUIDelegate.h"
#import "US2ValidatorUIProtocol.h"
#import "US2ValidatorTextField.h"
#import "TooltipView.h"
#import "FormTableViewCell.h"
@interface DBSignupViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate,US2ValidatorUIDelegate,UITextViewDelegate,FormTableViewCellDelegate> {
    UIView *contentView;
    US2ValidatorTextField *nameTextField_;
    US2ValidatorTextField *lastNameTextField_;
    US2ValidatorTextField *emailTextField_;
    US2ValidatorTextField *passwordTextField_;
    UITextField *birthdayTextField_;
    UITextField *genderTextField_;
    US2ValidatorTextField *phoneTextField_;
    UIButton *photoButton_;
    
    UILabel *emailLabel_;
    UILabel *passwordLabel_;
    UILabel *birthdayLabel_;
    UILabel *genderLabel_;
    UILabel *phoneLabel_;
    
    UIToolbar *keyboardToolbar_;
    UIPickerView *genderPickerView_;
    UIDatePicker *birthdayDatePicker_;
    
    NSDate *birthday_;
    NSString *gender_;
    UIImage *photo_;
    BOOL           _didSubmit;
    id <US2ValidatorUIProtocol> _tooltipConnectedTextUI;
    TooltipView    *_tooltipView;
}

@property(nonatomic, retain) UITextField *nameTextField;
@property(nonatomic, retain) UITextField *lastNameTextField;
@property(nonatomic, retain) UITextField *emailTextField;
@property(nonatomic, retain) UITextField *passwordTextField;
@property(nonatomic, retain) UITextField *birthdayTextField;
@property(nonatomic, retain) UITextField *genderTextField;
@property(nonatomic, retain) UITextField *phoneTextField;
@property(nonatomic, retain) UIButton *photoButton;
@property(nonatomic, retain) UITextView *termsTextView;

@property(nonatomic, retain) UILabel *emailLabel;
@property(nonatomic, retain) UILabel *passwordLabel;
@property(nonatomic, retain) UILabel *birthdayLabel;
@property(nonatomic, retain) UILabel *genderLabel;
@property(nonatomic, retain) UILabel *phoneLabel;

@property(nonatomic, retain) UIToolbar *keyboardToolbar;
@property(nonatomic, retain) UIPickerView *genderPickerView;
@property(nonatomic, retain) UIDatePicker *birthdayDatePicker;

@property(nonatomic, retain) NSDate *birthday;
@property(nonatomic, retain) NSString *gender;
@property(nonatomic, retain) UIImage *photo;

- (void)choosePhoto:(id)sender;

- (void)resignKeyboard:(id)sender;
- (void)previousField:(id)sender;
- (void)nextField:(id)sender;
- (id)getFirstResponder;
- (void)animateView:(NSUInteger)tag;
- (void)checkBarButton:(NSUInteger)tag;
- (void)checkSpecialFields:(NSUInteger)tag;
- (void)setBirthdayData;
- (void)setGenderData;
- (void)birthdayDatePickerChanged:(id)sender;
- (void)signup:(id)sender;
- (void)resetLabelsColors;

+ (UIColor *)labelNormalColor;
+ (UIColor *)labelSelectedColor;
@end
