//
//  ShareViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 28/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface ShareViewController : GAITrackedViewController




- (IBAction)createNewIssue:(id)sender;
- (IBAction)btnFacebookShare:(id)sender;
- (IBAction)btnTwitterShare:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

@property (strong, nonatomic) IBOutlet UITextView *txtDescription;

@property (strong, nonatomic) IBOutlet UIImageView *imgUser;
@property (strong, nonatomic) IBOutlet UILabel *lblUsername;

@property (strong, nonatomic) IBOutlet UILabel *lblCategoryName;

@property (strong, nonatomic) IBOutlet UIImageView *imgIssue;

@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;



@end
