//
//  SsgAPI.h
//  ssg-ios
//
//  Created by Haris Dautovic on 03/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SsgAPI : NSObject

+(NSString*)getHostName;

+(NSString*)buildSingature:(NSMutableDictionary*)params;

+ (NSString*)base64forData:(NSData*)theData;

+(NSString*)generateTimestamp;



@end
