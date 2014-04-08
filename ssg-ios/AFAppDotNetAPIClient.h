//
//  AFAppDotNetAPIClient.h
//  ssg-ios
//
//  Created by Haris Dautovic on 07/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface AFAppDotNetAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient:(NSString*) url ;

@end
