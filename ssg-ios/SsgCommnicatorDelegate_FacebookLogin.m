//
//  SsgCommnicatorDelegate_FacebookLogin.m
//  ssg-ios
//
//  Created by Haris Dautovic on 04/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SsgCommnicatorDelegate_FacebookLogin.h"
#import "SsgAPI.h"


@implementation SsgCommnicatorDelegate_FacebookLogin


- (void) loginWithFacebook: (id<FBGraphUser>)user {
    
    //Set params
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    [params setValue: user[@"email"] forKey:@"email"];
    [params setValue:user.id forKey:@"fb_id"];
    [params setValue:user.first_name forKey:@"first_name"];
    [params setValue:user.last_name forKey:@"last_name"];
    
    [SsgAPI ssgApiCall:@"/sessions/fb_create"  requestType:@"POST" params:params  completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.facebook_delegate fetchingData:error];
            
        } else {
            NSError* jsonError;
            NSDictionary* json = [NSJSONSerialization
                                  JSONObjectWithData:data
                                  options:kNilOptions
                                  error:&jsonError];
            
             NSLog(@"%@ ",json);
            
            if (jsonError != NULL) {
                
                [self.facebook_delegate fetchingData:jsonError];
            }
            else {
                
                // SyncData *syncData = [SyncData get];
                //syncData.cities = [CitiesBuilder build:json data:data];
                //syncData.categories=[CategoriesBuilder build:json data:data];
                
                // [self.delegate receivedCategoriesAndCities:syncData];
                
            }
        }
    }];

}


@end
