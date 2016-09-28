//
//  NSDDefaultHTTPClient.m
//  NSDCode
//
//  Created by NullStackDev on 9/26/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDDefaultHTTPClient.h"
#import "NSDDefaultHTTPClient_Private.h"
#import "NSDClientInstance.h"
#import "NSDictionary+NSDEncoder.h"
#import "NSURL+NSDDecoder.h"
#import "NSMutableURLRequest+NSDBodyDataSetter.h"

@implementation NSDDefaultHTTPClient

+ (NSDClientInstance *) controller{
    static NSDClientInstance * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [NSDClientInstance new];
    });
    
    return sharedInstance;
}

+(NSString *)processResponce:(NSURLResponse *)response andError:(NSError *)error{
    if(error){
        return error.localizedDescription;
    }
    NSHTTPURLResponse * HTTPResp = (NSHTTPURLResponse *)response;
  
    if(HTTPResp.statusCode<=299&&HTTPResp.statusCode>=200){
        return nil;
    }
    if(HTTPResp.statusCode<=499&&HTTPResp.statusCode>=400){
        return [@"Client error" stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)HTTPResp.statusCode]];
    }
    if(HTTPResp.statusCode<=599&&HTTPResp.statusCode>=500){
       return [@"Server error" stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)HTTPResp.statusCode]];
    }
    if(HTTPResp.statusCode<=199||HTTPResp.statusCode>=600){
        return [@"Unknown error" stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)HTTPResp.statusCode]];
    }

    
    return nil;
    
    
    
    
}

+(void)downloadResourceWithURLString:(NSString *)urlString andCompletion:(void (^)(NSString *, NSString *))completion{
    NSURL * URL = [NSURL URLWithString:urlString];
    NSURLRequest * request = [NSURLRequest requestWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    [[[self controller].session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString * errorString = [self processResponce:response andError:error];
        if(errorString){
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil,errorString);
                return;
            });
            return;
        }
        
        if(!location){
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil,@"Fatal error! Request succeed, but URL is nil!");
                return ;
            });
            return;
        }
        
        NSString * localPath = [NSTemporaryDirectory() stringByAppendingPathComponent:[[NSUUID init]string]];
        
        NSError * NSerror;
        [[NSFileManager defaultManager] copyItemAtURL:location toURL:[NSURL fileURLWithPath:localPath] error:&NSerror];
        if(NSerror){
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil,NSerror.localizedDescription);
                return ;
            });
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(localPath,nil);
            return ;
        });
        return;
        
    }] resume];
}

+(void)performRequestWithURLPath:(NSString *)URLPath andMethod:(NSString *)method andParams:(NSDictionary *)params andAcceptJSONResponce:(BOOL)acceptJSON andSendBodyAsJSON:(BOOL)sendBodyJSON andCompletion:(void (^)(NSData *, NSString *))completion{
    if([self controller].baseURL){
        [self performRequestWithURLString:[[self controller].baseURL stringByAppendingPathComponent:URLPath] andMethod:method andParams:params andAcceptJSONResponce:acceptJSON andSendBodyAsJSON:sendBodyJSON andCompletion:completion];
    }
    else{
        completion(nil,@"Base URL not set");
    }
}


+(void)performRequestWithURLString:(NSString *)urlString andMethod:(NSString *)method andParams:(NSDictionary *)params andAcceptJSONResponce:(BOOL)acceptJSON andSendBodyAsJSON:(BOOL)sendBodyJSON andCompletion:(void (^)(NSData *, NSString *))completion{
    NSURL * URL = [NSURL URLWithString:urlString];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
  
    if(!method){
        method = @"GET";
    }
    
    request.HTTPMethod = method;
    
    if(params){
        if([method isEqualToString:@"GET"]||[method isEqualToString:@"PUT"]||[method isEqualToString:@"DELETE"]||[method isEqualToString:@"PATCH"]){
            NSData * bodyData = nil;
            if(sendBodyJSON){
                NSError * error = nil;
                bodyData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
                if(error){
                    completion(nil,[@"Error building JSON:" stringByAppendingString:error.localizedDescription]);
                    return;
                }
            }
            else{
                NSString * encodedString = [params encodedStringForHTTPBody];
                if(encodedString){
                    bodyData = [encodedString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
                }
            }
            
            if(!bodyData){
                completion(nil,@"Couldn't create bodyData");
                return;
            }
            
            [request setBodyData:bodyData andIsJSONData:sendBodyJSON];
            
        }
        else{
            NSString * encodedString = [params encodedStringForHTTPBody];
            if(encodedString){
                NSURL * URL = [NSURL URLWithString:[[urlString stringByAppendingString:@"?"] stringByAppendingString:encodedString]];
                request.URL = URL;
            }
        }
        
        
    
    }
    
    [[[self controller].session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString * errString = [self processResponce:response andError:error];
            if(errString){
                completion(data,errString);
                return ;
            }
            
        if(!data){
            completion(nil,@"Fatal error! Request succeed, but data is nil!");
            return ;
        }
        
        
            completion(data,nil);
        
        });

    }]resume];
}



@end
