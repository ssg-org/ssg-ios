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


@interface DescriptionViewController : UIViewController<UITextFieldDelegate,CategoryDelegate,SubCategoryDelegate>



@property (strong, nonatomic) IBOutlet UITextField *txtTitle;
@property (strong, nonatomic) IBOutlet UITextField *txtCity;
@property (strong, nonatomic) IBOutlet UITextField *txtDescription;

@property Categories * selectedCategory;
@property (strong, nonatomic) IBOutlet UIButton *btnCategory;

- (IBAction)btnCategoryOnTouch:(id)sender;

@end
