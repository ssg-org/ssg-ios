//
//  SyncData.h
//  ssg-ios
//
//  Created by Haris Dautovic on 29/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Issue.h"

@interface SyncData : NSObject


//Cities
@property (nonatomic,strong) NSMutableArray * cities;

//Categories
@property (nonatomic,strong) NSMutableArray * categories;

//Current issue objects
@property (nonatomic,strong) Issue * current_issue;
@property (nonatomic,strong)UIImage * issue_image;
@property (nonatomic,strong) NSString * issueResponseUrl;

//Signup username and password
@property (nonatomic,strong) NSString * signupPassword;
@property (nonatomic,strong) NSString * signupEmail;

//numberOfFacebookRequest
@property int numberOfFacebookRequest;

//Faq
@property  NSMutableArray * faq;

+ (SyncData*)get;



@end



