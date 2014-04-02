//
//  Builder.h
//  NibeFestival
//
//  Created by Zaharije Pasalic on 2/18/14.
//  Copyright (c) 2014 Klika d.o.o. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Builder : NSObject

+ (NSString*) buildFilePath:(NSString*)filename;
+ (void)serialize:(NSData*)data  filePath:(NSString*)filename;
+ (NSData*)deserialize:(NSString*)filename;


@end
