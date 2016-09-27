//
//  NSDClientInstance.m
//  NSDCode
//
//  Created by NullStackDev on 9/26/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDClientInstance.h"

@implementation NSDClientInstance

+(instancetype)new{
    
    NSDClientInstance * instance = [super new];
    if(instance){
        instance.baseURL = @"http://api.github.com";
        instance.authToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"authToken"];
        if(instance.authToken) {
            NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
            config.HTTPAdditionalHeaders = [NSMutableDictionary new];
            [config.HTTPAdditionalHeaders setValue:@"Authorization" forKey:[@"token " stringByAppendingString:instance.authToken]];
            
            instance.session = [NSURLSession sessionWithConfiguration:config]; }
        
        else { instance.session = [NSURLSession sharedSession]; }
    }
    return instance;
}
@end
