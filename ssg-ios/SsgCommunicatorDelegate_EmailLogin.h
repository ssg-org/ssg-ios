//
//  SsgCommunicatorDelegate_EmailLogin.h
//  ssg-ios
//
//  Created by Haris Dautovic on 04/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SsgCommunicatorDelegate.h"

@protocol SsgCommunicatorDelegate;

@interface SsgCommunicatorDelegate_EmailLogin : NSObject

@property (strong,nonatomic) id<SsgCommunicatorDelegate> email_delegate;

-(void)loginWithEmail:(NSString *) email : (NSString *) password;


@end
