//
//  NSDIssue.h
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDUser.h"
#import "NSDRepo.h"
@interface NSDIssue : NSObject

@property NSString* state;
@property NSString* createDate;
@property NSString* title;
@property long issueNumber;
@property long labelsCount;
@property NSDUser* user;
@property NSArray* events;
@property NSString* eventsUrl;
@property NSDRepo* repo;

- (instancetype)initWithNumber:(long)issueNumber andState:(NSString*)state andCreateDate:(NSString*)createDate andTitle:(NSString*)title andUser:(NSDUser*)user andEvents:(NSArray*)events andLabelsCount:(long)labelsCount andEventsUrl:(NSString*)eventsUrl andRepo:(NSDRepo*)repo;

@end
