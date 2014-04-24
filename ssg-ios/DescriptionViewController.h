//
//  DescriptionViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 27/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Categories.h"
#import "CategoryViewController.h"
#import "SubCategoryViewController.h"
#import "City.h"
#import "CitiesViewController.h"
#import "UIPlaceHolderTextView.h"
#import "CustomTextField.h"
#import "GAITrackedViewController.h"

@interface DescriptionViewController : GAITrackedViewController<UITextFieldDelegate,UITextViewDelegate,CategoryDelegate,SubCategoryDelegate,CitiesDelegate>
{
    UIAlertView * alertView;
}

//Property
@property (strong, nonatomic) IBOutlet UITextField *txtTitle;
@property (strong, nonatomic) IBOutlet UITextField *txtCity;
@property Categories * selectedCategory;
@property City * selectedCity;
@property (strong, nonatomic) IBOutlet UIButton *btnCategory;
@property (strong, nonatomic) IBOutlet UIButton *btnCity;
@property (strong, nonatomic) IBOutlet UIPlaceHolderTextView *txtCustomDescription;

//Actions
- (IBAction)btnCategoryOnTouch:(id)sender;
- (IBAction)btnCityOnTouch:(id)sender;

@end
