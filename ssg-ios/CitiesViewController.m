//
//  CitiesViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "CitiesViewController.h"
#import "CitiesTableViewCell.h"
#import "City.h"
#import "MCLocalization.h"

@interface CitiesViewController ()

@end

@implementation CitiesViewController

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
//    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) { // if iOS 7
//        self.edgesForExtendedLayout = UIRectEdgeNone; //layout adjustements
//    }
    
    _ssgCommunicator =[[SsgCommnicatorDelegate_Info alloc]init];
    _ssgCommunicator.info_delegate=self;
    [_ssgCommunicator getCategoriesAndCities];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [[SyncData get].cities count];
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 CitiesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CitiesTableViewCell" forIndexPath:indexPath];
 
     
     City * current = [[SyncData get].cities objectAtIndex:indexPath.row];
 
    // cell.lblCityName.font=[UIFont fontWithName:@"FuturaStd-Light" size:14];
     cell.lblCityName.text= current.city;
 
 
     
 return cell;
 }


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [self.delegate_cities getSelectedCity:[[SyncData get].cities objectAtIndex:indexPath.row ] ];
    
    [self.navigationController popViewControllerAnimated:YES];

}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
    self.navigationItem.title = [MCLocalization stringForKey:@"city_bar"];
}

#pragma  - SSG COMMUNICATOR DELEGATE FUNCTION
- (void)recivedData:(SyncData*)syncData {
    
    
    
    [self.tblComponent performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    
}
- (void)fetchingData:(NSError *)error {
    
    
}

- (void)getResponse:(NSString*)code : (id)responseObject{

}


@end
