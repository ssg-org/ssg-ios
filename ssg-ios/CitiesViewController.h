//
//  CitiesViewController.h
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SsgCommunicatorDelegate.h"
#import "SsgCommnicatorDelegate_Info.h"
#import "City.h"
#import "GAITrackedViewController.h"


@protocol CitiesDelegate <NSObject>

- (void)getSelectedCity:(City *)city;

@end

@interface CitiesViewController : GAITrackedViewController <UITableViewDataSource, UITableViewDelegate, SsgCommunicatorDelegate>
{
	SsgCommnicatorDelegate_Info *_ssgCommunicator;
	NSMutableArray *cities;  //cities names
	NSMutableDictionary *cities_object; //cities objects (Model.City)
}

@property (strong, nonatomic) IBOutlet UITableView *tblComponent;
@property (retain) id <CitiesDelegate> delegate_cities;



@end
