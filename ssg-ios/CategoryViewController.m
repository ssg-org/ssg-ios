//
//  CategoryViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 28/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoriesTableViewCell.h"
#import "Categories.h"
#import "FAImageView.h"
#import "NSString+FontAwesome.h"
#import "UIFont+FontAwesome.h"
#import  "SubCategoryViewController.h"
#import  "DescriptionViewController.h"
#import "HelperFunctions.h"
#import "MCLocalization.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tblComponent.delegate=self;
    self.tblComponent.dataSource=self;
    
    _ssgCommunicator= [[SsgCommnicatorDelegate_Info alloc]init];
    _ssgCommunicator.info_delegate=self;
    [_ssgCommunicator getCategoriesAndCities];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
    return [categories count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoriesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell" forIndexPath:indexPath];
    
    Categories * current = [categories objectAtIndex:indexPath.row];
    cell.lblCategoryName.text=current.name;
    cell.imgCategory.image=nil;
    [cell.imgCategory setDefaultIconIdentifier:current.icon];
    cell.imgCategory.defaultView.backgroundColor=[HelperFunctions colorWithHexString:current.color];
    
    if ([self getSubcategoryForSelectedRow:indexPath.row ].count ==0) {
        
        cell.accessoryType=UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(NSMutableArray *) getSubcategoryForSelectedRow: (NSInteger)row {

    Categories *current = [categories objectAtIndex:row];
    NSMutableArray * subcategory =[[NSMutableArray alloc]init];
    
    for ( Categories * obj  in categoriesAndSubcategories) {
        
        if (obj.parent_id == current.id_) {
            
            [subcategory addObject:obj];
        }
        
    }
    return subcategory;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([[self getSubcategoryForSelectedRow:indexPath.row] count ]>0) {
        self.subcategoryViewController.subcategory=[self getSubcategoryForSelectedRow:indexPath.row];
        [self.navigationController pushViewController: (UIViewController *)self.subcategoryViewController animated:YES];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
        [self.delegate_category selectCategory: [categories objectAtIndex:indexPath.row]];
        
    }
}





-(NSMutableArray *)getCategories {

    NSMutableArray * cat = [[NSMutableArray alloc]init];
    for ( Categories * obj in categoriesAndSubcategories) {
        
       if ([obj.parent_id intValue]==0) {
           [cat addObject:obj];
        }
    }

    return cat;
}


#pragma  - SSG COMMUNICATOR DELEGATE FUNCTION
- (void)recivedData:(SyncData*)syncData {
    
    categoriesAndSubcategories=[[NSMutableArray alloc]init];
    categoriesAndSubcategories=syncData.categories;
    categories=[[NSMutableArray alloc]init];
    categories = [self getCategories];
    [self.tblComponent performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
   
}
- (void)fetchingData:(NSError *)error {
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    
   self.navigationItem.title = [MCLocalization stringForKey:@"category_bar"];
    
}

- (void)getResponse:(NSString*)code : (id)responseObject{

    
}

-(void)viewDidAppear:(BOOL)animated{
    
     self.screenName=@"Category";
    [super viewDidAppear:YES];
}
@end
