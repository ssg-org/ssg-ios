//
//  CategoriesBuilder.m
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "CategoriesBuilder.h"
#import "AppDelegate.h"
#import "Categories.h"
#import "Builder.h"

@implementation CategoriesBuilder


+ (NSMutableArray*)build:(NSDictionary*)json data:(NSData*)data {
    
    AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context =appDelagate.managedObjectContext;
    
    
    NSMutableArray * all_categories = [[NSMutableArray alloc]init];
    
    NSDictionary * documents = [[NSDictionary alloc]init];
    documents=[json objectForKey:@"document"];
    
    NSDictionary * categories = [[NSDictionary alloc]init];
    categories= [documents objectForKey:@"categories"];
    
    
    for (NSDictionary * category in categories) {
        Categories * c = [NSEntityDescription
                          insertNewObjectForEntityForName:@"Categories"
                          inManagedObjectContext:context];
        
        @try {
           
            
            
            [c setColor:[category objectForKey:@"color"]];
            [c setDescript: [category objectForKey:@"description"]];
            [c setId_:[category objectForKey:@"id"]];
            [c setName:[category objectForKey:@"name"]];
            [c setParent_id:[category objectForKey:@"parent_id"]];
            
            
        }
        @catch (NSException *exception) {
            
        }
        @finally {
           
            [all_categories addObject:c];
        }

    }
    
    
    [Builder serialize:data filePath:@"categories.json"];
    return all_categories;
}

@end
