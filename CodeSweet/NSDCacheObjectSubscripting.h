//
//  NSDCacheObjectSubscripting.h
//  CodeSweet
//
//  Created by NullStackDev on 9/26/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NSDCacheObjectSubscripting <NSObject>

@required

/**
 This method enables using literals on the receiving object, such as `id object = cache[@"key"];`.
 
 @param key The key associated with the object.
 @result The object for the specified key.
 */
- (id)objectForKeyedSubscript:(NSString *)key;

/**
 This method enables using literals on the receiving object, such as `cache[@"key"] = object;`.
 
 @param object An object to be assigned for the key.
 @param key A key to associate with the object. This string will be copied.
 */
- (void)setObject:(id)obj forKeyedSubscript:(NSString *)key;

@end
