//
//  Issue.h
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Issue : NSManagedObject

@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSNumber * location_lat;
@property (nonatomic, retain) NSNumber * location_lng;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * category_id;
@property (nonatomic, retain) NSNumber * city_id;
@property (nonatomic, retain) NSData * image;

@end
