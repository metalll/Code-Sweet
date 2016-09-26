//
//  NSMutableURLRequest+NSDBodyDataSetter.h
//  NSDCode
//
//  Created by NullStackDev on 9/26/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableURLRequest (NSDBodyDataSetter)
-(void) setBodyData:(NSData *)data andIsJSONData:(BOOL) isJSONData;
@end
