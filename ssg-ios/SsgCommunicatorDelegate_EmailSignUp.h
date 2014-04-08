//
//  SsgCommunicatorDelegate_EmailSignUp.h
//  ssg-ios
//
//  Created by Haris Dautovic on 08/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@protocol SsgCommunicatorDelegate;

@interface SsgCommunicatorDelegate_EmailSignUp : NSObject

@property (strong,nonatomic) id<SsgCommunicatorDelegate>  emailSignup_delegate;

-(void)signUpWithEmail:(User *)user;

@end
