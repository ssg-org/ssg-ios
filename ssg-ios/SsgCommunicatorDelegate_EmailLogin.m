//
//  SsgCommunicatorDelegate_EmailLogin.m
//  ssg-ios
//
//  Created by Haris Dautovic on 04/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SsgCommunicatorDelegate_EmailLogin.h"
#import "SsgAPI.h"
#import "AppDelegate.h"
#import "User.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

@implementation SsgCommunicatorDelegate_EmailLogin


-(void)loginWithEmail:(NSString *) email : (NSString *) password {


    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:[SsgAPI getHostName] ]];
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    [params setValue:email forKey:@"email"];
    [params setValue:password forKey:@"password"];
    
    //set time stamp
    [params setValue:@"12312312" forKey:@"ts"];
    
    //Set signature
    NSString* signature = [SsgAPI buildSingature:params];
    [params setValue:signature forKey:@"signature"];
    
    
    AFHTTPRequestOperation *op = [manager POST:@"/api/v1/sessions" parameters:params
                                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                           NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
                                           
                                           NSDictionary * documents = [[NSDictionary alloc]init];
                                           documents=[responseObject objectForKey:@"status"];
                                           NSString *code=[[documents objectForKey:@"code"] stringValue ];
                                        
                                           //call delagete function 
                                           [self.email_delegate getResponse:code :responseObject];
                                           
                                           if ([code isEqualToString:@"0"]) {
                                               
                                               
                                               NSDictionary * documents = [[NSDictionary alloc]init];
                                               documents=[responseObject objectForKey:@"document"];
                                               
                                               NSString *access_token=[documents objectForKey:@"access_token"];
                                               
                                               //Save user into database
                                               AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
                                               NSManagedObjectContext *context =appDelagate.managedObjectContext;
                                               
                                               User * user = [NSEntityDescription
                                                              insertNewObjectForEntityForName:@"User"
                                                              inManagedObjectContext:context];
                                               
                                               user.access_token=access_token;
                                               [context save:nil];
                                               
                                               
                                           }
                                           
                                           
                                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                           
                                           NSLog(@"Error: %@ ***** %@", operation.responseString, error);
                                           
                                           NSDictionary * documents = [[NSDictionary alloc]init];
                                           documents=[operation.responseObject objectForKey:@"status"];
                                            NSString* code=[[documents objectForKey:@"code"]stringValue ] ;
                                           
                                           
                                           // NSString* message=[documents objectForKey:@"message"];
                                           
                                           
                                           //call delagete function
                                           [self.email_delegate getResponse:code :operation.responseObject];
                                           
                                           
                                           
                                           
                                       }];
    
    
    
    //Start request
    [op start];
 
}


@end
