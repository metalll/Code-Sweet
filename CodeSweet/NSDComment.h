//
//  NSDComment.h
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDComment : NSObject
@property long ID;
@property NSString* body;
@property NSString* date;
@property NSString* userLogin;
@property NSString* userAvatarUrl;

- (instancetype)initWithID:(long)ID andBody:(NSString*)body andDate:(NSString*)date andUserLogin:(NSString*)userLogin andUserAvatarUrl:(NSString*)userAvatarUrl;
@end
