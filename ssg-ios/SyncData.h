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


@property (nonatomic,strong) NSMutableArray * cities;
@property (nonatomic,strong) NSMutableArray * categories;
@property (nonatomic,strong) NSMutableDictionary *keyCharForFontAwesome;
@property (nonatomic,strong) Issue * current_issue;
@property (nonatomic,strong)UIImage * issue_image;



- (void)mock;

+ (SyncData*)get;

+(NSMutableArray*)getAllCity;


@end



