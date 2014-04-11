//
//  SsgCommunicatorDelegate_EmailSignUp.m
//  ssg-ios
//
//  Created by Haris Dautovic on 08/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SsgCommunicatorDelegate_EmailSignUp.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "SsgAPI.h"

@implementation SsgCommunicatorDelegate_EmailSignUp

-(void)signUpWithEmail:(User *)user{

    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:[SsgAPI getHostName]]];
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    [params setValue:user.email forKey:@"email"];
    [params setValue:user.password forKey:@"password"];
    [params setValue:[user.city_id stringValue ] forKey:@"city_id"];
    [params setValue:user.firstname forKey:@"first_name"];
    [params setValue:user.lastname  forKey:@"last_name"];
    
    //set time stamp
    [params setValue:@"12312312" forKey:@"ts"];
    
    //Set signature
    NSString* signature = [SsgAPI buildSingature:params];
    [params setValue:signature forKey:@"signature"];
    
    
    AFHTTPRequestOperation *op = [manager POST:@"/api/v1/sessions/signup" parameters:params
                                   success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                      NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
                                       
                                       
                                       NSDictionary * documents = [[NSDictionary alloc]init];
                                       documents=[responseObject objectForKey:@"status"];
                                       NSString* code=[[documents objectForKey:@"code"]stringValue] ;
                                       [self.emailSignup_delegate getResponse:code :responseObject];
                                       
                                       
                                  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    
                                      NSLog(@"Error: %@ ***** %@", operation.responseString, error);
                                      
                                  }];
    
    
    
    //Start request
    [op start];

    

}
@end
