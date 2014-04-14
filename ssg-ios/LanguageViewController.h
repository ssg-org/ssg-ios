//
//  LanguageViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 14/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LanguageViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btnEnglish;
@property (strong, nonatomic) IBOutlet UIButton *btnBosnian;


- (IBAction)btnEnglishOnTouch:(id)sender;
- (IBAction)btnBosnian:(id)sender;


@end
