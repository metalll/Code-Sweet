//
//  NSDRepo.h
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDRepo : NSObject

@property NSString* name;
@property NSString* fullName;
@property NSString* ownerName;
@property NSString *ownerAvatarUrl;
@property NSString* language;
@property NSString* issuesUrl;
@property NSString* branchesUrl;
@property NSString* contentsUrl;
@property NSString* commitsUrl;
@property NSString* htmlUrl;
@property NSString* createDate;
@property NSString* ownerUrl;
@property double size;

@property long forksCount;
@property long watchersCount;
@property long branchesCount;
@property long stargazersCount;
@property long issuesCount;

@property BOOL isPrivate;
@property BOOL isStarring;
@property BOOL isWatching;


-(instancetype)initWithName:(NSString*)name andFullName:(NSString*)fullName andOwnerName:(NSString*)ownerName andOwnerAvatarUrl:(NSString*)ownerAvatarUrl andLanguage:(NSString*)language andCreateDate:(NSString*)createDate andSize:(double)size andForksCount:(long)forksCount andWatchersCount:(long)watchersCount andBranchesCount:(long)branchesCount andStargazersCount:(long)stargazersCount andIssuesCount:(long)issuesCount andPrivate:(BOOL)isPrivate andIsStarring:(BOOL)isStarring andIsWatching:(BOOL)isWatching andIssuesUrl:(NSString*)issuesUrl andContentsUrl:(NSString*)contentsUrl andCommitsUrl:(NSString*)commitsUrl andHtmlUrl:(NSString*)htmlUrl andOwnerUrl:(NSString*)ownerUrl andBranchesUrl:(NSString*)branchesUrl;


@end
