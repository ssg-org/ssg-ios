//
//  MainViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 25/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "CameraViewController.h"
#import "MCLocalization.h"
#import "SyncData.h"
#import "SettingsViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE

- (void)viewDidLoad
{
    [super viewDidLoad];
    

  
    
    //[[BWQuincyManager sharedQuincyManager] setDelegate:self];
    
    // Do any additional setup after loading the view.
    //set fonts
   // self.lblWelcome.font=[UIFont fontWithName:@"FurturaStd-Medium" size:15];
   // self.lblYouCan.font=[UIFont fontWithName:@"FurturaStd-Light" size:15];
    
    [self.lblYouCan setFont:[UIFont fontWithName:@"FuturaStd-Light" size:15]];
    [self.lblWelcome setFont:[UIFont fontWithName:@"FuturaStd-Medium" size:17]];
    
    
    
   // NSMutableArray * array = [[NSMutableArray alloc]init];
    
    //NSObject * object = [array objectAtIndex:5];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



-(void)viewWillAppear:(BOOL)animated{

    
    self.lblWelcome.text=[MCLocalization stringForKey:@"welcome"];
    self.lblYouCan.text=[MCLocalization stringForKey:@"youcan"];
    self.navigationItem.backBarButtonItem.title= [MCLocalization stringForKey:@"back"];
    
    
   
}


-(void)viewDidLayoutSubviews{
    
    if (!viewLoaded) {
        if (!isiPhone5) {
            self.ssgTextView.frame=CGRectMake(self.ssgTextView.frame.origin.x, self.ssgTextView.frame.origin.y-50, self.ssgTextView.frame.size.width, self.ssgTextView.frame.size.height);
            
        }
        
        viewLoaded=YES;
    }
   
    
}


-(void)viewDidAppear:(BOOL)animated{
    
   
}

-(void)viewWillLayoutSubviews{
    
    viewLoaded=NO;

  [[self navigationController] setNavigationBarHidden:YES animated:YES];
    

    
    
}
- (IBAction)btnCameraOnTouch:(id)sender {
    
    CameraViewController *main= [ self.storyboard instantiateViewControllerWithIdentifier:@"CameraViewController"];
    [self.navigationController pushViewController: (UIViewController *)main animated:YES];
}


- (IBAction)btnFacebookShare:(id)sender {
}

- (IBAction)btnTwitterShare:(id)sender {
}

- (IBAction)btnSettings:(id)sender {
    
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    transition.type = kCATransitionFromLeft;
    [transition setType:kCATransitionPush];
    transition.subtype = kCATransitionFromLeft;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
//
    
    
    SettingsViewController *main= [ self.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
    [self.navigationController pushViewController: (UIViewController *)main animated:NO];
}
@end
