//
//  City.h
//  ssg-ios
//
//  Created by Haris Dautovic on 04/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface City : NSManagedObject

@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *icon;
@property (nonatomic, retain) NSNumber *id_;

@end
