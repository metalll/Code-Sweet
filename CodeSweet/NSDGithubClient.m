//
//  NSDGithubClient.m
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDGithubClient.h"
#import "NSDGithubClient_Private.h"
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
#pragma mark Oauth methods
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

+ (void) processReqCodeWithDictinary:(NSDictionary *) reqDic
                       andCompletion:(void(^)())completion{
    
    if(![reqDic objectForKey:@"code"]){
        @throw [NSException exceptionWithName:@"error reqCode!" reason:@"ReqCode is nil" userInfo:nil];
        return;
    }
    NSString * reqCode = [reqDic objectForKey:@"code"];
    
    NSMutableDictionary * params = [NSMutableDictionary new];
    
    [params setObject:@"90148ae988fcef1f0bb3" forKey:@"client_id"];
    [params setObject:@"4344c30471cdf09a1a72bf35674f75eebcc10fc4" forKey:@"client_secret"];
    [params setObject:reqCode forKey:@"code"];
    
    
    [self performRequestWithURLString:@"https://github.com/login/oauth/access_token" andMethod:@"POST" andParams:params andAcceptJSONResponce:YES andSendBodyAsJSON:NO andCompletion:^(NSData *respData, NSString *errorString) {
        if(errorString){
            //тута типа еррор из тоста
            return ;
        }
        
        if(respData){
            NSError * errVar;
            NSDictionary * respDic = [NSJSONSerialization JSONObjectWithData:respData options:0 error:&errVar];
            if(!errVar){
                NSLog(@"responce dic : %@",respDic.description);
                if([respDic objectForKey:@"access_token"]){
                    [self setAccessToken:[respDic objectForKey:@"access_token"]];
                    return;
                }
            }
            
        }
        
        NSLog(@"oops: %@",[[NSString alloc] initWithData:respData encoding:NSUTF8StringEncoding]);
        return;
    }];
    
  
    
}

#pragma mark private Methods
+(NSString *)URLStringWithPathComponent:(NSString *)pathComponent{
    return [[self controller].baseURL stringByAppendingPathComponent:pathComponent];
}

+(void)searchForPath:(NSString *)path andQueryString:(NSString *)query andCompletion:(void (^)(NSDictionary *, NSString *))completion{
    NSMutableDictionary * params = [NSMutableDictionary new];
    [params setObject:query forKey:@"q"];
    
    [self performRequestWithURLPath:path andMethod:@"GET" andParams:params andAcceptJSONResponce:YES andSendBodyAsJSON:false andCompletion:^(NSData *respData, NSString *errorString) {
        [self processJSONData:respData andErrorString:errorString andCompletion:completion];
    }];
}

+(void)processJSONData:(NSData *)JSONData andErrorString:(NSString *)errorString andCompletion:(void (^)(NSDictionary *, NSString *))completion{
        if(JSONData){
        NSError * error;
        NSDictionary * retValDic = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:&error];
        if(retValDic){
        if(error){
            completion(nil,@"Github Error");
            return;
        }
        
            completion(retValDic,nil);
            return;
        }
        
        if(error){
            completion(nil,@"error parsing JSON");
        }
    }
        else{
            completion(nil,errorString);
        }
}

@end
