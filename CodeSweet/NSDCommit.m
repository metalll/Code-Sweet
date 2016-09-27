//
//  NSDCommit.m
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDCommit.h"

@implementation NSDCommit

- (instancetype)initWithMessage:(NSString*)message andDate:(NSString*)date andCommiterLogin:(NSString*)commiterLogin andCommiterAvatarUrl:(NSString*)commiterAvatarUrl andSha:(NSString *)sha andCommentsUrl:(NSString *)commentsUrl andRepo:(NSDRepo *)repo
{
    self = [super init];
    if (self) {
        self.message = message;
        self.date = date;
        self.commiterLogin = commiterLogin;
        self.commiterAvatarUrl = commiterAvatarUrl;
        self.sha = sha;
        self.commentsUrl = commentsUrl;
        self.repo = repo;
    }
    return self;
}


@end
