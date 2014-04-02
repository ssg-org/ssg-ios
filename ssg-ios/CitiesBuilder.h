//
//  CitiesBuilder.h
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CitiesBuilder : NSObject

+ (NSMutableArray*) build:(NSDictionary*)json data:(NSData*)data;

@end
