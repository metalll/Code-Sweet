//
//  NSDIssueEvent.m
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDIssueEvent.h"

@implementation NSDIssueEvent

- (instancetype)initWithEvent:(NSString*)event andUser:(NSDUser*)user andDate:(NSString*)date
{
    self = [super init];
    if (self) {
        self.event = event;
        self.user = user;
        self.date = date;
    }
    return self;
}
@end
