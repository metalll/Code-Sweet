//
//  NSDUser.h
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDUser : NSObject
@property NSString* ID;
@property NSString* login;
@property NSString* avatarUrl;
@property NSString* URL;
@property NSString* accessToken;
@property NSString* name;
@property NSString* company;
@property NSString* location;
@property NSString* email;
@property NSString* followers;
@property NSString* following;
@property long followersCount;
@property long followingCount;

- (instancetype)initWithID:(NSString*)ID andLogin:(NSString*)login andAvatarUrl:(NSString*)avatarUrl andURL:(NSString*)URL andAccessToken:(NSString*)accessToken andName:(NSString*)name andCompany:(NSString*)company andLocation:(NSString*)location andEmail:(NSString*)email andFollowers:(NSString*)followers andFollowing:(NSString*)following andFollowersCount:(long)followersCount andFollowingCount:(long)followingCount;
@end
