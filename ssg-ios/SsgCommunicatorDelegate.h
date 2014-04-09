//
//  SsgCommunicatorDelegate.h
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SyncData.h"


@protocol SsgCommunicatorDelegate


- (void)recivedData:(SyncData*)syncData;
- (void)fetchingData:(NSError *)error;
- (void)apiStatusCode:(NSInteger)code;


@end
