//
//  Categories.h
//  ssg-ios
//
//  Created by Haris Dautovic on 04/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Categories : NSManagedObject

@property (nonatomic, retain) NSString *color;
@property (nonatomic, retain) NSString *descript;
@property (nonatomic, retain) NSString *icon;
@property (nonatomic, retain) NSNumber *id_;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *parent_id;

@end
