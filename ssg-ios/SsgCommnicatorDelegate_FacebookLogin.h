//
//  SsgCommnicatorDelegate_FacebookLogin.h
//  ssg-ios
//
//  Created by Haris Dautovic on 04/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SsgCommunicatorDelegate.h"
#import <FacebookSDK/FacebookSDK.h>


@protocol SsgCommunicatorDelegate;

@interface SsgCommnicatorDelegate_FacebookLogin : NSObject

@property (strong, nonatomic) id <SsgCommunicatorDelegate> facebook_delegate;

- (void)loginWithFacebook:(id <FBGraphUser> )user;


@end
