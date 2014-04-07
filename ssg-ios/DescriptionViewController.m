//
//  DescriptionViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 27/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "DescriptionViewController.h"


@interface DescriptionViewController ()

@end

@implementation DescriptionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    self.txtCity.delegate=self;
    self.txtDescription.delegate=self;
    self.txtTitle.delegate=self;
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


-(void)viewWillAppear:(BOOL)animated{

    UIColor *color = [UIColor blackColor];
    self.txtCity.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"City" attributes:@{NSForegroundColorAttributeName: color}];
    
    self.txtDescription.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Description" attributes:@{NSForegroundColorAttributeName: color}];

     self.txtTitle.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Title" attributes:@{NSForegroundColorAttributeName: color}];
    
    
    if (self.selectedCategory!=nil) {
        self.btnCategory.titleLabel.text=self.selectedCategory.name;
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma Category and Subcategory delgate methods

-(void)selectCategory:(Categories*)category{

    self.selectedCategory=category;
}

-(void)selectSubCategory:(Categories*)category{

    self.selectedCategory=category;
}




- (IBAction)btnCategoryOnTouch:(id)sender {
    
    SubCategoryViewController *subcategory =[ self.storyboard instantiateViewControllerWithIdentifier:@"SubCategoryViewController"];
    subcategory.delegate_subcategory=self;
    
    CategoryViewController *categoryViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CategoryViewController" ];
    categoryViewController.delegate_category=self;
    categoryViewController.subcategoryViewController=subcategory;
    [self.navigationController pushViewController:categoryViewController animated:YES];
}
@end
