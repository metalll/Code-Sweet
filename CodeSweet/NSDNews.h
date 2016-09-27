//
//  NSDNews.h
//  NSDCode
//
//  Created by NullStackDev on 9/27/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDNews : NSObject
@property NSString* actionText;
@property NSString* ownerUrl;
@property NSString* date;

- (instancetype)initWithActionText:(NSString*)actionText andDate:(NSString*)date andOwnerUrl:(NSString*)ownerUrl;
@end
