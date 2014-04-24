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

@implementation CategoriesBuilder


+ (NSMutableArray*)build:(NSDictionary*)json {
    
    AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context =appDelagate.managedObjectContext;
    
    
    NSMutableArray * all_categories = [[NSMutableArray alloc]init];
    NSDictionary * categories = [[NSDictionary alloc]init];
    categories= [json objectForKey:@"categories"];
    
    
    for (NSDictionary * category in categories) {
        Categories * c = [NSEntityDescription
                          insertNewObjectForEntityForName:@"Categories"
                          inManagedObjectContext:context];
        
           
            [c setColor:[category objectForKey:@"color"]];
            if ([category objectForKey:@"description"] != [NSNull null]) {
                  [c setDescript: [category objectForKey:@"description"]];
            }
        
      
            [c setIcon:[category objectForKey:@"icon"]];
            [c setId_:[category objectForKey:@"id"]];
            [c setName:[category objectForKey:@"name"]];
            
            if ([category objectForKey:@"parent_id"]!= [NSNull null]) {
                [c setParent_id:[category objectForKey:@"parent_id"]];
            }
            [all_categories addObject:c];
    }

    return all_categories;
}

+(NSMutableArray *)getAllCategoriesFromDatabase{
    
    NSMutableArray * object_from_db= [[NSMutableArray alloc]init];
    
    AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context =appDelagate.managedObjectContext;
    
    
    //get object from database
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Categories"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (Categories *category in fetchedObjects) {
        
        
        [object_from_db addObject:category];
        
    }
    
    return object_from_db;
}

@end
