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
#import "CustomTextField.h"
#import "MCLocalization.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"

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

- (void)viewWillLayoutSubviews{

    
    //Hide navigation bar
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    
    //Create custom facebook login button
    self.customFacebookLogin=[[FBLoginView alloc] initWithReadPermissions:@[@"basic_info", @"email"]];
    self.customFacebookLogin.delegate=self;
    
    for (id obj in self.customFacebookLogin.subviews)
    {
        if ([obj isKindOfClass:[UIButton class]])
        {
            UIImage *loginImage = [UIImage imageNamed:@"facebook.png"];
            [obj setBackgroundImage:loginImage forState:UIControlStateNormal];
            [obj setBackgroundImage:nil forState:UIControlStateSelected];
            [obj setBackgroundImage:nil forState:UIControlStateHighlighted];
           
            
            CGRect rect =CGRectMake(self.customFacebookLogin.frame.origin.x, self.customFacebookLogin.frame.origin.y, 218, 35);
            
            
            //[obj setSize:rect.size];
            [obj setFrame:rect];
          
            
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
    
    [self.txtPassword setPlaceholderColor:[UIColor whiteColor]];
    [self.txtUsername setPlaceholderColor:[UIColor whiteColor]];
    
    self.lblOrQuickLogin.font = [UIFont fontWithName:@"FuturaStd-Light" size:10];
    self.lblDontHaveUlica.font = [UIFont fontWithName:@"FuturaStd-Light" size:10];
    self.txtUsername.font = [UIFont fontWithName:@"FuturaStd-Light" size:14];
    self.txtPassword.font = [UIFont fontWithName:@"FuturaStd-Light" size:14];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    cachedUser=nil;
    
    
    
    [self initFacebook];
    [self initImageChanger];
    
    self.txtPassword.delegate=self;
    self.txtUsername.delegate=self;
    
    _ssgCommunicator =[[SsgCommnicatorDelegate_FacebookLogin alloc]init];
    _ssgCommunicator.facebook_delegate=self;
    
    _ssgCommunicatorEmailLogin =[[SsgCommunicatorDelegate_EmailLogin alloc]init];
    _ssgCommunicatorEmailLogin.email_delegate=self;
    

    
    if ([self isUserLoggedWithEmailOrFacebook]) {
        
        
        CATransition *transition = [CATransition animation];
        transition.duration = 0.45;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        transition.type = kCATransitionFromRight;
        [transition setType:kCATransitionPush];
        transition.subtype = kCATransitionFromRight;
        transition.delegate = self;
        [self.navigationController.view.layer addAnimation:transition forKey:nil];
        
        
        
            MainViewController *main= [ self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
            [self.navigationController pushViewController: (UIViewController *)main animated:YES];
        
        
    }
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [self.imageBackground addGestureRecognizer:singleTap];
    [self.imageBackground setUserInteractionEnabled:YES];
    
    
    
    UITapGestureRecognizer *containerViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard:)];
    containerViewGesture.numberOfTapsRequired = 1;
    containerViewGesture.numberOfTouchesRequired = 1;
    [self.containerView addGestureRecognizer:containerViewGesture];
    [self.containerView setUserInteractionEnabled:YES];
    
    
}

- (void)closeKeyboard:(UIGestureRecognizer *)gestureRecognizer {
   
    [self textFieldShouldReturn:self.txtUsername];
    [self textFieldShouldReturn:self.txtPassword];
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
    
  

    if ([self validateUserInput]) {
        //Login user with email
        [_ssgCommunicatorEmailLogin loginWithEmail:self.txtUsername.text :self.txtPassword.text];
        
    }
    else{
    
      UIAlertView*  infoAlertView = [[UIAlertView alloc] initWithTitle:[MCLocalization stringForKey:@"popup_title"]
                                                   message:[MCLocalization stringForKey:@"descrption_validation"]
                                                  delegate:self
                                         cancelButtonTitle:[MCLocalization stringForKey:@"ok"]
                                         otherButtonTitles: nil];
    [infoAlertView show];
        
    }
}

-(BOOL)validateUserInput {


    if ([self.txtPassword.text length]==0 || [self.txtUsername.text length]==0) {
     
        return NO;
    }
    
    return YES;
    

}

- (IBAction)btnSignUpWithEmailOnTouch:(UIButton *)sender {
    
   
    
    

}


-(BOOL)isUserLoggedWithEmailOrFacebook {
    
    AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context =appDelagate.managedObjectContext;
    
    
    //get object from database
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    
    for (User *user in fetchedObjects) {
        
        if (user.access_token!=nil) {
           
            return YES;
        }
    }
    
    return NO;
}



#pragma - Delegates methods
// This method will be called when the user information has been fetched
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    
    
    [SyncData get].numberOfFacebookRequest ++;
    if ([SyncData get].numberOfFacebookRequest  == 1) {
        cachedUser = user;
        NSLog(@"loginWithFetchedUserInfo  --------------------------");
        
        [_ssgCommunicator loginWithFacebook:user];
    }
    
   // if (![self isUser:cachedUser equalToUser:user]) {
    
  //  }
}


- (BOOL)isUser:(id<FBGraphUser>)firstUser equalToUser:(id<FBGraphUser>)secondUser {
    return
    [firstUser.id isEqual:secondUser.id] &&
    [firstUser.first_name isEqual:secondUser.first_name]&&
    [firstUser.last_name isEqual:secondUser.last_name] &&
    [firstUser[@"email"]  isEqual:secondUser[@"email"]];
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
   // current_image=5;
//    backgroundImagesArray=[NSArray arrayWithObjects:@"login_bg1.png",@"login_bg2.png",@"login_bg3.png",@"login_bg4.png",nil];
//    imageTimer = [NSTimer scheduledTimerWithTimeInterval:(7.0) target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
//    [imageTimer fire];
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

#pragma  - SSG COMMUNICATOR DELEGATE FUNCTION
- (void)recivedData:(SyncData*)syncData {


}
- (void)fetchingData:(NSError *)error {

    

}


-(void)openMainScreen{


}
- (void)getResponse:(NSString*)code : (id)responseObject{
    
  
    if ([code isEqualToString:@"0"]) {
        
        CATransition *transition = [CATransition animation];
        transition.duration = 0.45;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        transition.type = kCATransitionFromRight;
        [transition setType:kCATransitionPush];
        transition.subtype = kCATransitionFromRight;
        transition.delegate = self;
        [self.navigationController.view.layer addAnimation:transition forKey:nil];
        
        MainViewController *main= [ self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
        [self.navigationController pushViewController:main animated:NO];
        
    
        
    }
    else{
        
        NSDictionary * documents = [[NSDictionary alloc]init];
        documents=[responseObject objectForKey:@"status"];
        NSString* message=[documents objectForKey:@"message"];
        
        UIAlertView*  infoAlertView = [[UIAlertView alloc] initWithTitle:[MCLocalization stringForKey:@"popup_title"]
                                                                 message:message
                                                                delegate:self
                                                       cancelButtonTitle:[MCLocalization stringForKey:@"ok"]
                                                       otherButtonTitles: nil];
        [infoAlertView show];
        
        self.txtPassword.text=@"";
        self.txtUsername.text=@"";
        
        
        
    }
    
}


-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];

    [self.btnLogin setBackgroundImage:[UIImage imageNamed:[MCLocalization stringForKey:@"loginbtn"]] forState:UIControlStateNormal];
    self.lblDontHaveUlica.text=[MCLocalization  stringForKey:@"donthave"];
    self.lblOrQuickLogin.text = [MCLocalization stringForKey:@"orquicklogin"];
    self.txtPassword.placeholder=[MCLocalization stringForKey:@"password"];
    self.txtUsername.placeholder=[MCLocalization stringForKey:@"email"];
}

-(void)viewDidAppear:(BOOL)animated{
    
    //self.tracker = [[GAI sharedInstance] defaultTracker];
    self.screenName=@"Login";
   
    [super viewDidAppear:YES];
    
    

    if ([SyncData get].signupEmail !=nil) {
        self.txtUsername.text=[SyncData get].signupEmail;
        self.txtPassword.text=[SyncData get].signupPassword;
    }
    
    

    
}

- (IBAction)btnCloseKeyboard:(id)sender {
    
  
 
}
@end
