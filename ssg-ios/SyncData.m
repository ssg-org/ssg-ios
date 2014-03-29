//
//  SyncData.m
//  ssg-ios
//
//  Created by Haris Dautovic on 29/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SyncData.h"

@implementation SyncData


static SyncData *__mainData;

- (id) init {
    self = [super init];
    if (self != nil) {
       
    }
    return self;
}

+ (SyncData*)get
{
    if (__mainData == nil) {
        __mainData = [[super allocWithZone:NULL] init];
        
    }
    return __mainData;
}

- (void)mock{

}



@end
