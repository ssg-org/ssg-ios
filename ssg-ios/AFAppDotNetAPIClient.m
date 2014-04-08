//
//  AFAppDotNetAPIClient.m
//  ssg-ios
//
//  Created by Haris Dautovic on 07/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "AFAppDotNetAPIClient.h"

//static NSString * const AFAppDotNetAPIBaseURLString = @"https://alpha-api.app.net/";

@implementation AFAppDotNetAPIClient

+ (instancetype)sharedClient:(NSString*) url {
    static AFAppDotNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:url]];
        [_sharedClient setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey]];
    });
    
    return _sharedClient;
}

@end
