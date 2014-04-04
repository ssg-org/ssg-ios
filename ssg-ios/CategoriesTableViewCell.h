//
//  CategoriesTableViewCell.h
//  ssg-ios
//
//  Created by Haris Dautovic on 03/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FAImageView.h"

@interface CategoriesTableViewCell : UITableViewCell


@property (strong, nonatomic) IBOutlet FAImageView *imgCategory;

@property (strong, nonatomic) IBOutlet UILabel *lblCategoryName;


@end
