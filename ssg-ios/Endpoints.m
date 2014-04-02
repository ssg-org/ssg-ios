//
//  Endpoints.m
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "Endpoints.h"

@implementation Endpoints


static Endpoints *__mainData;

- (id) init {
    self = [super init];
    if (self != nil) {
        
        __mainData.hostName=@" ";
        
    }
    return self;
}

+ (Endpoints*)get
{
    if (__mainData == nil) {
        __mainData = [[super allocWithZone:NULL] init];
        
    }
    return __mainData;
}

@end
