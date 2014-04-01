//
//  SignUpEmailViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 27/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpEmailViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>{

    long last_city_index;

}

@property (strong, nonatomic) IBOutlet UIView *textBoxContainer;

@property (strong, nonatomic) IBOutlet UITextField *txtFirstName;
@property (strong, nonatomic) IBOutlet UITextField *txtLastName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
//@property (strong, nonatomic) IBOutlet UITextField *txtCity;

- (IBAction)btnSignUpOnTouch:(id)sender;
- (IBAction)btnBackToLogin:(id)sender;


@property (strong, nonatomic)          NSArray *colorArray;

@property (strong, nonatomic) IBOutlet UIPickerView *txtCity;



@end
