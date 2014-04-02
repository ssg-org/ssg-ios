//
//  Builder.m
//  NibeFestival
//
//  Created by Zaharije Pasalic on 2/18/14.
//  Copyright (c) 2014 Klika d.o.o. All rights reserved.
//

#import "Builder.h"

@implementation Builder

+ (NSString*) buildFilePath:(NSString*)filename {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:filename];
}

+ (void)serialize:(NSData*)data  filePath:(NSString*)filename {
    [data writeToFile:[Builder buildFilePath:filename] atomically:NO];
}

+(NSData*)deserialize:(NSString*)filename {
    NSString *filePath = [Builder buildFilePath:filename];
    return [[NSData alloc] initWithContentsOfFile:filePath];
}


@end
