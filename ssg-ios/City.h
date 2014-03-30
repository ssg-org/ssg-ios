//
//  City.h
//  ssg-ios
//
//  Created by Haris Dautovic on 30/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface City : NSManagedObject

@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSSet *users;
@end

@interface City (CoreDataGeneratedAccessors)

- (void)addUsersObject:(User *)value;
- (void)removeUsersObject:(User *)value;
- (void)addUsers:(NSSet *)values;
- (void)removeUsers:(NSSet *)values;

@end
