//
//  SubCategoryViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 04/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SubCategoryViewController.h"
#import "SubCategoriesCellTableViewCell.h"
#import "Categories.h"
#import "DescriptionViewController.h"
#import "HelperFunctions.h"
#import "MCLocalization.h"

@interface SubCategoryViewController ()

@end

@implementation SubCategoryViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [self.subcategory count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubCategoriesCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubcategoryCell" forIndexPath:indexPath];
    
    Categories * current = [self.subcategory objectAtIndex:indexPath.row];
   // cell.lblSubcategoryName.font=[UIFont fontWithName:@"FuturaStd-Light" size:14];
    cell.lblSubcategoryName.text=current.name;
    
    cell.imgSubcategory.image=nil;
    [cell.imgSubcategory setDefaultIconIdentifier:current.icon];
    cell.imgSubcategory.defaultView.backgroundColor=[HelperFunctions colorWithHexString:current.color];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {


    [self.delegate_subcategory selectSubCategory:[self.subcategory objectAtIndex:indexPath.row]];
    
    NSInteger count=[[self.navigationController viewControllers] count];
    
    [self.navigationController  popToViewController:[[self.navigationController viewControllers] objectAtIndex:count-3 ] animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{

 self.navigationItem.title = [MCLocalization stringForKey:@"subcategory_bar"];
}

-(void)viewDidAppear:(BOOL)animated{
    self.screenName=@"Subcategory";
    [super viewDidAppear:YES];
}
@end
