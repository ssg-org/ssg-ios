//
//  MainViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 25/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface MainViewController : GAITrackedViewController {
	BOOL viewLoaded;
}

//Property
@property NSMutableString *dataFromLogin;
@property (strong, nonatomic) IBOutlet UILabel *lblWelcome;
@property (strong, nonatomic) IBOutlet UILabel *lblYouCan;
@property (strong, nonatomic) IBOutlet UIView *ssgTextView;
@property (strong, nonatomic) IBOutlet UIView *shareButtonsView;

//Actions
- (IBAction)btnCameraOnTouch:(id)sender;
- (IBAction)btnSettings:(id)sender;

@end
