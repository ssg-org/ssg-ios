//
//  ShareViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 28/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "ShareViewController.h"

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

@end
