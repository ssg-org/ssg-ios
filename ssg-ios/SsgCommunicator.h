//
//  SsgCommunicator.h
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SsgCommunicatorDelegate.h"

@protocol SsgCommunicatorDelegate;

@interface SsgCommunicator : NSObject

@property (weak, nonatomic) id<SsgCommunicatorDelegate> delegate;

- (void)loadCities;
- (void)loadCategories;

@end
