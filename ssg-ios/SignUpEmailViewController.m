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
    
    _ssgCommunicator=[[SsgCommunicator alloc]init];
    _ssgCommunicator.delegate=self;
    
    [_ssgCommunicator loadCitiesAndCategories];
   
  
// NSMutableArray * array_temp=   [SyncData getAllCity];
    
    
   
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
   
}
-(void)viewDidAppear:(BOOL)animated{
    
//    
//    UIColor *color = [UIColor blackColor];
//    self.txtFirstName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"First name" attributes:@{NSForegroundColorAttributeName: color,NSFontAttributeName:[UIFont fontWithName:@"FuturaStd-Light" size:12]}];
    
    
    
}

-(void)viewDidLayoutSubviews{

    
    
}
-(void)viewWillLayoutSubviews{

    self.btnCity.layer.cornerRadius=3.00f;
    [self setFonts];
   
    
}
-(void)setFonts {
    self.lblGetStarted.font=[UIFont fontWithName:@"FuturaStd-Light" size:17];
    self.btnCity.titleLabel.font=[UIFont fontWithName:@"FuturaStd-Light" size:14];
    self.btnSignUp.titleLabel.font=[UIFont fontWithName:@"FuturaStd-Heavy" size:16];
    self.btnBackToLogin.titleLabel.font=[UIFont fontWithName:@"FuturaStd-Light" size:16];
    [self.btnBackToLogin setTitle:@"Back to login" forState:UIControlStateNormal];
    
    
    self.txtEmail.font=[UIFont fontWithName:@"FuturaStd-Light" size:14];
    self.txtFirstName.font=[UIFont fontWithName:@"FuturaStd-Light" size:14];
    self.txtLastName.font=[UIFont fontWithName:@"FuturaStd-Light" size:14];
    self.txtPassword.font=[UIFont fontWithName:@"FuturaStd-Light" size:14];
    
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
        
        //Get CoreData context
        AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
        NSManagedObjectContext *context =appDelagate.managedObjectContext;

        //Set newUser object
        User *newUser = [NSEntityDescription
                      insertNewObjectForEntityForName:@"User"
                      inManagedObjectContext:context];
        newUser.firstname=self.txtFirstName.text;
        newUser.lastname=self.txtLastName.text;
        newUser.email=self.txtEmail.text;
        newUser.password=self.txtPassword.text;
        //newUser.city = [[SyncData getAllCity]objectAtIndex:last_city_index];
        
        //Save to database
        NSError *error;
        [context save:nil];
        if (![context save:&error]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Whoops, couldn't save :(."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            
        }
        else{
            
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info"
                                                            message:@"You have successfuly registred :))."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];

           
        }
        
        
        
        
    }
    
}
-(BOOL)validateUserInputData {


   
    
    [self  setTextFieldError:self.txtFirstName :false];
    [self setTextFieldError:self.txtLastName :false];
    [self setTextFieldError:self.txtEmail :false];
    [self setTextFieldError:self.txtPassword :false];
    
    if ([self.txtFirstName.text length]==0 || [self.txtLastName.text length]==0 || [self.txtEmail.text length]==0 || [self.txtPassword.text length]==0) {
    
        [self  setTextFieldError:self.txtFirstName :true];
        [self setTextFieldError:self.txtLastName :true];
        [self setTextFieldError:self.txtEmail :true];
        [self setTextFieldError:self.txtPassword :true];
        return false;
    }
    

    return true;
}

-(void)setTextFieldError:(UITextField*)textField : (BOOL)state {

    if (state) {
//        textField.layer.masksToBounds=YES;
//        textField.layer.borderColor=[[UIColor redColor]CGColor];
//        textField.layer.borderWidth= 1.0f;
        
        
        UIColor *color = [UIColor redColor];
        textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:textField.placeholder attributes:@{NSForegroundColorAttributeName: color}];
        
        
        
    }
    else{
        
        UIColor *color = [UIColor blackColor];
        textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:textField.placeholder attributes:@{NSForegroundColorAttributeName: color}];
        
        
//        textField.layer.masksToBounds=NO;
//        textField.layer.borderColor=[[UIColor whiteColor]CGColor];
//        textField.layer.borderWidth= 0.0f;
    }
   
}


- (IBAction)btnBackToLogin:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}




- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self  setTextFieldError:textField :false];
    
    return YES;
}

- (IBAction)btnCityOnTouch:(id)sender {
}


#pragma - SSG Communicator delegate functions 

- (void)receivedCategoriesAndCities:(SyncData*)syncData{

    


}
- (void)fetchingCategoriesAndCitiesFailed:(NSError *)error{



}

@end
