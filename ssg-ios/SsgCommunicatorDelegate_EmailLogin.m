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

@implementation SsgCommunicatorDelegate_EmailLogin


-(void)loginWithEmail:(NSString *) email : (NSString *) password {

    
    ///api/v1/sessions?email=administrator@sredisvojgrad.com&password=admin
    //Set params
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
        [params setValue:email forKey:@"email"];
        [params setValue:password forKey:@"password"];
    
    [SsgAPI ssgApiCall:@"/sessions"  requestType:@"POST" params:params  completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            
            
            [self.email_delegate fetchingData:error];
            
        } else {
            
            
            NSError* jsonError;
            NSDictionary* json = [NSJSONSerialization
                                  JSONObjectWithData:data
                                  options:kNilOptions
                                  error:&jsonError];
            
             NSLog(@"%@ ",json);
            
            if (jsonError != NULL) {
                
                [self.email_delegate fetchingData:jsonError];
            }
            else {
                
                NSDictionary * documents = [[NSDictionary alloc]init];
                documents=[json objectForKey:@"document"];
                
                NSString *access_token=[documents objectForKey:@"access_token"];
                
                
                if (access_token==nil) {
                    
                    NSDictionary * status = [[NSDictionary alloc]init];
                    status=[json objectForKey:@"status"];
                    NSString *message= [status objectForKey:@"message"];
                    
                }
                else{
                
                    //Save user into database
                    AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
                    NSManagedObjectContext *context =appDelagate.managedObjectContext;
                
                    User * user = [NSEntityDescription
                                      insertNewObjectForEntityForName:@"User"
                                      inManagedObjectContext:context];

                    user.access_token=access_token;
                    [context save:nil];
                }
                
                
                
                
                
            }
        }
    }];

    
    
}


@end
