//
//  NSDRepoFile.m
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDRepoFile.h"

@implementation NSDRepoFile

- (instancetype)initWithName:(NSString*)name andSize:(long)size andDownloadUrl:(NSString*)downloadUrl
{
    self = [super init];
    if (self) {
        self.name = name;
        self.size = size;
        self.downloadUrl = downloadUrl;
    }
    return self;
}



@end
