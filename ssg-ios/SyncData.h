//
//  SyncData.h
//  ssg-ios
//
//  Created by Haris Dautovic on 29/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SyncData : NSObject


@property (nonatomic,strong) NSMutableArray * cities;
@property (nonatomic,strong) NSMutableArray * categories;
@property (nonatomic,strong) NSMutableDictionary *keyCharForFontAwesome;


- (void)mock;

+ (SyncData*)get;

+(NSMutableArray*)getAllCity;


@end



