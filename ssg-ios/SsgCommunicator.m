//
//  SsgCommunicator.m
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SsgCommunicator.h"
#import "CitiesBuilder.h"
#import "CategoriesBuilder.h"
#import "SsgAPI.h"



@implementation SsgCommunicator


- (void)loadCitiesAndCategories{
    
    //Set params
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    [params setValue:@"haris" forKey:@"user"];
    [params setValue:@"1234" forKey:@"password"];
    [params setValue:@"1234" forKey:@"aa"];
    
    [SsgAPI ssgApiCall:@"/info"  requestType:@"GET" params:params  completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingCategoriesAndCitiesFailed:error];
            
        } else {
            NSError* jsonError;
            NSDictionary* json = [NSJSONSerialization
                                  JSONObjectWithData:data
                                  options:kNilOptions
                                  error:&jsonError];
            
            NSLog(@"%@ ",json);
            
            if (jsonError != NULL) {
                
                [self.delegate fetchingCategoriesAndCitiesFailed:jsonError];
            }
            else {
                
                SyncData *syncData = [SyncData get];
                syncData.cities = [CitiesBuilder build:json data:data];
                syncData.categories=[CategoriesBuilder build:json data:data];
                
                [self.delegate receivedCategoriesAndCities:syncData];
                
            }
        }
    }];
}

- (void) loginWithFacebook: (NSString *)email : (NSString *)token {





}

@end
