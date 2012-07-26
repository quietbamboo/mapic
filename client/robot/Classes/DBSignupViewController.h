//
//  DBSignupViewController.h
//  DBSignup
//
//  Created by Davide Bettio on 7/4/11.
//  Copyright 2011 03081340121. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface DBSignupViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    UIView *contentView;
    UITextField *nameTextField_;
    UITextField *lastNameTextField_;
    UITextField *emailTextField_;
    UITextField *passwordTextField_;
    UITextField *birthdayTextField_;
    UITextField *genderTextField_;
    UITextField *phoneTextField_;
    UIButton *photoButton_;
    UITextView *termsTextView_;
    
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
