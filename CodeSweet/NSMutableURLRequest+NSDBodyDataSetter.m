//
//  NSMutableURLRequest+NSDBodyDataSetter.m
//  NSDCode
//
//  Created by NullStackDev on 9/26/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSMutableURLRequest+NSDBodyDataSetter.h"

@implementation NSMutableURLRequest (NSDBodyDataSetter)

-(void)setBodyData:(NSData *)data andIsJSONData:(BOOL)isJSONData{
    self.HTTPBody = data;
    [self setValue:[NSString stringWithFormat:@"%d",data.length] forHTTPHeaderField:@"Content-Length"];
    [self setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
}

@end
