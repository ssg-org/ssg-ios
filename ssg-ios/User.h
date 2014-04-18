//
//  User.h
//  ssg-ios
//
//  Created by Haris Dautovic on 18/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * access_token;
@property (nonatomic, retain) NSNumber * city_id;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstname;
@property (nonatomic, retain) NSString * lastname;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * profile_picture;

@end
