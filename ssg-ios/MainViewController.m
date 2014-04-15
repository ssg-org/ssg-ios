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



-(void)viewWillLayoutSubviews{

  [[self navigationController] setNavigationBarHidden:YES animated:YES];
   // [self.navigationController.navigationItem.backBarButtonItem setTitle:[MCLocalization stringForKey:@"back"]];
 
    
    
    
}
- (IBAction)btnCameraOnTouch:(id)sender {
    
    CameraViewController *main= [ self.storyboard instantiateViewControllerWithIdentifier:@"CameraViewController"];
    [self.navigationController pushViewController: (UIViewController *)main animated:YES];
}


@end
