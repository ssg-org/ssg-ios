//
//  CategoryViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 28/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SsgCommnicatorDelegate_Info.h"
#import "SsgCommunicatorDelegate.h"
#import "Categories.h"
#import "SubCategoryViewController.h"
#import "GAITrackedViewController.h"

@protocol CategoryDelegate <NSObject>

-(void)selectCategory:(Categories*)category;

@end


@interface CategoryViewController : GAITrackedViewController<SsgCommunicatorDelegate,UITableViewDataSource,UITableViewDelegate>
{
    SsgCommnicatorDelegate_Info * _ssgCommunicator;
    NSMutableArray * categories;
    NSMutableArray *categoriesAndSubcategories;
}

@property (strong, nonatomic) IBOutlet UITableView *tblComponent;
@property (retain) id<CategoryDelegate>delegate_category;

@property SubCategoryViewController*subcategoryViewController;


@end 
