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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
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
    [SyncData get].current_issue=nil;
    
    NSInteger count=[[self.navigationController viewControllers] count];
    
    [self.navigationController  popToViewController:[[self.navigationController viewControllers] objectAtIndex:count-4 ] animated:YES];
}
@end
