//
//  NSDGithubClient.m
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDGithubClient.h"
#import "NSDClientInstance.h"
@implementation NSDGithubClient

+(NSDClientInstance *)controller{
    static NSDClientInstance * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [NSDClientInstance new];
    });
    return instance;
}

+(BOOL) isAuth{
    return [self controller].authToken!=nil;
}

+(void) setAccessToken:(NSString *)token{
    if(!token){
        @throw [NSException exceptionWithName:@"Token error!" reason:@"Token is nil" userInfo:nil];
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"authToken"];
    NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.HTTPAdditionalHeaders = [NSMutableDictionary new];
    [config.HTTPAdditionalHeaders setValue:@"Authorization" forKey:[@"token " stringByAppendingString:token]];
    
    [self controller].session = [NSURLSession sessionWithConfiguration:config];
}

+ (void) processReqCodeWithDictinary:(NSDictionary *) reqDic andCompletion:(void(^)())completion{
    
    if(![reqDic objectForKey:@"code"]){
        @throw [NSException exceptionWithName:@"error reqCode!" reason:@"ReqCode is nil" userInfo:nil];
        return;
    }
    NSString * reqCode = [reqDic objectForKey:@"code"];
    
    
    
}

@end
