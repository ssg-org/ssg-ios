//
//  SsgCommnicatorDelegate_FacebookLogin.m
//  ssg-ios
//
//  Created by Haris Dautovic on 04/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SsgCommnicatorDelegate_FacebookLogin.h"
#import "SsgAPI.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "User.h"
#import "AppDelegate.h"

@implementation SsgCommnicatorDelegate_FacebookLogin


- (void) loginWithFacebook: (id<FBGraphUser>)user {
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString: [SsgAPI getHostName]]];
    
    //Set params
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    [params setValue: user[@"email"] forKey:@"email"];
    [params setValue:user.id forKey:@"fb_id"];
    [params setValue:user.first_name forKey:@"first_name"];
    [params setValue:user.last_name forKey:@"last_name"];
    
    //Set time stamp
    [params setValue:@"12312312" forKey:@"ts"];
    
    //Set signature
    NSString* signature = [SsgAPI buildSingature:params];
    [params setValue:signature forKey:@"signature"];
    
    AFHTTPRequestOperation *op = [manager POST:@"/api/v1/sessions/fb_create" parameters:params
                                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                           
                                           NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
                                           NSDictionary * documents = [[NSDictionary alloc]init];
                                           documents=[responseObject objectForKey:@"status"];
                                           NSString * code=[[documents objectForKey:@"code"]stringValue];
                                           
                                           //call delagete function
                                           [self.facebook_delegate getResponse:code :responseObject];
                                           
                                           if ([code isEqualToString:@"0"]) {
                                               
                                               NSDictionary * documents = [[NSDictionary alloc]init];
                                               documents=[responseObject objectForKey:@"document"];
                                               NSString *access_token=[documents objectForKey:@"access_token"];
                                               NSDictionary *user_picture = [documents objectForKey:@"avatar_path"];
                                               NSDictionary * image = [user_picture objectForKey:@"image"];
                                               NSString *    url =[image objectForKey:@"url"];
                                               NSDictionary * userJson = [documents objectForKey:@"user"];
                                               NSString * firstname = [userJson objectForKey:@"first_name"];
                                               NSString  * lastname = [userJson objectForKey:@"last_name"];
                                               
                                               //Save user into database
                                               AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
                                               NSManagedObjectContext *context =appDelagate.managedObjectContext;
                                               User * user = [NSEntityDescription
                                                              insertNewObjectForEntityForName:@"User"
                                                              inManagedObjectContext:context];
                                               
                                               user.access_token=access_token;
                                               user.profile_picture=url;
                                               user.firstname=firstname;
                                               user.lastname =lastname;
                                               [context save:nil];
                                           }
    
                                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                           NSLog(@"Error: %@ ***** %@", operation.responseString, error);
                                           NSDictionary * documents = [[NSDictionary alloc]init];
                                           documents=[operation.responseObject objectForKey:@"status"];
                                           NSString * code=[[documents objectForKey:@"code"]stringValue ];
                                           
                                           //call delagete function
                                           [self.facebook_delegate getResponse:code :operation.responseObject];
                                           
                                       }];
    
    //Start request
    [op start];
    
}


@end
