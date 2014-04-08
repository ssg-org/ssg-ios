//
//  SignUpEmailViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 27/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SsgCommunicatorDelegate.h"
#import "SsgCommnicatorDelegate_Info.h"
#import "CitiesViewController.h"
#import "City.h"
#import "SsgCommunicatorDelegate_EmailSignUp.h"

@interface SignUpEmailViewController : UIViewController<UITextFieldDelegate,SsgCommunicatorDelegate,CitiesDelegate>{

    long last_city_index;
    SsgCommnicatorDelegate_Info* _ssgCommunicator;
    SsgCommunicatorDelegate_EmailSignUp * _ssgCommunicatorEmailSignup;
    City * selectedCity;
   
}

@property (strong, nonatomic) IBOutlet UIView *textBoxContainer;

@property (strong, nonatomic) IBOutlet UITextField *txtFirstName;
@property (strong, nonatomic) IBOutlet UITextField *txtLastName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;


- (IBAction)btnSignUpOnTouch:(id)sender;
- (IBAction)btnBackToLogin:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *btnCity;

- (IBAction)btnCityOnTouch:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *lblGetStarted;
@property (strong, nonatomic) IBOutlet UIButton *btnSignUp;
@property (strong, nonatomic) IBOutlet UIButton *btnBackToLogin;


@end
