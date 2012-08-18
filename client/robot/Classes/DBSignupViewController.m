//
//  DBSignupViewController.m
//  DBSignup
//
//  Created by Davide Bettio on 7/4/11.
//  Copyright 2011 03081340121. All rights reserved.
//

#import "DBSignupViewController.h"
#import "MyProjectValidatorName.h"
#import "ValidTooltipView.h"
#import "FormTableViewCell.h"
#import "US2ValidatorEmail.h"
#import "FormTextFieldTableViewCell.h"
#import "FormTextViewTableViewCell.h"
#import "InvalidTooltipView.h"
#import "US2ValidatorNumeric.h"
#import "US2ValidatorPasswordStrength.h"
// Safe releases
#define RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

#define FIELDS_COUNT            7
#define BIRTHDAY_FIELD_TAG      5
#define GENDER_FIELD_TAG        6

@implementation DBSignupViewController

@synthesize nameTextField = nameTextField_;
@synthesize lastNameTextField = lastNameTextField_;
@synthesize emailTextField = emailTextField_;
@synthesize passwordTextField = passwordTextField_;
@synthesize birthdayTextField = birthdayTextField_;
@synthesize genderTextField = genderTextField_;
@synthesize phoneTextField = phoneTextField_;
@synthesize photoButton = photoButton_;
@synthesize termsTextView = termsTextView_;

@synthesize emailLabel = emailLabel_;
@synthesize passwordLabel = passwordLabel_;
@synthesize birthdayLabel = birthdayLabel_;
@synthesize genderLabel = genderLabel_;
@synthesize phoneLabel = phoneLabel_;

@synthesize keyboardToolbar = keyboardToolbar_;
@synthesize genderPickerView = genderPickerView_;
@synthesize birthdayDatePicker = birthdayDatePicker_;

@synthesize birthday = birthday_;
@synthesize gender = gender_;
@synthesize photo = photo_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
//    RELEASE_SAFELY(nameTextField_);
//    RELEASE_SAFELY(lastNameTextField_);
//    RELEASE_SAFELY(emailTextField_);
//    RELEASE_SAFELY(passwordTextField_);
//    RELEASE_SAFELY(birthdayTextField_);
//    RELEASE_SAFELY(genderTextField_);
//    RELEASE_SAFELY(phoneTextField_);
//    RELEASE_SAFELY(photoButton_);
//    RELEASE_SAFELY(termsTextView_);
//    
//    RELEASE_SAFELY(emailLabel_);
//    RELEASE_SAFELY(passwordLabel_);
//    RELEASE_SAFELY(birthdayLabel_);
//    RELEASE_SAFELY(genderLabel_);
//    RELEASE_SAFELY(phoneLabel_);
//    
//    RELEASE_SAFELY(keyboardToolbar_);
//    RELEASE_SAFELY(birthdayDatePicker_);
//    RELEASE_SAFELY(genderPickerView_);
//    
//    RELEASE_SAFELY(birthday_);
//    RELEASE_SAFELY(gender_);
//    RELEASE_SAFELY(photo_);
//    
//    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */
- (void) loadView {
    
    contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    
    _textUICollection = [[NSMutableArray alloc] init];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 301, 325)];
    imageView.image = [UIImage imageNamed:@"background.png"];
    [contentView addSubview:imageView];
    
    photoButton_ = [UIButton buttonWithType:UIButtonTypeCustom];
    photoButton_.frame = CGRectMake(10, 10, 86, 86);
    [photoButton_ addTarget:self action:@selector(choosePhoto:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:photoButton_];
    
    nameTextField_  = [[US2ValidatorTextField alloc] init];
    nameTextField_.validator               = [[MyProjectValidatorName alloc] init];
    
    nameTextField_.shouldAllowViolation    = YES;
    nameTextField_.validateOnFocusLossOnly = YES;
    nameTextField_.text                    = @"";
    nameTextField_.placeholder             = @"name";
    nameTextField_.validatorUIDelegate     = self;
    nameTextField_.tag = 1;
    [_textUICollection addObject:nameTextField_];
    id <US2ValidatorUIProtocol> textUIname = nameTextField_;
    FormTableViewCell *cellname = [[FormTextFieldTableViewCell alloc] initWithFrame:CGRectMake(120, 18, 185, 30)];
    cellname.delegate = self;
    cellname.textUI = textUIname;
    [contentView addSubview:cellname];    
    
    lastNameTextField_  = [[US2ValidatorTextField alloc] init];
    lastNameTextField_.validator               = [[MyProjectValidatorName alloc] init];
    lastNameTextField_.shouldAllowViolation    = YES;
    lastNameTextField_.validateOnFocusLossOnly = YES;
    lastNameTextField_.text                    = @"";
    lastNameTextField_.placeholder             = @"lastName";
    lastNameTextField_.validatorUIDelegate     = self;
    lastNameTextField_.tag = 2;
    [_textUICollection addObject:lastNameTextField_];
    id <US2ValidatorUIProtocol> textUIlast = lastNameTextField_;
    FormTableViewCell *celllast = [[FormTextFieldTableViewCell alloc] initWithFrame:CGRectMake(120, 61, 185, 31)];
    celllast.delegate = self;
    celllast.textUI = textUIlast;
    [contentView addSubview:celllast];
    
    emailTextField_  = [[US2ValidatorTextField alloc] init];
    emailTextField_.validator               = [[US2ValidatorEmail alloc] init];
    emailTextField_.shouldAllowViolation    = YES;
    emailTextField_.validateOnFocusLossOnly = YES;
    emailTextField_.text                    = @"";
    emailTextField_.placeholder             = @"example@example.com";
    emailTextField_.validatorUIDelegate     = self;
    emailTextField_.tag = 3;
    [_textUICollection addObject:emailTextField_];
    id <US2ValidatorUIProtocol> textUIemail = emailTextField_;
    FormTableViewCell *cellemail = [[FormTextFieldTableViewCell alloc] initWithFrame:CGRectMake(117, 122, 189, 31)];
    cellemail.delegate = self;
    cellemail.textUI = textUIemail;
    [contentView addSubview:cellemail];
    
    passwordTextField_ = [[US2ValidatorTextField alloc] init];
    passwordTextField_.validator               = [[US2ValidatorPasswordStrength  alloc] init];
    passwordTextField_.shouldAllowViolation    = YES;
    passwordTextField_.validateOnFocusLossOnly = YES;
    passwordTextField_.text                    = @"";
    passwordTextField_.placeholder             = @"password";
    passwordTextField_.validatorUIDelegate     = self;
    passwordTextField_.secureTextEntry = YES;
    passwordTextField_.tag = 4;
    [_textUICollection addObject:passwordTextField_];
    id <US2ValidatorUIProtocol> textUIpass = passwordTextField_;
    FormTableViewCell *cellpass = [[FormTextFieldTableViewCell alloc] initWithFrame:CGRectMake(117, 166, 189, 31)];
    cellpass.delegate = self;
    cellpass.textUI = textUIpass;
    [contentView addSubview:cellpass];
    
    birthdayTextField_ = [[UITextField alloc] initWithFrame:CGRectMake(117, 215, 189, 31)];
    birthdayTextField_.delegate = self;
    birthdayTextField_.placeholder = @"birthday";
    birthdayTextField_.textAlignment = UITextAlignmentLeft;
    birthdayTextField_.font = [UIFont boldSystemFontOfSize:15];
    birthdayTextField_.tag = 5;
    [_textUICollection addObject:birthdayTextField_];
    [contentView addSubview:birthdayTextField_];
    
    
    genderTextField_ = [[UITextField alloc] initWithFrame:CGRectMake(117, 260, 189, 31)];
    genderTextField_.delegate = self;
    genderTextField_.placeholder = @"gender";
    genderTextField_.textAlignment = UITextAlignmentLeft;
    genderTextField_.font = [UIFont boldSystemFontOfSize:15];
    genderTextField_.tag = 6;
    [_textUICollection addObject:genderTextField_];
    [contentView addSubview:genderTextField_];
    
    phoneTextField_ = [[US2ValidatorTextField alloc] init];
    phoneTextField_.validator               = [[US2ValidatorNumeric alloc] init];
    phoneTextField_.shouldAllowViolation    = YES;
    phoneTextField_.validateOnFocusLossOnly = YES;
    phoneTextField_.text                    = @"";
    phoneTextField_.placeholder             = @"phone";
    phoneTextField_.validatorUIDelegate     = self;
    phoneTextField_.tag = 7;
    phoneTextField_.keyboardType = UIKeyboardTypePhonePad;
    [_textUICollection addObject:phoneTextField_];
    id <US2ValidatorUIProtocol> textUIphone = phoneTextField_;
    FormTableViewCell *cellphone = [[FormTextFieldTableViewCell alloc] initWithFrame:CGRectMake(117, 297, 189, 31)];
    cellphone.delegate = self;
    cellphone.textUI = textUIphone;
    [contentView addSubview:cellphone];
    
    emailLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(20, 127, 89, 21)];
    emailLabel_.text = @"EMAIL";
    emailLabel_.textAlignment = UITextAlignmentLeft;
    emailLabel_.font = [UIFont boldSystemFontOfSize:13];
    emailLabel_.backgroundColor = [UIColor clearColor];
    emailLabel_.tag = 13;
    [contentView addSubview:emailLabel_];
    
    passwordLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(20, 171, 89, 21)];
    passwordLabel_.text = @"PASSWORD";
    passwordLabel_.textAlignment = UITextAlignmentLeft;
    passwordLabel_.font = [UIFont boldSystemFontOfSize:13];
    passwordLabel_.backgroundColor = [UIColor clearColor];
    passwordLabel_.tag = 14;
    [contentView addSubview:passwordLabel_];
    
    birthdayLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(20, 215, 89, 21)];
    birthdayLabel_.text = @"BIRTHDAY";
    birthdayLabel_.textAlignment = UITextAlignmentLeft;
    birthdayLabel_.font = [UIFont boldSystemFontOfSize:13];
    birthdayLabel_.backgroundColor = [UIColor clearColor];
    birthdayLabel_.tag = 15;
    [contentView addSubview:birthdayLabel_];
    
    genderLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(20, 259, 89, 21)];
    genderLabel_.text = @"GENDER";
    genderLabel_.textAlignment = UITextAlignmentLeft;
    genderLabel_.font = [UIFont boldSystemFontOfSize:13];
    genderLabel_.backgroundColor = [UIColor clearColor];
    genderLabel_.tag = 16;
    [contentView addSubview:genderLabel_];
    
    phoneLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(20, 302, 89, 21)];
    phoneLabel_.text = @"PHONE";
    phoneLabel_.textAlignment = UITextAlignmentLeft;
    phoneLabel_.font = [UIFont boldSystemFontOfSize:13];
    phoneLabel_.backgroundColor = [UIColor clearColor];
    phoneLabel_.tag = 17;
    [contentView addSubview:phoneLabel_];
    
    _didSubmit = NO;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Signup button
    UIBarButtonItem *signupBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"signup", @"") style:UIBarButtonItemStyleBordered target:self action:@selector(submitButtonTouched)];
    self.navigationItem.rightBarButtonItem = signupBarItem;
   // [signupBarItem release];
    
    // Birthday date picker
    if (self.birthdayDatePicker == nil) {
        self.birthdayDatePicker = [[UIDatePicker alloc] init];
        [self.birthdayDatePicker addTarget:self action:@selector(birthdayDatePickerChanged:) forControlEvents:UIControlEventValueChanged];
        self.birthdayDatePicker.datePickerMode = UIDatePickerModeDate;
        NSDate *currentDate = [NSDate date];
        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
        [dateComponents setYear:-18];
        NSDate *selectedDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:currentDate  options:0];
      //  [dateComponents release];
        [self.birthdayDatePicker setDate:selectedDate animated:NO];
        [self.birthdayDatePicker setMaximumDate:currentDate];
    }
    
    // Gender picker
    if (self.genderPickerView == nil) {
        self.genderPickerView = [[UIPickerView alloc] init];
        self.genderPickerView.delegate = self;
        self.genderPickerView.showsSelectionIndicator = YES;
    }
    
    // Keyboard toolbar
    if (self.keyboardToolbar == nil) {
        self.keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 38.0f)];
        self.keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
        
        UIBarButtonItem *previousBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"previous", @"")
                                                                            style:UIBarButtonItemStyleBordered
                                                                           target:self
                                                                           action:@selector(previousField:)];
        
        UIBarButtonItem *nextBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"next", @"")
                                                                        style:UIBarButtonItemStyleBordered
                                                                       target:self
                                                                       action:@selector(nextField:)];
        
        UIBarButtonItem *spaceBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                      target:nil
                                                                                      action:nil];
        
        UIBarButtonItem *doneBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"done", @"")
                                                                        style:UIBarButtonItemStyleDone
                                                                       target:self
                                                                       action:@selector(resignKeyboard:)];
        
        [self.keyboardToolbar setItems:[NSArray arrayWithObjects:previousBarItem, nextBarItem, spaceBarItem, doneBarItem, nil]];
        
        self.nameTextField.inputAccessoryView = self.keyboardToolbar;
        self.lastNameTextField.inputAccessoryView = self.keyboardToolbar;
        self.emailTextField.inputAccessoryView = self.keyboardToolbar;
        self.passwordTextField.inputAccessoryView = self.keyboardToolbar;
        self.birthdayTextField.inputAccessoryView = self.keyboardToolbar;
        self.birthdayTextField.inputView = self.birthdayDatePicker;
        self.genderTextField.inputAccessoryView = self.keyboardToolbar;
        self.genderTextField.inputView = self.genderPickerView;
        self.phoneTextField.inputAccessoryView = self.keyboardToolbar;
        
//        [previousBarItem release];
//        [nextBarItem release];
//        [spaceBarItem release];
//        [doneBarItem release];
    }
    
    // Set localization
//    self.nameTextField.placeholder = NSLocalizedString(@"first_name", @"");
//    self.lastNameTextField.placeholder = NSLocalizedString(@"last_name", @"");
//    self.emailLabel.text = [NSLocalizedString(@"email", @"") uppercaseString]; 
//    self.passwordLabel.text = [NSLocalizedString(@"password", @"") uppercaseString];
//    self.birthdayLabel.text = [NSLocalizedString(@"birthdate", @"") uppercaseString]; 
//    self.genderLabel.text = [NSLocalizedString(@"gender", @"") uppercaseString]; 
//    self.phoneLabel.text = [NSLocalizedString(@"phone", @"") uppercaseString];
//    self.phoneTextField.placeholder = NSLocalizedString(@"optional", @"");
//    self.termsTextView.text = NSLocalizedString(@"terms", @"");
    
    // Reset labels colors
    [self resetLabelsColors];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - IBActions

- (void)choosePhoto:(id)sender
{
    UIActionSheet *choosePhotoActionSheet;
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        choosePhotoActionSheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"choose_photo", @"")
                                                             delegate:self 
                                                    cancelButtonTitle:NSLocalizedString(@"cancel", @"") 
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:NSLocalizedString(@"take_photo_from_camera", @""), NSLocalizedString(@"take_photo_from_library", @""), nil];
    } else {
        choosePhotoActionSheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"choose_photo", @"")
                                                             delegate:self 
                                                    cancelButtonTitle:NSLocalizedString(@"cancel", @"") 
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:NSLocalizedString(@"take_photo_from_library", @""), nil];
    }
    [choosePhotoActionSheet showInView:self.view];
   // [choosePhotoActionSheet release];
}


#pragma mark - Others

- (void)signup:(id)sender
{
    [self resignKeyboard:nil];
    // Check fields
    
    // Make request
}

- (void)resignKeyboard:(id)sender
{
    id firstResponder = [self getFirstResponder];
    if ([firstResponder isKindOfClass:[UITextField class]]) {
        [firstResponder resignFirstResponder];
        [self animateView:1];
        [self resetLabelsColors];
    }
}

- (void)previousField:(id)sender
{
    id firstResponder = [self getFirstResponder];
    if ([firstResponder isKindOfClass:[UITextField class]]) {
        NSUInteger tag = [firstResponder tag];
        NSUInteger previousTag = tag == 1 ? 1 : tag - 1;
        [self checkBarButton:previousTag];
        [self animateView:previousTag];
        UITextField *previousField = (UITextField *)[self.view viewWithTag:previousTag];
        [previousField becomeFirstResponder];
        UILabel *nextLabel = (UILabel *)[self.view viewWithTag:previousTag + 10];
        if (nextLabel) {
            [self resetLabelsColors];
            [nextLabel setTextColor:[DBSignupViewController labelSelectedColor]];
        }
        [self checkSpecialFields:previousTag];
    }
}

- (void)nextField:(id)sender
{
    id firstResponder = [self getFirstResponder];
    if ([firstResponder isKindOfClass:[UITextField class]]) {
        NSUInteger tag = [firstResponder tag];
        NSUInteger nextTag = tag == FIELDS_COUNT ? FIELDS_COUNT : tag + 1;
        [self checkBarButton:nextTag];
        [self animateView:nextTag];
        UITextField *nextField = (UITextField *)[self.view viewWithTag:nextTag];
        [nextField becomeFirstResponder];
        UILabel *nextLabel = (UILabel *)[self.view viewWithTag:nextTag + 10];
        if (nextLabel) {
            [self resetLabelsColors];
            [nextLabel setTextColor:[DBSignupViewController labelSelectedColor]];
        }
        [self checkSpecialFields:nextTag];
    }
}

- (id)getFirstResponder
{
    NSUInteger index = 0;
    while (index <= FIELDS_COUNT) {
        UITextField *textField = (UITextField *)[self.view viewWithTag:index];
        if ([textField isFirstResponder]) {
            return textField;
        }
        index++;
    }
    
    return nil;
}

- (void)animateView:(NSUInteger)tag
{
    CGRect rect = self.view.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    switch (tag) {
        case 3:
            rect.origin.y = -24.0f;
            break;
        case 4:
            rect.origin.y = -70.0f;
            break;
        case 5:
            rect.origin.y = -110.0f;
            break;
        case 6:
            rect.origin.y = -155.0f;
            break;
        case 7:
            rect.origin.y = -180.0f;
            break;
        case 8:
            rect.origin.y = -200.0f;
            break;
        default:
            rect.origin.y = 0.0f;
            break;
    }
    self.view.frame = rect;
    [UIView commitAnimations];
}

- (void)checkBarButton:(NSUInteger)tag
{
    UIBarButtonItem *previousBarItem = (UIBarButtonItem *)[[self.keyboardToolbar items] objectAtIndex:0];
    UIBarButtonItem *nextBarItem = (UIBarButtonItem *)[[self.keyboardToolbar items] objectAtIndex:1];
    
    [previousBarItem setEnabled:tag == 1 ? NO : YES];
    [nextBarItem setEnabled:tag == FIELDS_COUNT ? NO : YES];
}

- (void)checkSpecialFields:(NSUInteger)tag
{
    if (tag == BIRTHDAY_FIELD_TAG && [self.birthdayTextField.text isEqualToString:@""]) {
        [self setBirthdayData];
    } else if (tag == GENDER_FIELD_TAG && [self.genderTextField.text isEqualToString:@""]) {
        [self setGenderData];
    }
}

- (void)setBirthdayData
{
    self.birthday = self.birthdayDatePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    self.birthdayTextField.text = [dateFormatter stringFromDate:self.birthday];
   // [dateFormatter release];
}

- (void)setGenderData
{
    if ([self.genderPickerView selectedRowInComponent:0] == 0) {
        self.genderTextField.text = NSLocalizedString(@"male", @"");
        self.gender = @"M";
    } else {
        self.genderTextField.text = NSLocalizedString(@"female", @"");
        self.gender = @"F";
    }
}

- (void)birthdayDatePickerChanged:(id)sender
{
    [self setBirthdayData];
}

- (void)resetLabelsColors
{
    self.emailLabel.textColor = [DBSignupViewController labelNormalColor];
    self.passwordLabel.textColor = [DBSignupViewController labelNormalColor];
    self.birthdayLabel.textColor = [DBSignupViewController labelNormalColor];
    self.genderLabel.textColor = [DBSignupViewController labelNormalColor];
    self.phoneLabel.textColor = [DBSignupViewController labelNormalColor];
}

+ (UIColor *)labelNormalColor
{
    return [UIColor colorWithRed:0.016 green:0.216 blue:0.286 alpha:1.000];
}

+ (UIColor *)labelSelectedColor
{
    return [UIColor colorWithRed:0.114 green:0.600 blue:0.737 alpha:1.000];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSUInteger tag = [textField tag];
    [self animateView:tag];
    [self checkBarButton:tag];
    [self checkSpecialFields:tag];
    UILabel *label = (UILabel *)[self.view viewWithTag:tag + 10];
    if (label) {
        [self resetLabelsColors];
        [label setTextColor:[DBSignupViewController labelSelectedColor]];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger tag = [textField tag];
    if (tag == BIRTHDAY_FIELD_TAG || tag == GENDER_FIELD_TAG) {
        return NO;
    }
    
    return YES;
}


#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 2;
}


#pragma mark - UIPickerViewDelegate

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIImage *image = row == 0 ? [UIImage imageNamed:@"male.png"] : [UIImage imageNamed:@"female.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];        
    imageView.frame = CGRectMake(0, 0, 32, 32);
    
    UILabel *genderLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 100, 32)];
    genderLabel.text = [row == 0 ? NSLocalizedString(@"male", @"") : NSLocalizedString(@"female", @"") uppercaseString];
    genderLabel.textAlignment = UITextAlignmentLeft;
    genderLabel.backgroundColor = [UIColor clearColor];
    
    UIView *rowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 32)];
    [rowView insertSubview:imageView atIndex:0];
    [rowView insertSubview:genderLabel atIndex:1];
    
    //[imageView release];
    //[genderLabel release];
    
    return rowView;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self setGenderData];
}

#pragma mark - Validator text field protocol

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    // Hide tooltip 
    if (nil != _tooltipView
        && ![_tooltipConnectedTextUI isEqual:textField])
    {
        [_tooltipView removeFromSuperview];
        _tooltipView = nil;
    }
    
    _tooltipConnectedTextUI = nil;
    
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    // Hide tooltip 
    if (nil != _tooltipView
        && ![_tooltipConnectedTextUI isEqual:textView])
    {
        [_tooltipView removeFromSuperview];
        _tooltipView = nil;
    }
    
    _tooltipConnectedTextUI = nil;
    
    return YES;
}




/**
 Called for every valid or violated state change
 React to this information by showing up warnings or disabling a 'send' button e.g.
 */
- (void)validatorUI:(id <US2ValidatorUIProtocol>)validatorUI changedValidState:(BOOL)isValid
{
    
    // 1st super view UITableViewCellContentView
    // 2nd super view FormTextFieldTableViewCell
    id cell = ((UIView *)validatorUI).superview;
    if ([cell isKindOfClass:[FormTableViewCell class]])
    {
        FormTableViewCell *formTableViewCell = (FormTableViewCell *)cell;
        kFormTableViewCellStatus status = isValid == YES ? kFormTableViewCellStatusValid : kFormTableViewCellStatusInvalid;
        status = validatorUI.text.length == 0 ? kFormTableViewCellStatusWaiting : status;
        [formTableViewCell updateValidationIconByValidStatus:status];
    }
    
    // Hide tooltip 
    if (isValid)
    {
        [self dismissTooltip];
    }
}

/**
 Called on every violation of the highest prioritised validator condition.
 Update UI like showing alert messages or disabling buttons.
 */
- (void)validatorUI:(id <US2ValidatorUIProtocol>)validatorUI violatedConditions:(US2ConditionCollection *)conditions
{
    
}

/**
 Update violation status of text field after ending editing
 */
- (void)textFieldDidEndEditing:(US2ValidatorTextField *)validatorTextField
{
    id cell = validatorTextField.superview.superview;
    if ([cell isKindOfClass:[FormTextFieldTableViewCell class]])
    {
        FormTextFieldTableViewCell *formTextFieldTableViewCell = (FormTextFieldTableViewCell *)cell;
        kFormTableViewCellStatus status = validatorTextField.isValid == YES ? kFormTableViewCellStatusValid : kFormTableViewCellStatusInvalid;
        
        if (_didSubmit == NO)
        {
            status = validatorTextField.text.length == 0 ? kFormTableViewCellStatusWaiting : status;
        }
        
        [formTextFieldTableViewCell updateValidationIconByValidStatus:status];
    }
}

/**
 Update violation status of text view after ending editing
 */
- (void)textViewDidEndEditing:(US2ValidatorTextView *)validatorTextView
{
    id cell = validatorTextView.superview.superview;
    if ([cell isKindOfClass:[FormTableViewCell class]])
    {
        FormTableViewCell *formTableViewCell = (FormTableViewCell *)cell;
        kFormTableViewCellStatus status = validatorTextView.isValid == YES ? kFormTableViewCellStatusValid : kFormTableViewCellStatusInvalid;
        
        // If form was submitted once the waiting status is obsolete,
        // the user knows that the text UI is invalid or valid, so
        // the text UI is not 'waiting' for input, because submit button
        // was the 'input'
        if (_didSubmit == NO)
        {
            status = validatorTextView.text.length == 0 ? kFormTableViewCellStatusWaiting : status;
        }
        
        [formTableViewCell updateValidationIconByValidStatus:status];
    }
}


#pragma mark - Form table view cell delegate

- (void)formTableViewCell:(FormTableViewCell *)cell touchedIconButton:(UIButton *)button aligningTextUI:(id <US2ValidatorUIProtocol>)textUI
{
    // Show tooltip if status changed to invalid
    // Hide tooltip if status changed to valid
    if (nil != _tooltipView)
    {
        [_tooltipView removeFromSuperview];
        _tooltipView = nil;
    }
    
    // Do not show tooltip again, because it was toggled off
    if ([_tooltipConnectedTextUI isEqual:textUI])
    {
        _tooltipConnectedTextUI = nil;
        
        return;
    }
    
    // Determine point where to add the tooltip
    CGPoint point = [button convertPoint:CGPointMake(0.0, button.frame.size.height - 4.0) toView:contentView];
    
    // Create tooltip
    // Set text to tooltip
    US2Validator *validator = [textUI validator];
    US2ConditionCollection *conditionCollection = [validator checkConditions:[textUI text]];
    CGRect tooltipViewFrame = CGRectMake(6.0, point.y, 309.0, _tooltipView.frame.size.height);
    if (nil == conditionCollection)
    {
        _tooltipView       = [[ValidTooltipView alloc] init];
        _tooltipView.frame = tooltipViewFrame;
        
        _tooltipView.text = @"Everything is okay.";
    }
    else
    {
        _tooltipView       = [[InvalidTooltipView alloc] init];
        _tooltipView.frame = tooltipViewFrame;
        
        // Get first violation
        US2Condition *violatedCondition = [conditionCollection conditionAtIndex:0];
        _tooltipView.text = [violatedCondition localizedViolationString];
    }
    [contentView addSubview:_tooltipView];
    
    // Remember text UI to which the tooltip was connected
    _tooltipConnectedTextUI = textUI;
}

- (void)dismissTooltip
{
    if (nil != _tooltipView)
    {
        [_tooltipView removeFromSuperview];
        _tooltipView = nil;
    }
    
    _tooltipConnectedTextUI = nil;
}

#pragma mark - Submit button

- (void)submitButtonTouched
{
    // Set flag to YES
    _didSubmit = YES;
    
    // Create string which will contain the first error in form
    NSMutableString *errorString = [NSMutableString string];
    
    // Validate every text UI in custom text UI collection
    for (NSUInteger i = 0; i < _textUICollection.count; i++)
    {
        id <US2ValidatorUIProtocol> textUItext = [_textUICollection objectAtIndex:i];
        id cell = ((UIView *)textUItext).superview;
        if ([cell isKindOfClass:[FormTableViewCell class]])
        {
            FormTableViewCell *formTableViewCell = (FormTextFieldTableViewCell *)cell;
            kFormTableViewCellStatus status = textUItext.isValid == YES ? kFormTableViewCellStatusValid : kFormTableViewCellStatusInvalid;
            [formTableViewCell updateValidationIconByValidStatus:status];
            
            // If the text UI has invalid text remember the violated condition with highest priority
            if (textUItext.isValid == NO
                && errorString.length == 0)
            {
                US2Validator *validator = [textUItext validator];
                US2ConditionCollection *conditionCollection = [validator checkConditions:[textUItext text]];
                US2Condition *violatedCondition = [conditionCollection conditionAtIndex:0];
                
                NSMutableString *violatedString = [NSMutableString string];
                [violatedString appendString:@"Error"];//formTableViewCell.textLabel.text];
                [violatedString appendString:@": "];
                [violatedString appendString:[violatedCondition localizedViolationString]];
                [errorString appendString:violatedString];
            }
        }
    }
    
    // Show alert if there was an invalid text in UI
    if (errorString.length > 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Invalid Text"
                                                            message:errorString
                                                           delegate:self
                                                  cancelButtonTitle:@"Continue"
                                                  otherButtonTitles:nil, nil];
        alertView.tag = 1;
        [alertView show];
    }else {
        NSLog(@"this is name : %@",nameTextField_.text);
        NSLog(@"this is lastname : %@",lastNameTextField_.text);
        NSLog(@"this is email : %@",emailTextField_.text);
        NSLog(@"this is password : %@ ",passwordTextField_.text);
        NSLog(@"this is birthday : %@",birthdayTextField_.text);
        NSLog(@"this is gender : %@",genderTextField_.text);
        NSLog(@"this is phone : %@",phoneTextField_.text);
        //[self.navigationController popViewControllerAnimated:YES];
        [self signupRequest];
    }
}
#pragma mark - ASIHTTPRequestDelegate

- (void)signupRequest
{
    NSURL *url = [NSURL URLWithString:@"http://allseeing-i.com"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDelegate:self];
    [request setRequestMethod:@"POST"];
    [request setPostValue:nameTextField_.text forKey:@"name"];
    [request setPostValue:lastNameTextField_.text forKey:@"lastname"];
    [request setPostValue:emailTextField_.text forKey:@"email"];
    [request setPostValue:passwordTextField_.text forKey:@"password"];
    [request setPostValue:birthdayTextField_.text forKey:@"birthday"];
    [request setPostValue:genderTextField_.text forKey:@"gender"];
    [request setPostValue:phoneTextField_.text forKey:@"phone"];
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    UIAlertView* successAlert = [[UIAlertView alloc] initWithTitle:@"error" 
                                                           message:@"注册成功！"
                                                          delegate:self 
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles: nil];
    successAlert.tag = 0;
    [successAlert show];
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:@"error" 
                                                         message:@"注册失败！"
                                                        delegate:self 
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles: nil];
    [errorAlert show];
}
#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0 && alertView.tag == 0 ) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSUInteger sourceType = 0;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        switch (buttonIndex) {
            case 0:
                sourceType = UIImagePickerControllerSourceTypeCamera;
                break;
            case 1:
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                break;
            case 2:
                return;
        }
    } else {
        if (buttonIndex == 1) {
            return;
        } else {
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
    }
    
	UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
	imagePickerController.delegate = self;
	imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = sourceType;
	[self presentModalViewController:imagePickerController animated:YES];
     [AppDelegate getAppDelegate].centerButton.hidden = YES;
}


#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
	[picker dismissModalViewControllerAnimated:YES];
	self.photo = [info objectForKey:UIImagePickerControllerEditedImage];
	[self.photoButton setImage:self.photo forState:UIControlStateNormal];
     [AppDelegate getAppDelegate].centerButton.hidden = NO;
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[picker dismissModalViewControllerAnimated:YES];
     [AppDelegate getAppDelegate].centerButton.hidden = NO;
}

@end
