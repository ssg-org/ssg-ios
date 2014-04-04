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
    _ssgCommunicator= [[SsgCommnicatorDelegate_Info alloc]init];
    _ssgCommunicator.info_delegate=self;
    categories=[SyncData get].categories;
    [_ssgCommunicator getCategoriesAndCities];
    
//  NSMutableDictionary *tempdict=  [SyncData get].keyCharForFontAwesome;
    
    
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma - SSG Communicator delegate functions

- (void)receivedCategoriesAndCities:(SyncData*)syncData{
    
    
    
   
    [self.tblComponent performSelector:@selector(reloadTableView) onThread:nil withObject:nil waitUntilDone:YES];
    
    categories=[[NSMutableArray alloc]init];
    categories=syncData.categories;
    
}

-(void)reloadTableView{

    [self.tblComponent reloadData];

}


- (void)fetchingCategoriesAndCitiesFailed:(NSError *)error{
    
    
    
    NSLog(@" %@",error);
    
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
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
    
    
    return cell;
}




/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */




@end
