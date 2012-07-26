//
//  DBSignupViewController.m
//  DBSignup
//
//  Created by Davide Bettio on 7/4/11.
//  Copyright 2011 03081340121. All rights reserved.
//

#import "DBSignupViewController.h"

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
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 301, 325)];
    imageView.image = [UIImage imageNamed:@"background.png"];
    [contentView addSubview:imageView];
    
    photoButton_ = [UIButton buttonWithType:UIButtonTypeCustom];
    photoButton_.frame = CGRectMake(10, 10, 86, 86);
    //[resetButton setTitle:@"重置" forState:UIControlStateNormal];
    //[resetButton setImage:[UIImage imageNamed:@"reset.png"] forState:UIControlStateNormal];
    [photoButton_ addTarget:self action:@selector(choosePhoto:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:photoButton_];
    
    nameTextField_ = [[UITextField alloc] initWithFrame:CGRectMake(116, 18, 185, 31)];
    nameTextField_.delegate = self;
    nameTextField_.placeholder = @"Name";
    nameTextField_.textAlignment = UITextAlignmentLeft;
    nameTextField_.font = [UIFont boldSystemFontOfSize:15];
    nameTextField_.tag = 1;
    [contentView addSubview:nameTextField_];
    
    lastNameTextField_ = [[UITextField alloc] initWithFrame:CGRectMake(116, 61, 185, 31)];
    lastNameTextField_.delegate = self;
    lastNameTextField_.placeholder = @"Last Name";
    lastNameTextField_.textAlignment = UITextAlignmentLeft;
    lastNameTextField_.font = [UIFont boldSystemFontOfSize:15];
    lastNameTextField_.tag = 2;
    [contentView addSubview:lastNameTextField_];
    
    emailTextField_ = [[UITextField alloc] initWithFrame:CGRectMake(117, 122, 189, 31)];
    emailTextField_.delegate = self;
    emailTextField_.placeholder = @"";
    emailTextField_.textAlignment = UITextAlignmentLeft;
    emailTextField_.font = [UIFont boldSystemFontOfSize:15];
    emailTextField_.keyboardType = UIKeyboardTypeEmailAddress;
    emailTextField_.tag = 3;
    [contentView addSubview:emailTextField_];
    
    passwordTextField_ = [[UITextField alloc] initWithFrame:CGRectMake(117, 166, 189, 31)];
    passwordTextField_.placeholder = @"";
    passwordTextField_.textAlignment = UITextAlignmentLeft;
    passwordTextField_.font = [UIFont boldSystemFontOfSize:15];
    passwordTextField_.delegate = self;
    passwordTextField_.tag = 4;
    [contentView addSubview:passwordTextField_];
    
    birthdayTextField_ = [[UITextField alloc] initWithFrame:CGRectMake(117, 210, 189, 31)];
    birthdayTextField_.delegate = self;
    birthdayTextField_.placeholder = @"";
    birthdayTextField_.textAlignment = UITextAlignmentLeft;
    birthdayTextField_.font = [UIFont boldSystemFontOfSize:15];
    birthdayTextField_.tag = 5;
    [contentView addSubview:birthdayTextField_];
    
    genderTextField_ = [[UITextField alloc] initWithFrame:CGRectMake(117, 254, 189, 31)];
    genderTextField_.delegate = self;
    genderTextField_.placeholder = @"";
    genderTextField_.textAlignment = UITextAlignmentLeft;
    genderTextField_.font = [UIFont boldSystemFontOfSize:15];
    genderTextField_.tag = 6;
    [contentView addSubview:genderTextField_];
    
    phoneTextField_ = [[UITextField alloc] initWithFrame:CGRectMake(117, 297, 189, 31)];
    phoneTextField_.delegate = self;
    phoneTextField_.placeholder = @"";
    phoneTextField_.textAlignment = UITextAlignmentLeft;
    phoneTextField_.font = [UIFont boldSystemFontOfSize:15];
    phoneTextField_.tag = 7;
    phoneTextField_.keyboardType = UIKeyboardTypePhonePad;
    [contentView addSubview:phoneTextField_];
    
    emailLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(20, 127, 89, 21)];
    emailLabel_.text = @"EMAIL";
    emailLabel_.textAlignment = UITextAlignmentLeft;
    emailLabel_.font = [UIFont boldSystemFontOfSize:13];
    emailLabel_.tag = 13;
    [contentView addSubview:emailLabel_];
    
    passwordLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(20, 171, 89, 21)];
    passwordLabel_.text = @"PASSWORD";
    passwordLabel_.textAlignment = UITextAlignmentLeft;
    passwordLabel_.font = [UIFont boldSystemFontOfSize:13];
    passwordLabel_.tag = 14;
    [contentView addSubview:passwordLabel_];
    
    birthdayLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(20, 215, 89, 21)];
    birthdayLabel_.text = @"BIRTHDAY";
    birthdayLabel_.textAlignment = UITextAlignmentLeft;
    birthdayLabel_.font = [UIFont boldSystemFontOfSize:13];
    birthdayLabel_.tag = 15;
    [contentView addSubview:birthdayLabel_];
    
    genderLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(20, 259, 89, 21)];
    genderLabel_.text = @"GENDER";
    genderLabel_.textAlignment = UITextAlignmentLeft;
    genderLabel_.font = [UIFont boldSystemFontOfSize:13];
    genderLabel_.tag = 16;
    [contentView addSubview:genderLabel_];
    
    phoneLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(20, 302, 89, 21)];
    phoneLabel_.text = @"PHONE";
    phoneLabel_.textAlignment = UITextAlignmentLeft;
    phoneLabel_.font = [UIFont boldSystemFontOfSize:13];
    phoneLabel_.tag = 17;
    [contentView addSubview:phoneLabel_];
    
    termsTextView_ = [[UITextView alloc] initWithFrame:CGRectMake(10, 348, 301, 58)];
    termsTextView_.text = @"terms";
    termsTextView_.textAlignment = UITextAlignmentCenter;
    termsTextView_.font = [UIFont boldSystemFontOfSize:11];
    
    [contentView addSubview:termsTextView_];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Signup button
    UIBarButtonItem *signupBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"signup", @"") style:UIBarButtonItemStyleBordered target:self action:@selector(signup:)];
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
    
//    if (tag > 3) {
//        rect.origin.y = -44.0f * (tag - 3);
//            if (tag == 4) {
//                rect.origin.y = -74.0f;
//            }
//    } else {
//        rect.origin.y = 0;
//        if (tag == 3) {
//            rect.origin.y = -24.0f;
//        }  
//    }
    
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
            rect.origin.y = -160.0f;
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
