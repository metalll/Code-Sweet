//
//  NSDRepoFile.h
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDRepoFile : NSObject

@property NSString* name;
@property long size;
@property NSString* downloadUrl;

- (instancetype)initWithName:(NSString*)name andSize:(long)size andDownloadUrl:(NSString*)downloadUrl;

@end
