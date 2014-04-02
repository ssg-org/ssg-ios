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

@implementation SsgCommunicator


- (void)loadCitiesAndCategories{

  
    NSString *urlAsString = @"http://10.0.1.55:3000/api/v1/info";
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        
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

@end
