//
//  LoginViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 25/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "SsgCommunicatorDelegate.h"
#import "SsgCommnicatorDelegate_FacebookLogin.h"
#import "SsgCommunicatorDelegate_EmailLogin.h"
#import "SsgCommunicatorDelegate_CreateIssue.h"
#import "CustomTextField.h"

@interface LoginViewController : UIViewController<FBLoginViewDelegate,UITextFieldDelegate,SsgCommunicatorDelegate>{

    NSArray* backgroundImagesArray;
    NSTimer* imageTimer;
    int current_image;
    SsgCommnicatorDelegate_FacebookLogin * _ssgCommunicator;
    SsgCommunicatorDelegate_EmailLogin * _ssgCommunicatorEmailLogin;
   
    
}

//Property
@property (strong, nonatomic) IBOutlet CustomTextField *txtUsername;
@property (strong, nonatomic) IBOutlet CustomTextField *txtPassword;
@property (strong, nonatomic) IBOutlet UIView *btnFacebookLogin;
@property (strong,nonatomic) FBLoginView *customFacebookLogin;

//Actions
- (IBAction)btnEmailLoginOnTouch:(UIButton *)sender;
- (IBAction)btnSignUpWithEmailOnTouch:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIImageView *imageBackground;
@property (strong, nonatomic) IBOutlet UIView *containerView;

@property (strong, nonatomic) IBOutlet UILabel *lblOrQuickLogin;
@property (strong, nonatomic) IBOutlet UILabel *lblDontHaveUlica;





@end
