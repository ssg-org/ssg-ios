//
//  SettingsViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 28/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SettingsViewController.h"
#import "User.h"
#import "AppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>
#import "MCLocalization.h"
#import "SyncData.h"

@interface SettingsViewController ()


@end

@implementation SettingsViewController

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
    //Hide navigation bar
     self.navigationController.navigationBarHidden=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (IBAction)btnLogOut:(id)sender {
    
    //Get logged user
    AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context =appDelagate.managedObjectContext;
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (User *user in fetchedObjects) {
        
        //Delete user from database - core data
        [context deleteObject:user];
    }
    
    //Clear facebook session
    [FBSession.activeSession closeAndClearTokenInformation];
    [FBSession.activeSession close];
    [FBSession setActiveSession:nil];
    [SyncData get].numberOfFacebookRequest=0;
    
    if (![context save:&error]) {
        NSLog(@"Couldn't save: %@", error);
    }

    //Go to login
     NSInteger count=[[self.navigationController viewControllers] count];
     [self.navigationController  popToViewController:[[self.navigationController viewControllers] objectAtIndex:count-3 ] animated:YES];
}


-(void)viewWillAppear:(BOOL)animated{
    
    //Set localization text
    [self.btnLanguage setTitle:[MCLocalization stringForKey:@"lang"] forState:UIControlStateNormal];
    [self.btnAbout setTitle:[MCLocalization stringForKey:@"about"] forState:UIControlStateNormal];
    [self.btnLogout setTitle:[MCLocalization stringForKey:@"logout"] forState:UIControlStateNormal];
    self.navigationItem.title = [MCLocalization stringForKey:@"settings_bar"];
    self.navigationItem.backBarButtonItem.title= [MCLocalization stringForKey:@"back"];
}

#pragma marks - Delegate function for back
-(BOOL) navigationShouldPopOnBackButton {
    
    //Remove default transition animation
    [self.navigationController.view.layer removeAllAnimations];
    
    //Set custom transition animation
    CATransition *transition = [CATransition animation];
    transition.duration = 0.45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    transition.type = kCATransitionFromRight;
    [transition setType:kCATransitionPush];
    transition.subtype = kCATransitionFromRight;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
    //Go to main controller
    NSInteger count=[[self.navigationController viewControllers] count];
    [self.navigationController  popToViewController:[[self.navigationController viewControllers] objectAtIndex:count-2 ] animated:NO];
    return NO;
}

-(void)viewDidAppear:(BOOL)animated{
     self.screenName=@"Settings";
    [super viewDidAppear:YES];
}


@end
