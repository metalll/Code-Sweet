//
//  NSDComment.m
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDComment.h"

@implementation NSDComment

- (instancetype)initWithID:(long)ID andBody:(NSString*)body andDate:(NSString*)date andUserLogin:(NSString*)userLogin andUserAvatarUrl:(NSString*)userAvatarUrl
{
    self = [super init];
    if (self) {
        self.ID = ID;
        self.body = body;
        self.date = date;
        self.userLogin = userLogin;
        self.userAvatarUrl = userAvatarUrl;
    }
    return self;
}

@end
