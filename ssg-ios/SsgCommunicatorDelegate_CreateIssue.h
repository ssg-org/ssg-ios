//
//  SsgCommunicatorDelegate_CreateIssue.h
//  ssg-ios
//
//  Created by Haris Dautovic on 07/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Issue.h"
#import "SsgCommunicatorDelegate.h"

@protocol SsgCommunicatorDelegate;

@interface SsgCommunicatorDelegate_CreateIssue : NSObject

@property (strong,nonatomic) id<SsgCommunicatorDelegate> createIssue_delegate;

-(void)createIssue:(Issue*)issue : (UIImage *)image : (NSString*)accessToken;



@end
