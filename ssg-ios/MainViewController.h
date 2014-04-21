//
//  MainViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 25/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"
//#import "BWQuincyManager.h"

@interface MainViewController : GAITrackedViewController{

    BOOL viewLoaded;

}

@property NSMutableString* dataFromLogin;

@property (strong, nonatomic) IBOutlet UILabel *lblWelcome;

@property (strong, nonatomic) IBOutlet UILabel *lblYouCan;

- (IBAction)btnCameraOnTouch:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *ssgTextView;
@property (strong, nonatomic) IBOutlet UIView *shareButtonsView;

- (IBAction)btnFacebookShare:(id)sender;

- (IBAction)btnTwitterShare:(id)sender;

- (IBAction)btnSettings:(id)sender;



@end
