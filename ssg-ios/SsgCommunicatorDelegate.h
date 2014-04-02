//
//  SsgCommunicatorDelegate.h
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SyncData.h"


@protocol SsgCommunicatorDelegate


- (void)receivedCategoriesAndCities:(SyncData*)syncData;
- (void)fetchingCategoriesAndCitiesFailed:(NSError *)error;

@end
