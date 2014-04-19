//
//  SsgCommunicatorDelegate_CreateIssue.m
//  ssg-ios
//
//  Created by Haris Dautovic on 07/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SsgCommunicatorDelegate_CreateIssue.h"
//#import "AFAppDotNetAPIClient.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "SsgAPI.h"
#import "SyncData.h"

@implementation SsgCommunicatorDelegate_CreateIssue


-(void)createIssue:(Issue*)issue : (UIImage *)image : (NSString*)accessToken{

    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString: [SsgAPI getHostName]]];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
        [params setValue:issue.title forKey:@"title"];
        [params setValue:issue.descript forKey:@"description"];
        [params setValue: [issue.city_id stringValue] forKey:@"city_id"];
        [params setValue: [issue.category_id stringValue]forKey:@"category_id"];
        [params setValue:  [issue.location_lat stringValue] forKey:@"lat"];
        [params setValue:  [issue.location_lng stringValue ]forKey:@"lng"];
        [params setValue: accessToken forKey:@"access_token"];
    
       //set time stamp
        [params setValue:@"12312312" forKey:@"ts"];
    
      //Set signature
    NSString* signature = [SsgAPI buildSingature:params];
        [params setValue:signature forKey:@"signature"];
    
    
    NSString * paramNameForImage=@"image";

    AFHTTPRequestOperation *op = [manager POST:@"/api/v1/issues" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //do not put image inside parameters dictionary as I did, but append it!
        [formData appendPartWithFileData:imageData name:paramNameForImage fileName:@"photo.jpg" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
        
   
        /*
        document =     {
            url = "http://10.0.1.59:3000/issues/cfhchf--2";
        };
        status =     {
            code = 0;
            message = ok;
        };
         */
        NSDictionary * documents = [[NSDictionary alloc]init];
        documents=[responseObject objectForKey:@"document"];
        
        NSString *url=[documents objectForKey:@"url"];
        [SyncData get].issueResponseUrl=url;
        
    
    
        NSDictionary * status = [[NSDictionary alloc]init];
        status=[responseObject objectForKey:@"status"];
        NSString* code=[[status objectForKey:@"code"]stringValue] ;
        [self.createIssue_delegate getResponse:code :responseObject];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@ ***** %@", operation.responseString, error);
        NSDictionary * status = [[NSDictionary alloc]init];
        status=[operation.responseObject objectForKey:@"status"];
        NSString* code=[[status objectForKey:@"code"]stringValue] ;
        [self.createIssue_delegate getResponse:code :operation.responseObject];
        
    }];
    
    //Start request
    [op start];
    
}

@end
