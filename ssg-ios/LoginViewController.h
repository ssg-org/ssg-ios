//
//  LoginViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 25/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface LoginViewController : UIViewController<FBLoginViewDelegate>{

    NSArray* backgroundImagesArray;
    NSTimer* imageTimer;
    int current_image;

}

//Property
@property (strong, nonatomic) IBOutlet UITextField *txtUsername;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UIView *btnFacebookLogin;
@property (strong,nonatomic) FBLoginView *customFacebookLogin;

//Actions
- (IBAction)btnEmailLoginOnTouch:(UIButton *)sender;
- (IBAction)btnSignUpWithEmailOnTouch:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIImageView *imageBackground;


@end
