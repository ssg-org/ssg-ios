//
//  MainViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 25/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "MainViewController.h"

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
   
    // Do any additional setup after loading the view.
    //set fonts
   // self.lblWelcome.font=[UIFont fontWithName:@"FurturaStd-Medium" size:15];
   // self.lblYouCan.font=[UIFont fontWithName:@"FurturaStd-Light" size:15];
    
    [self.lblYouCan setFont:[UIFont fontWithName:@"FuturaStd-Light" size:15]];
    [self.lblWelcome setFont:[UIFont fontWithName:@"FuturaStd-Medium" size:17]];
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
//self.navigationController.navigationBarHidden=YES;
  

    
}


-(void)viewWillLayoutSubviews{

  [[self navigationController] setNavigationBarHidden:YES animated:YES];
    self.navigationItem.backBarButtonItem.title=@"Back";
    
    
}
@end
