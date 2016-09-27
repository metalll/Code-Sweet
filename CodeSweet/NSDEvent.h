//
//  NSDEvent.h
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDEvent : NSObject


@property NSString* time;
@property NSString* login;
@property NSString* action;
@property NSString* refType;
@property NSString* repoName;
@property NSString* ref;
@property NSString* avatarUrl;
@property NSString* repoUrl;

- (instancetype)initWithLogin:(NSString*)login andAction:(NSString*)action andTime:(NSString*)time andRefType:(NSString*)refType andRepoName:(NSString*)repoName andRef:(NSString*)ref andAvatarUrl:(NSString*)avatarUrl andRepoUrl:(NSString*)repoUrl;
-(NSString*) eventDescription;

@end
