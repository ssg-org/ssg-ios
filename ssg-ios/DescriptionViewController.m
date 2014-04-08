//
//  DescriptionViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 27/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "DescriptionViewController.h"
#import "AppDelegate.h"
#import "MapViewController.h"
#import "CitiesViewController.h"

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
    //self.txtDescription.delegate=self;
    self.txtCustomDescription.delegate=self;
    self.txtTitle.delegate=self;
   
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"NEXT" style:UIBarButtonItemStylePlain target:self action:@selector(Next)];
    self.navigationItem.rightBarButtonItem = anotherButton;
}


-(IBAction)Next
{
    
    if ([self validateUserInput]) {
        
        [SyncData get].current_issue.title = self.txtTitle.text;
        [SyncData get].current_issue.descript=self.txtCustomDescription.text;
    
        MapViewController *categoryViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController" ];
        [self.navigationController pushViewController:categoryViewController animated:YES];
    }
    else
    {
    
       UIAlertView* infoAlertView = [[UIAlertView alloc] initWithTitle:@"Info"
                                                   message:@"User validation false"
                                                  delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles: nil];
        [infoAlertView show];
    }
}


-(BOOL)validateUserInput {


    if ([self.txtTitle.text length]==0 ||
        [self.txtCustomDescription.text length] == 0 ||
        [[SyncData get].current_issue.category_id  intValue]==0 ||
        [[SyncData get].current_issue.city_id intValue]==0 )
    
    {
        return NO;
    }
    return YES;

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
    
   // self.txtCustomDescription.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Description" attributes:@{NSForegroundColorAttributeName: color}];
    
    [self.txtCustomDescription setPlaceholder:@"Description"];
    [self.txtCustomDescription setPlaceholderColor:color];
    
    

     self.txtTitle.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Title" attributes:@{NSForegroundColorAttributeName: color}];
    
    
    if (self.selectedCategory!=nil) {
        self.btnCategory.titleLabel.text=self.selectedCategory.name;
    }
    
    if (self.selectedCity!=nil) {
        self.btnCity.titleLabel.text=self.selectedCity.city;
    }
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    // Any new character added is passed in as the "text" parameter
    if ([text isEqualToString:@"\n"]) {
        // Be sure to test for equality using the "isEqualToString" message
        [textView resignFirstResponder];
        
        // Return FALSE so that the final '\n' character doesn't get added
        return FALSE;
    }
    // For any other character return TRUE so that the text gets added to the view
    return TRUE;
}

#pragma Category and Subcategory delgate methods

-(void)selectCategory:(Categories*)category{

    self.selectedCategory=category;
    [SyncData get].current_issue.category_id=self.selectedCategory.id_;
}

-(void)selectSubCategory:(Categories*)category{

    self.selectedCategory=category;
    [SyncData get].current_issue.category_id=self.selectedCategory.id_;
}

- (IBAction)btnCategoryOnTouch:(id)sender {
    
    SubCategoryViewController *subcategory =[ self.storyboard instantiateViewControllerWithIdentifier:@"SubCategoryViewController"];
    subcategory.delegate_subcategory=self;
    
    CategoryViewController *categoryViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CategoryViewController" ];
    categoryViewController.delegate_category=self;
    categoryViewController.subcategoryViewController=subcategory;
    [self.navigationController pushViewController:categoryViewController animated:YES];
}



- (IBAction)btnCityOnTouch:(id)sender {
    
    CitiesViewController *categoryViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CitiesViewController" ];
    categoryViewController.delegate_cities=self;
    [self.navigationController pushViewController:categoryViewController animated:YES];
}

#pragma CityController delegate function 

-(void)getSelectedCity :(City*)city {
    
    self.selectedCity=city;
    [SyncData get].current_issue.city_id = self.selectedCity.id_;
    
}

@end
