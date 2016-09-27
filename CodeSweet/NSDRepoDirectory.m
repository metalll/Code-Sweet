//
//  NSDRepoDirectory.m
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDRepoDirectory.h"

@implementation NSDRepoDirectory

- (instancetype)initWithName:(NSString*)name andUrl:(NSString*)url
{
    self = [super init];
    if (self) {
        self.name = name;
        self.url = url;
    }
    return self;
}

@end
