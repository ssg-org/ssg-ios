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


@implementation SsgCommunicatorDelegate_CreateIssue


-(void)createIssue:(Issue*)issue : (UIImage *)image{

    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://10.0.1.59:3000"]];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
        [params setValue:issue.title forKey:@"title"];
        [params setValue:issue.descript forKey:@"description"];
        [params setValue: [issue.city_id stringValue] forKey:@"city_id"];
        [params setValue: [issue.category_id stringValue]forKey:@"category_id"];
        [params setValue:  [issue.location_lat stringValue] forKey:@"lat"];
        [params setValue:  [issue.location_lng stringValue ]forKey:@"lng"];
    
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
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@ ***** %@", operation.responseString, error);
        
    }];
    
    //Start request
    [op start];
    
    
    
    
//    NSData *imageToUpload = UIImageJPEGRepresentation(image, 1.0);
//    
//    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
//    [params setValue:issue.title forKey:@"title"];
//    [params setValue:issue.descript forKey:@"description"];
//    [params setValue:issue.city_id forKey:@"city_id"];
//    [params setValue:issue.category_id forKey:@"category_id"];
//    [params setValue:issue.location_lat forKey:@"lat"];
//    [params setValue:issue.location_lng forKey:@"lng"];
//    
//    AFAppDotNetAPIClient *client= [AFAppDotNetAPIClient sharedClient:@"http://127.0.0.1:3000/api/v1"];
//                                
//    
//    [client POST:@"/create_issue"
//    parameters: params constructingBodyWithBlock:^(id <AFMultipartFormData>formData) {[formData appendPartWithFileData: imageToUpload name:@"image" fileName:@"temp.jpeg"mimeType:@"image/jpeg"];}
//    success:^(NSURLSessionDataTask *task, id responseObject) {
//                                         
//                                         
//                                         
//    }
//                                 
//    failure:^(NSURLSessionDataTask *task, NSError *error) {
//                                         
//                                         
//                                         
//    }];
}

@end
