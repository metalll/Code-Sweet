//
//  NSDNews.m
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDNews.h"

@implementation NSDNews
- (instancetype)initWithActionText:(NSString*)actionText andDate:(NSString*)date andOwnerUrl:(NSString*)ownerUrl
{
    self = [super init];
    if (self) {
        self.actionText = actionText;
        self.date = date;
        self.ownerUrl = ownerUrl;
    }
    return self;
}
@end
