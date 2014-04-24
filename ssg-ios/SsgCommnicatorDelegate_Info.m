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
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

@implementation SsgCommnicatorDelegate_Info


-(void)getCategoriesAndCities{
    
    
  // NSLog(@"TIME STAMP: %@ ",[SsgAPI generateTimestamp]);
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:[SsgAPI getHostName] ]];
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    
    //set time stamp
    [params setValue:[SsgAPI generateTimestamp] forKey:@"ts"];
    
    //Set signature
    NSString* signature = [SsgAPI buildSingature:params];
    [params setValue:signature forKey:@"signature"];
    
    
    AFHTTPRequestOperation *op = [manager GET:@"/api/v1/info" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
    
        
        NSDictionary * json = [responseObject objectForKey:@"document"];
        
        SyncData *syncData = [SyncData get];
        syncData.cities = [CitiesBuilder build:json data:responseObject];
        syncData.categories=[CategoriesBuilder build:json data:responseObject];
        [self.info_delegate recivedData:syncData];

        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
        
    
    }];
    
    [op start];
}
@end
