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
#import "CustomTextField.h"
#import "MCLocalization.h"

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
    //Show navigation bar
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    //Set delegates
    self.txtCity.delegate=self;
    self.txtCustomDescription.delegate=self;
    self.txtTitle.delegate=self;
    self.txtCustomDescription.delegate=self;
    
   
    //Create  next button
    self.navigationItem.rightBarButtonItem = [self createNextButton];
}


-(UIBarButtonItem*)createNextButton{

    //Get icon
    UIImage *nextIcon = [UIImage imageNamed:@"next_icon.png"];
    
    //Create button
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setImage:nextIcon forState:UIControlStateNormal];
    [button setTitle:[MCLocalization stringForKey:@"next"] forState:UIControlStateNormal];
    
    //Set button selector function
    [button addTarget:self action:@selector(Next)forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 2.5f, 75, 31)];
    button.titleLabel.font=[UIFont fontWithName:@"FuturaStd-Book" size:14.0f];
    
    //set image position
    button.imageEdgeInsets = UIEdgeInsetsMake(0., button.frame.size.width - (nextIcon.size.width  ), 0., 0.);
    button.titleEdgeInsets = UIEdgeInsetsMake(0., 0., 0., nextIcon.size.width);
    
    //Create button View - set  UIBarButtonItem custom position
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 63, 33)];
    backButtonView.bounds = CGRectOffset(backButtonView.bounds, 5, 0);
    [backButtonView addSubview:button];
    
    //Create UIBarButtonItem
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];

    return barButton;

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
    
   alertView = [[UIAlertView alloc] initWithTitle:@"Info"
                                                   message:[MCLocalization stringForKey:@"descrption_validation"]
                                                  delegate:self
                                         cancelButtonTitle:[MCLocalization stringForKey:@"ok"]
                                         otherButtonTitles: nil];
        
   [alertView show];
        
    }
}


-(void)viewDidLayoutSubviews{
    
    //Set placeholder custom color
    [self.txtTitle setValue:[UIColor  lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    //Set custom description placeholder
    [self.txtCustomDescription setPlaceholder:@"Opis"];
    
    //Set selected category and city
    [self setSelectedCategoriesAndCity];
}

-(void)setSelectedCategoriesAndCity {

    if (self.selectedCategory!=nil) {
        [self.btnCategory setTitle:self.selectedCategory.name forState:UIControlStateNormal];
        [self.btnCategory setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    if (self.selectedCity!=nil) {
        [self.btnCity setTitle:self.selectedCity.city forState:UIControlStateNormal];
        [self.btnCity setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
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
    
    //Set localization text
    self.navigationItem.backBarButtonItem.title= [MCLocalization stringForKey:@"back"];
    self.navigationItem.title = [MCLocalization stringForKey:@"description_bar"];
    self.txtTitle.placeholder=[MCLocalization stringForKey:@"title"];
    [self.btnCategory setTitle:[MCLocalization stringForKey:@"category"] forState:UIControlStateNormal];
    [self.btnCity setTitle:[MCLocalization stringForKey:@"city"] forState:UIControlStateNormal];
    [self.txtCustomDescription setPlaceholder:[MCLocalization stringForKey:@"description"]];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //Close keyboard
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
    [SyncData get].current_issue.category_name=self.selectedCategory.name;
}

-(void)selectSubCategory:(Categories*)category{

    self.selectedCategory=category;
    [SyncData get].current_issue.category_id=self.selectedCategory.id_;
    [SyncData get].current_issue.category_name=self.selectedCategory.name;
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
    [SyncData get].current_issue.city_name=self.selectedCity.city;
}

-(void)viewDidAppear:(BOOL)animated{
  
    self.screenName=@"Description";
    [super viewDidAppear:YES];
}
#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE

//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    if (!isiPhone5) {
//        [self animateTextField: textField up: YES];
//    }
//
//}


-(void)textViewDidBeginEditing:(UITextView *)textView{

    if (!isiPhone5) {
        [self animateTextField: textView up: YES];
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView{
   
    if (!isiPhone5) {
        [self animateTextField: textView up: NO];
    }
}


//
//
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    if (!isiPhone5) {
//        [self animateTextField: textField up: NO];
//    }
//}

- (void) animateTextField: (UITextView*) textField up: (BOOL) up
{
    const int movementDistance = 90; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed

    int movement = (up ? -movementDistance : movementDistance);

    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

@end
