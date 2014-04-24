//
//  SsgCommnicatorDelegate_Info.m
//  ssg-ios
//
//  Created by Haris Dautovic on 04/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SsgCommnicatorDelegate_Info.h"
#import "SsgAPI.h"
#import "Builder.h"
#import "CategoriesBuilder.h"
#import "CitiesBuilder.h"

@implementation SsgCommnicatorDelegate_Info


-(void)getCategoriesAndCities{

    //Set params
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];

    
    [SsgAPI ssgApiCall:@"/info"  requestType:@"GET" params:params  completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSLog(@" RESPONSE: %@", [response URL]);
        
        if (error) {
            
            
            [self.info_delegate fetchingData:error];
            
        } else {
            
            
            NSError* jsonError;
            NSDictionary* json = [NSJSONSerialization
                                  JSONObjectWithData:data
                                  options:kNilOptions
                                  error:&jsonError];
            
             NSLog(@"%@ ",json);
            
            if (jsonError != NULL) {
                
                [self.info_delegate fetchingData:jsonError];
                
            }
            else {
                
                SyncData *syncData = [SyncData get];
                syncData.cities = [CitiesBuilder build:json data:data];
                syncData.categories=[CategoriesBuilder build:json data:data];
                
                [self.info_delegate recivedData:syncData];
            }
        }
    }];


}
@end
