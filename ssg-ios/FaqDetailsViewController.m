//
//  FaqDetailsViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 17/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "FaqDetailsViewController.h"
#import "MCLocalization.h"

@interface FaqDetailsViewController ()

@end

@implementation FaqDetailsViewController

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
    self.txtDetails.text=self.selected_info;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewDidAppear:(BOOL)animated{
    self.screenName=@"FaqDetails";
    [super viewDidAppear:YES];
    self.navigationItem.title = [MCLocalization stringForKey:@"faq_bar"];
}

@end
