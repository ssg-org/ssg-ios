//
//  SignUpEmailViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 27/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SignUpEmailViewController.h"

@interface SignUpEmailViewController ()

@end

@implementation SignUpEmailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
     [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [self setDelagate];
    // Do any additional setup after loading the view.
}

-(void)setDelagate {
    self.txtCity.delegate=self;
    self.txtEmail.delegate=self;
    self.txtFirstName.delegate=self;
    self.txtLastName.delegate=self;
    self.txtPassword.delegate=self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (IBAction)btnSignUpOnTouch:(id)sender {
}

- (IBAction)btnBackToLogin:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
@end
