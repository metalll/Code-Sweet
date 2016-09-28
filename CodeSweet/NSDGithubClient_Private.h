//
//  NSDGithubClient_Private.h
//  NSDCode
//
//  Created by NullStackDev on 9/28/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDGithubClient.h"

@interface NSDGithubClient ()

+(NSString *)URLStringWithPathComponent:(NSString *) pathComponent;

+(void)searchForPath:(NSString *)path
      andQueryString:(NSString *)query
       andCompletion:(void(^)(NSDictionary * reponceDic,NSString * errString))completion;

+(void)processJSONData:(NSData *)JSONData
        andErrorString:(NSString *)errorString
         andCompletion:(void (^)(NSDictionary *, NSString *))completion;

@end
