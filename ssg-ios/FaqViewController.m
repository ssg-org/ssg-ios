//
//  FaqViewController.m
//  ssg-ios
//
//  Created by Haris Dautovic on 17/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "FaqViewController.h"
#import "SyncData.h"
#import "Faq.h"
#import "FaqTableViewCell.h"
#import "FaqDetailsViewController.h"
#import "MCLocalization.h"

@interface FaqViewController ()

@end

@implementation FaqViewController

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
    return [[SyncData get].faq count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FaqTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FaqTableViewCell" forIndexPath:indexPath];
    
    Faq * current = [[SyncData get].faq objectAtIndex:indexPath.row];
    cell.lblFaqCategory.text=current.name;
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
   FaqDetailsViewController *main= [ self.storyboard instantiateViewControllerWithIdentifier:@"FaqDetailsViewController"];
    
    Faq *selected = [[SyncData get].faq objectAtIndex:indexPath.row];
    main.selected_info=selected.descript;
    
    
   [self.navigationController pushViewController: (UIViewController *)main animated:YES];

}

-(void)viewDidAppear:(BOOL)animated{
     self.screenName=@"Faq";
    [super viewDidAppear:YES];
 self.navigationItem.title = [MCLocalization stringForKey:@"faq_bar"];
 self.navigationItem.backBarButtonItem.title= [MCLocalization stringForKey:@"back"];

}
@end
