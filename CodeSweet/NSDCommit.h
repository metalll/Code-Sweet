//
//  NSDCommit.h
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDRepo.h"
@interface NSDCommit : NSObject

@property NSString* message;
@property NSString* date;
@property NSString* commiterLogin;
@property NSString* commiterAvatarUrl;
@property NSString* sha;
@property NSString* commentsUrl;
@property NSDRepo* repo;

- (instancetype)initWithMessage:(NSString*)message andDate:(NSString*)date andCommiterLogin:(NSString*)commiterLogin andCommiterAvatarUrl:(NSString*)commiterAvatarUrl andSha:(NSString*)sha andCommentsUrl:(NSString*)commentsUrl andRepo:(NSDRepo*)repo;

@end
