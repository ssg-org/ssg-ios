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
     self.navigationController.navigationBarHidden=NO;
    // Do any additional setup after loading the view.
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
    
    //Get
    NSMutableArray * object_from_db= [[NSMutableArray alloc]init];
    AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context =appDelagate.managedObjectContext;
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (User *user in fetchedObjects) {
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
  self.btnLanguage.titleLabel.text=[MCLocalization stringForKey:@"lang"];

}


@end
