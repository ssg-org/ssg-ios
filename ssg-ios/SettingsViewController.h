//
//  SettingsViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 28/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+BackButtonHandler.h"

@interface SettingsViewController : UIViewController<BackButtonHandlerProtocol>


- (IBAction)btnLogOut:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btnLanguage;

@property (strong, nonatomic) IBOutlet UIButton *btnAbout;

@property (strong, nonatomic) IBOutlet UIButton *btnLogout;

@end
