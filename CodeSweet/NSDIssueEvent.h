//
//  NSDIssueEvent.h
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDUser.h"
@interface NSDIssueEvent : NSObject

@property NSDUser * user;
@property NSString* event;
@property NSString* date;

- (instancetype)initWithEvent:(NSString*)event andUser:(NSDUser*)user andDate:(NSString*)date;

@end
