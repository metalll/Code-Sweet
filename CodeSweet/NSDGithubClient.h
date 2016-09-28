//
//  NSDGithubClient.h
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDDefaultHTTPClient.h"

@interface NSDGithubClient : NSDDefaultHTTPClient

+(void) setAccessToken:(NSString *)token;

+ (void) processReqCodeWithDictinary:(NSDictionary *) reqDic
                       andCompletion:(void(^)())completion;
@end
