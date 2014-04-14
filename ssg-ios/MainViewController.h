//
//  MainViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 25/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "BWQuincyManager.h"

@interface MainViewController : UIViewController

@property NSMutableString* dataFromLogin;

@property (strong, nonatomic) IBOutlet UILabel *lblWelcome;

@property (strong, nonatomic) IBOutlet UILabel *lblYouCan;

- (IBAction)btnCameraOnTouch:(id)sender;

@end
