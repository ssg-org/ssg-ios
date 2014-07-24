//
//  FaqDetailsViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 17/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface FaqDetailsViewController : GAITrackedViewController

@property (strong, nonatomic) IBOutlet UITextView *txtDetails;
@property (strong, nonatomic) NSString *selected_info;

@end
