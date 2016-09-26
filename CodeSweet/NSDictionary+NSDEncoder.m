//
//  NSDictionary+NSDEncoder.m
//  NSDCode
//
//  Created by NullStackDev on 9/26/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDictionary+NSDEncoder.h"

@implementation NSDictionary (NSDEncoder)

-(NSString *)encodedStringForHTTPBody{
    NSMutableArray * partsArray = [NSMutableArray new];
    for(NSString * key in [self allKeys]){
        NSString * val = [self objectForKey:key];
        if(key&&val){
            [partsArray addObject:
             [NSString stringWithFormat:@"%@=%@",[key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[val stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        }
        else return nil;
    }
    return [partsArray componentsJoinedByString:@"&"];
}

@end
