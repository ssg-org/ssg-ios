//
//  SignUpEmailViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 27/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SignUpEmailViewController.h"
#import "SyncData.h"
#import "City.h"
#import "User.h"
#import "AppDelegate.h"
#import "MCLocalization.h"

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
    
    last_city_index=0;
     [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [self setDelagate];
    
    _ssgCommunicator=[[SsgCommnicatorDelegate_Info alloc]init];
    _ssgCommunicator.info_delegate=self;
    
    [_ssgCommunicator getCategoriesAndCities];
    
    _ssgCommunicatorEmailSignup = [[SsgCommunicatorDelegate_EmailSignUp alloc]init];
    _ssgCommunicatorEmailSignup.emailSignup_delegate=self;
    
    //Gesture init
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [self.imgBackground addGestureRecognizer:singleTap];
    [self.imgBackground setUserInteractionEnabled:YES];
    
    
    
    UITapGestureRecognizer *containerViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard:)];
    containerViewGesture.numberOfTapsRequired = 1;
    containerViewGesture.numberOfTouchesRequired = 1;
    [self.textBoxContainer addGestureRecognizer:containerViewGesture];
    [self.textBoxContainer setUserInteractionEnabled:YES];

}

- (void)closeKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    
    [self textFieldShouldReturn:self.txtFirstName];
    [self textFieldShouldReturn:self.txtLastName];
    [self textFieldShouldReturn:self.txtEmail];
    [self textFieldShouldReturn:self.txtPassword];
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden=YES;
    
    if (selectedCity!=nil) {
        [self.btnCity setTitle:selectedCity.city forState:UIControlStateNormal];
    }
    else
    {
        [self.btnCity setTitle:[[MCLocalization stringForKey:@"city"]lowercaseString ] forState:UIControlStateNormal] ;
    }
    
    self.txtFirstName.placeholder=[MCLocalization stringForKey:@"firstname"];
    self.txtLastName.placeholder=[MCLocalization stringForKey:@"lastname"];
    self.txtEmail.placeholder=[[MCLocalization stringForKey:@"email"]lowercaseString ];
    self.txtPassword.placeholder=[[MCLocalization stringForKey:@"password"] lowercaseString] ;
    self.lblGetStarted.text=[MCLocalization stringForKey:@"getstarted"];
    [self.btnBackToLogin setTitle:[MCLocalization stringForKey:@"backtologin"] forState:UIControlStateNormal];
    [self.btnSignUp setBackgroundImage:[UIImage imageNamed:[MCLocalization stringForKey:@"signupbutton"]] forState:UIControlStateNormal];
    
    self.navigationItem.title = [MCLocalization stringForKey:@"signup_bar"];
    

}

-(void)viewWillLayoutSubviews{

    self.btnCity.layer.cornerRadius=3.00f;
    [self setFonts];
    
   
    
}
-(void)setFonts {
    self.lblGetStarted.font=[UIFont fontWithName:@"FuturaStd-Light" size:17];
    //self.btnCity.titleLabel.font=[UIFont fontWithName:@"FuturaStd-Light" size:14];
    self.btnSignUp.titleLabel.font=[UIFont fontWithName:@"FuturaStd-Heavy" size:16];
    self.btnBackToLogin.titleLabel.font=[UIFont fontWithName:@"FuturaStd-Light" size:16];
   // [self.btnBackToLogin setTitle:@"Back to login" forState:UIControlStateNormal];
}

-(void)setDelagate {
  
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
    
    if ([self validateUserInputData]) {
        //disable all controlls
        [self disableAllControlls];
        
        //Get CoreData context
        AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
        NSManagedObjectContext *context =appDelagate.managedObjectContext;

        //Set newUser object
        User *user = [NSEntityDescription
                      insertNewObjectForEntityForName:@"User"
                      inManagedObjectContext:context];
        user.firstname=self.txtFirstName.text;
        user.lastname=self.txtLastName.text;
        user.email=self.txtEmail.text;
        user.password=self.txtPassword.text;
        user.city_id = selectedCity.id_;
        [_ssgCommunicatorEmailSignup signUpWithEmail:user];
        
        
        
    }
    else{
        
        
       UIAlertView* infoAlertView = [[UIAlertView alloc] initWithTitle:@"Info"
                                                   message:validationMessage
                                                  delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles: nil];
        
        infoAlertView.delegate=nil;
        
        [infoAlertView show];
    
    
    }
    
}

-(void)disableAllControlls {

    self.txtPassword.enabled=NO;
    self.txtLastName.enabled=NO;
    self.txtFirstName.enabled=NO;
    self.txtEmail.enabled=NO;
    self.btnCity.enabled=NO;
    self.btnSignUp.enabled=NO;
    self.btnBackToLogin.enabled=NO;
}

-(BOOL)validateUserInputData {

    if ([self.txtFirstName.text length]==0
        || [self.txtLastName.text length]==0
        || [self.txtPassword.text length]==0
        || selectedCity==nil
        || [self validateEmail:self.txtEmail.text]==NO
        ) {
        
        
        if ([self.txtFirstName.text length] ==0) {
            
            validationMessage = @"Firstname is empty...";
             return false;
        }
        
        if ([self.txtLastName.text length] ==0) {
            
            validationMessage = @"Lastname is empty...";
             return false;
        }
        
        if ( [self validateEmail:self.txtEmail.text] ==NO ) {
            
            validationMessage = @"Email address  incorrect format...";
             return false;
        }
        
        
        if ([self.txtPassword.text length] ==0) {
            
            validationMessage = @"Password is empty...";
             return false;
        }
        
        if (selectedCity==nil) {
            
            validationMessage = @"City is empty...";
             return false;
        }
       
        
        return false;
    }
    

    return true;
}


- (IBAction)btnBackToLogin:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)btnCityOnTouch:(id)sender {
    
    CitiesViewController *categoryViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CitiesViewController" ];
    categoryViewController.delegate_cities=self;
    [self.navigationController pushViewController:categoryViewController animated:YES];
}


#pragma  - SSG COMMUNICATOR DELEGATE FUNCTION
- (void)recivedData:(SyncData*)syncData {
    
    
}
- (void)fetchingData:(NSError *)error {
    
    
}

#pragma - Cities delegate
-(void)getSelectedCity :(City*)city{
    
    selectedCity=city;
    
}

- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

- (void)getResponse:(NSString*)code : (id)responseObject{

    if ([code isEqualToString:@"0"]) {
        
        UIAlertView* infoAlertView = [[UIAlertView alloc] initWithTitle:@"Info"
                                                                message:@"Confirmation code was sent, please check your email address!"
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
             
                                                      otherButtonTitles: nil];
        
        infoAlertView.delegate=self;
        [infoAlertView show];
    }

}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    [SyncData get].signupEmail=self.txtEmail.text;
    [SyncData get].signupPassword=self.txtPassword.text;
    [self.navigationController popViewControllerAnimated:YES];
}



@end
