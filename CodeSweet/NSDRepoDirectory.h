//
//  NSDRepoDirectory.h
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDRepoDirectory : NSObject

@property NSString* name;
@property NSString* url;

- (instancetype)initWithName:(NSString*)name andUrl:(NSString*)url;

@end
