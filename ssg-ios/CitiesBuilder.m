//
//  CitiesBuilder.m
//  ssg-ios
//
//  Created by Haris Dautovic on 02/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "CitiesBuilder.h"
#import "City.h"
#import "Builder.h"
#import "AppDelegate.h"

@implementation CitiesBuilder


/*
 http://nibefestival.dk/base/nibeFestival/GetNewsItems/nibefestivalapp/nibe!2012
 */


+ (NSMutableArray*)build:(NSDictionary*)json data:(NSData*)data {
    
    AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context =appDelagate.managedObjectContext;
    
    
    NSMutableArray * all_cities = [[NSMutableArray alloc]init];
    
    NSDictionary * documents = [[NSDictionary alloc]init];
    documents=[json objectForKey:@"document"];
    
    NSDictionary * cities = [[NSDictionary alloc]init];
    cities= [documents objectForKey:@"cities"];
    

    for (NSDictionary * ccc in cities) {
        
        City *city = [NSEntityDescription
                      insertNewObjectForEntityForName:@"City"
                      inManagedObjectContext:context];


        [city setCity: [ccc objectForKey:@"name"]];
        [city setId_: [ccc objectForKey:@"id"]];
        [all_cities addObject:city];
        
    }
    
    
    [Builder serialize:data filePath:@"cities.json"];
    
    return all_cities;
}

@end
