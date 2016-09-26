//
//  NSDDefaultHTTPClient.h
//  NSDCode
//
//  Created by NullStackDev on 9/26/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDDefaultHTTPClient : NSObject

+ (void) downloadResourceWithURLString:(NSString *) urlString
                         andCompletion:(void(^)(NSString * localPath,NSString * errorString)) completion;



+ (void) performRequestWithURLString:(NSString *) urlString
                           andMethod:(NSString *) method
                           andParams:(NSDictionary *) params
               andAcceptJSONResponce:(BOOL) acceptJSON
                   andSendBodyAsJSON:(BOOL)sendBodyJSON
                       andCompletion:(void(^)(NSData * respData,NSString * errorString)) completion;


+ (void) performRequestWithURLPath:(NSString *) URLPath
                         andMethod:(NSString *) method andParams:(NSDictionary *) params
             andAcceptJSONResponce:(BOOL) acceptJSON
                 andSendBodyAsJSON:(BOOL)sendBodyJSON
                     andCompletion:(void(^)(NSData * respData,NSString * errorString)) completion;

@end
