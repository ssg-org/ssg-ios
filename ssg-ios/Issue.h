//
//  Issue.h
//  ssg-ios
//
//  Created by Haris Dautovic on 18/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Issue : NSManagedObject

@property (nonatomic, retain) NSNumber *category_id;
@property (nonatomic, retain) NSNumber *city_id;
@property (nonatomic, retain) NSString *descript;
@property (nonatomic, retain) NSData *image;
@property (nonatomic, retain) NSNumber *location_lat;
@property (nonatomic, retain) NSNumber *location_lng;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *category_name;
@property (nonatomic, retain) NSString *city_name;

@end
