//
//  SubCategoryViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 04/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Categories.h"

@protocol SubCategoryDelegate <NSObject>

-(void)selectSubCategory:(Categories*)category;

@end


@interface SubCategoryViewController : UIViewController

@property NSMutableArray * subcategory;

@property (retain) id<SubCategoryDelegate> delegate_subcategory;

@end
