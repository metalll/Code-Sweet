//
//  NSDClientInstance.h
//  NSDCode
//
//  Created by NullStackDev on 9/26/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDClientInstance : NSObject
@property NSString * baseURL;
@property NSString * authToken;
@property NSURLSession * session;
@end
