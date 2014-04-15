//
//  ShareViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 28/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ShareViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imgLogo;


- (IBAction)createNewIssue:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *lblThankYou;

@property (strong, nonatomic) IBOutlet UILabel *lblYourIssue;


@property (strong, nonatomic) IBOutlet UILabel *lblOrReport;



- (IBAction)btnFacebookShare:(id)sender;
- (IBAction)btnTwitterShare:(id)sender;


@end
