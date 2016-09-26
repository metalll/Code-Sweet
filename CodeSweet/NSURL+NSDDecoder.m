//
//  NSURL+NSDDecoder.m
//  NSDCode
//
//  Created by NullStackDev on 9/26/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSURL+NSDDecoder.h"

@implementation NSURL (NSDDecoder)

-(NSDictionary *)dictionaryFromURL{
    NSString * queryString = self.query;
    NSArray * stringPairs = [queryString componentsSeparatedByString:@"&"];
    NSMutableDictionary * kVP = [NSMutableDictionary new];
    for(NSString * pair in stringPairs){
    
        NSArray * bits = [pair componentsSeparatedByString:@"="];
        if(bits.count>1){
            NSString * key = [[bits objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            NSString * value = [[bits objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            [kVP setObject:value forKey:key];
        }
    }
    return kVP;
}

@end
