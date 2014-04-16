//
//  ShareViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 28/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "ShareViewController.h"
#import "CameraViewController.h"
#import "DescriptionViewController.h"
#import "MapViewController.h"
#import <Social/Social.h>
#import "MCLocalization.h"


@interface ShareViewController ()

@end

@implementation ShareViewController

#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
    
  //  "thankyou": "Thank you!",
   // "yourissue": "Your issue has been reported. Share it with your friends",
   // "orreportanother": "or report another one",

    
    self.lblThankYou.text =[MCLocalization stringForKey:@"thankyou"];
    self.lblYourIssue.text=[MCLocalization stringForKey:@"yourissue"];
    self.lblOrReport.text=[MCLocalization stringForKey:@"orreportanother"];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self.lblThankYou setFont:[UIFont fontWithName:@"FuturaStd-Medium" size:17]];
    [self.lblOrReport setFont:[UIFont fontWithName:@"FuturaStd-Light" size:15]];
    [self.lblYourIssue setFont:[UIFont fontWithName:@"FuturaStd-Light" size:15]];
}

-(void)viewDidLayoutSubviews{

    if (!isiPhone5) {
        
        self.imgLogo.frame=CGRectMake(self.imgLogo.frame.origin.x, self.imgLogo.frame.origin.y-20, self.imgLogo.frame.size.width, self.imgLogo.frame.size.height);
    }
   
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)createNewIssue:(id)sender {

    //Remove info for last issue
    [SyncData get].issue_image=nil;
    [SyncData get].current_issue.city_id=nil;
    [SyncData get].current_issue.category_id=nil;
    

    NSInteger count=[[self.navigationController viewControllers] count];
    
    [self.navigationController  popToViewController:[[self.navigationController viewControllers] objectAtIndex:count-4 ] animated:YES];
}
- (IBAction)btnFacebookShare:(id)sender {
    
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *fbSheet = [SLComposeViewController
                                            composeViewControllerForServiceType:SLServiceTypeFacebook];
       [fbSheet setInitialText: [SyncData get].issueResponseUrl];
       // if (![fbSheet addImage:self.imageToShare]) {
            NSLog(@"Unable to add the image!");
      //  }
        [self presentViewController:fbSheet animated:YES completion:nil];
    }
    else {
        NSLog(@"FB not Installed");
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                              message:@"Cannot share - no Facebook app installed."
                                                             delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        [myAlertView show];
        
    }

    
}

- (IBAction)btnTwitterShare:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        [tweetSheet setInitialText:[SyncData get].issueResponseUrl];
        
        //if (![tweetSheet addImage:self.imageToShare]) {
            NSLog(@"Unable to add the image!");
       // }
        
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else {
        NSLog(@"Twitter not Installed");
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                              message:@"Cannot share - no Twitter app installed."
                                                             delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        [myAlertView show];
        
    }
    
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}

@end
