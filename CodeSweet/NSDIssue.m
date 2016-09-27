//
//  NSDIssue.m
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDIssue.h"

@implementation NSDIssue
- (instancetype)initWithNumber:(long)issueNumber andState:(NSString*)state andCreateDate:(NSString*)createDate andTitle:(NSString*)title andUser:(NSDUser*)user andEvents:(NSArray*)events andLabelsCount:(long)labelsCount andEventsUrl:(NSString *)eventsUrl andRepo:(NSDRepo *)repo
{
    self = [super init];
    if (self) {
        self.title = title;
        self.issueNumber = issueNumber;
        self.state = state;
        self.createDate = createDate;
        self.user = user;
        self.events = events;
        self.labelsCount = labelsCount;
        self.eventsUrl = eventsUrl;
        self.repo = repo;
    }
    return self;
}


@end
