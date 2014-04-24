//
//  SsgAPI.m
//  ssg-ios
//
//  Created by Haris Dautovic on 03/04/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SsgAPI.h"
#import <CommonCrypto/CommonHMAC.h>
#include <sys/time.h>

@implementation SsgAPI

+(NSString*)getHostName{

    return @"http://username:pass@dev.ulica.ba";
}


+(NSString*)buildSingature:(NSMutableDictionary*)params {
    
    //Sort keys
    NSArray *sortedKeys = [[params allKeys] sortedArrayUsingSelector: @selector(compare:)];
    NSMutableString * signature = [[NSMutableString alloc]init];
    
    for (NSString *key in sortedKeys){
        NSLog(@"KEY %@", key);
        NSLog(@"VAL %@", [params objectForKey:key]);
        [signature appendString: key];
        [signature appendString:@"="];
        [signature appendString:[params objectForKey:key]];
        [signature appendString:@"&"];
        
    }
    
    //Substring last char
    [signature deleteCharactersInRange:NSMakeRange([signature length]-1, 1)];
    
    
    //Generate secret SHA256
    NSString* key = @"secret";
    NSString* data = signature;
    
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [data cStringUsingEncoding:NSUTF8StringEncoding];
    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSData *hash = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
    
    NSLog(@"SHA: %@",hash);
    
    NSLog(@"%@", hash);
    NSString* s = [self base64forData:hash];
    
    NSLog(@"BASE64: %@",s);
    
    return s;
}

+ (NSString*)base64forData:(NSData*)theData {
    const uint8_t* input = (const uint8_t*)[theData bytes];
    NSInteger length = [theData length];
    
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    
    NSMutableData* data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t* output = (uint8_t*)data.mutableBytes;
    NSInteger i;
    for (i=0; i < length; i += 3) {
        NSInteger value = 0;
        NSInteger j;
        for (j = i; j < (i + 3); j++) {
            value <<= 8;
            
            if (j < length) { value |= (0xFF & input[j]);} } NSInteger theIndex = (i / 3) * 4; output[theIndex + 0] = table[(value >> 18) & 0x3F];
        output[theIndex + 1] = table[(value >> 12) & 0x3F];
        output[theIndex + 2] = (i + 1) < length ? table[(value >> 6) & 0x3F] : '=';
        output[theIndex + 3] = (i + 2) < length ? table[(value >> 0) & 0x3F] : '=';
        
    }
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+(NSString*)generateTimestamp{

   time_t unixTime = (time_t) [[NSDate date] timeIntervalSince1970];
   NSString *str = [NSString stringWithFormat:@"%ld", unixTime];
   return  str ;
}

@end
