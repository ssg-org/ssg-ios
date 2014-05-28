//
//  CitiesBuilder.m
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "CitiesBuilder.h"
#import "City.h"
#import "AppDelegate.h"

@implementation CitiesBuilder

+ (NSMutableArray*)build:(NSDictionary*)json {
    
    AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context =appDelagate.managedObjectContext;
    NSMutableArray * all_cities = [[NSMutableArray alloc]init];
    NSDictionary * cities = [[NSDictionary alloc]init];
    cities= [json objectForKey:@"cities"];
    for (NSDictionary * ccc in cities) {
        
        City *city = [NSEntityDescription
                      insertNewObjectForEntityForName:@"City"
                      inManagedObjectContext:context];
        [city setCity: [ccc objectForKey:@"name"]];
        [city setId_: [ccc objectForKey:@"id"]];
        [all_cities addObject:city];
        
    }
    return all_cities;
}

+(NSMutableArray *)getAllCitiesFromDatabase{
    
    NSMutableArray * object_from_db= [[NSMutableArray alloc]init];
    AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context =appDelagate.managedObjectContext;
    //get object from database
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"City"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (City *city in fetchedObjects) {
        [object_from_db addObject:city];
    }
    return object_from_db;
}




@end
