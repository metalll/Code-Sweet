//
//  NSDOAuth.h
//  NSDCode
//
//  Created by NullStackDev on 9/26/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSDOAuth : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progress;
@property (weak, nonatomic) IBOutlet UIWebView *web;

@end
