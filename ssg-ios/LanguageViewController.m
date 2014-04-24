//
//  LanguageViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 14/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "LanguageViewController.h"
#import "MCLocalization.h"


@interface LanguageViewController ()

@end

@implementation LanguageViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnEnglishOnTouch:(id)sender {
    
    [MCLocalization sharedInstance].language = @"en";
    
    for (UIViewController *controller in self.navigationController.viewControllers) {
        
        controller.navigationItem.backBarButtonItem.title=[MCLocalization stringForKey:@"back"];
        
    }
    
    //Go to login
    NSInteger count=[[self.navigationController viewControllers] count];
    [self.navigationController  popToViewController:[[self.navigationController viewControllers] objectAtIndex:count-2 ] animated:YES];

}

- (IBAction)btnBosnian:(id)sender {
    
    [MCLocalization sharedInstance].language = @"bos";
   
    for (UIViewController *controller in self.navigationController.viewControllers) {
        
        controller.navigationItem.backBarButtonItem.title=[MCLocalization stringForKey:@"back"];
        
    }
    //Go to login
    NSInteger count=[[self.navigationController viewControllers] count];
    [self.navigationController  popToViewController:[[self.navigationController viewControllers] objectAtIndex:count-2 ] animated:YES];

}

-(void)viewWillAppear:(BOOL)animated{

   self.navigationItem.title = [MCLocalization stringForKey:@"language_bar"];
}

-(void)viewDidAppear:(BOOL)animated{
     self.screenName=@"Language";
    [super viewDidAppear:YES];
}



@end
