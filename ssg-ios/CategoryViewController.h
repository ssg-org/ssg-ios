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

@interface CategoryViewController : UIViewController<SsgCommunicatorDelegate>
{
    SsgCommnicatorDelegate_Info * _ssgCommunicator;
    NSMutableArray * categories;
}

@property (strong, nonatomic) IBOutlet UITableView *tblComponent;

@end 
