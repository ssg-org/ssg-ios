//
//  SyncData.m
//  ssg-ios
//
//  Created by Haris Dautovic on 29/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SyncData.h"
#import "AppDelegate.h"
#import "City.h"

@implementation SyncData


static SyncData *__mainData;

- (id) init {
    self = [super init];
    if (self != nil) {
       
    }
    return self;
}

+ (SyncData*)get
{
    if (__mainData == nil) {
        __mainData = [[super allocWithZone:NULL] init];
        
    }
    return __mainData;
}

- (void)mock{

}
+(NSMutableArray*)getAllCity{

    NSMutableArray *temp = [[NSMutableArray alloc]init];
    
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
       
        
        [temp addObject:city];
       
    }
    
    NSArray *cities =@[@"Velika Kladusa", @"Sarajevo", @"Bihac", @"Mostar", @"Tuzla", @"Zenica"];
   
    if ([temp count]==0) {
        
         NSError *error;
        for (int i=0; i<cities.count; i++) {
            
            City *city = [NSEntityDescription
                          insertNewObjectForEntityForName:@"City"
                          inManagedObjectContext:context];
            
            city.city=[cities objectAtIndex:i];
            [context save:nil];
            if (![context save:&error]) {
                NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
            }
            else{
                
                [temp addObject:city];
            }
            
        }
    }
    
    return temp;
}



@end
