//
//  SsgCommnicatorDelegate_Info.h
//  ssg-ios
//
//  Created by Haris Dautovic on 04/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SsgCommunicatorDelegate.h"


@protocol SsgCommunicatorDelegate;

@interface SsgCommnicatorDelegate_Info : NSObject

@property (strong, nonatomic) id <SsgCommunicatorDelegate> info_delegate;

- (void)getCategoriesAndCities;


@end
