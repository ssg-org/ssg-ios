//
//  LoginViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 25/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "SyncData.h"
#import "AppDelegate.h"
#import "User.h"
#import "City.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillLayoutSubviews{

    
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    
    UIColor *color = [UIColor whiteColor];
    self.txtPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
    
    self.txtUsername.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName: color}];
    
    
    self.customFacebookLogin=[[FBLoginView alloc] initWithReadPermissions:@[@"basic_info", @"email", @"user_likes"]];
    self.customFacebookLogin.delegate=self;
    
    //set facebook  button backgorund
    for (id obj in self.customFacebookLogin.subviews)
    {
        if ([obj isKindOfClass:[UIButton class]])
        {
            UIImage *loginImage = [UIImage imageNamed:@"facebook.png"];
            [obj setBackgroundImage:loginImage forState:UIControlStateNormal];
            [obj setBackgroundImage:nil forState:UIControlStateSelected];
            [obj setBackgroundImage:nil forState:UIControlStateHighlighted];
            [obj sizeToFit];
            
        }
        if ([obj isKindOfClass:[UILabel class]])
        {
            UILabel * loginLabel =  obj;
            loginLabel.text = @"";
            loginLabel.textColor=[UIColor clearColor];
        }
        
    }
    
    //set facebook custom button frame
    CGRect frame =CGRectMake(self.customFacebookLogin.frame.origin.x, self.customFacebookLogin.frame.origin.y
                             , 220, 35);
    
    
    
    [self.customFacebookLogin setFrame:frame];
    [ self.btnFacebookLogin addSubview:self.customFacebookLogin];
   
}

-(void)viewDidLayoutSubviews{
    
    if (!isiPhone5) {
        self.containerView.frame=CGRectMake(self.containerView.frame.origin.x, self.containerView.frame.origin.y-15, self.containerView.frame.size.width, self.containerView.frame.size.height);
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initFacebook];
    [self initImageChanger];
   // [self coreDataTest];
    
    self.txtPassword.delegate=self;
    self.txtUsername.delegate=self;
    
}
-(void)coreDataTest{
// add object to database
    
    AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context =appDelagate.managedObjectContext;
    User *user = [NSEntityDescription
                                      insertNewObjectForEntityForName:@"User"
                                      inManagedObjectContext:context];
 
    user.firstname=@"haris";
    user.lastname=@"dautovic";
    
    City *city = [NSEntityDescription
                  insertNewObjectForEntityForName:@"City"
                  inManagedObjectContext:context];

    city.city=@"Velika Kladusa";
    //user.city=city;
    
    NSError *error;
    [context save:nil];
    
   
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
  
    //get object from database
    // Test listing all FailedBankInfos from the store
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (User *info in fetchedObjects) {
        
        
       // NSLog(@"First name, last name, city : %@ %@ %@", info.firstname,info.lastname, info.city.city);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma - Private methods
-(void) initFacebook{
   
    
  
}

#pragma - Action methods
- (IBAction)btnEmailLoginOnTouch:(UIButton *)sender {
    
    //Login user with email
    
    
    
}

- (IBAction)btnSignUpWithEmailOnTouch:(UIButton *)sender {
    
    
}



#pragma - Delegates methods
// This method will be called when the user information has been fetched
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
   // self.profilePictureView.profileID = user.id;
    //self.nameLabel.text = user.name;
    
    
    MainViewController *main= [ self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    
    main.dataFromLogin=[[NSMutableString alloc]init];
    [main.dataFromLogin appendString:@"Logged in with Facebook... "];
    [main.dataFromLogin appendString:user.name];
    [self.navigationController pushViewController: (UIViewController *)main animated:YES];
    
    
    
}

// Logged-in user experience
- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    //self.statusLabel.text = @"You're logged in as";
}

// Logged-out user experience
- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    // self.profilePictureView.profileID = nil;
    //self.nameLabel.text = @"";
    //self.statusLabel.text= @"You're not logged in!";
    
}

// Handle possible errors that can occur during login
- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSString *alertMessage, *alertTitle;
    
    // If the user should perform an action outside of you app to recover,
    // the SDK will provide a message for the user, you just need to surface it.
    // This conveniently handles cases like Facebook password change or unverified Facebook accounts.
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];
        
        // This code will handle session closures that happen outside of the app
        // You can take a look at our error handling guide to know more about it
        // https://developers.facebook.com/docs/ios/errors
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
        
        // If the user has cancelled a login, we will do nothing.
        // You can also choose to show the user a message if cancelling login will result in
        // the user not being able to complete a task they had initiated in your app
        // (like accessing FB-stored information or posting to Facebook)
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        NSLog(@"user cancelled login");
        
        // For simplicity, this sample handles other errors with a generic message
        // You can checkout our error handling guide for more detailed information
        // https://developers.facebook.com/docs/ios/errors
    } else {
        alertTitle  = @"Something went wrong";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }
    
    if (alertMessage) {
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



- (void)initImageChanger{
    current_image=5;
    backgroundImagesArray=[NSArray arrayWithObjects:@"login_bg1.png",@"login_bg2.png",@"login_bg3.png",@"login_bg4.png",nil];
    imageTimer = [NSTimer scheduledTimerWithTimeInterval:(7.0) target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    [imageTimer fire];
}

-(void)changeImage{
    current_image=current_image>=[backgroundImagesArray count]?0:current_image++;
    [UIImageView beginAnimations:nil context:NULL];
    [UIImageView setAnimationDuration:0.6];
    self.imageBackground.alpha=1;
    self.imageBackground.image =[UIImage imageNamed:[backgroundImagesArray objectAtIndex:current_image]];
    [UIImageView commitAnimations];
    current_image++;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
