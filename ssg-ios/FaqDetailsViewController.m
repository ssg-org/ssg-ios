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
    // Do any additional setup after loading the view.
    
    self.txtDetails.text=self.selected_info;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)viewDidAppear:(BOOL)animated{
     self.screenName=@"FaqDetails";
    [super viewDidAppear:YES];
    self.navigationItem.title = [MCLocalization stringForKey:@"faq_bar"];
    
}

@end
