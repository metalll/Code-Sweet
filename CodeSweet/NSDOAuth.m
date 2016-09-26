//
//  NSDOAuth.m
//  NSDCode
//
//  Created by NullStackDev on 9/26/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDOAuth.h"

@interface NSDOAuth ()
@end

@implementation NSDOAuth

- (void)viewDidLoad {
    [super viewDidLoad];
    _web.delegate = self;
    [_web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com/login/oauth/authorize?client_id=90148ae988fcef1f0bb3&scope=user,repo,notifications"]]];
    
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [webView setAlpha:0.5];
    [_progress startAnimating];
    
    
    
    
}



-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [webView setAlpha:1];
    [_progress stopAnimating];

}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSLog(@"url %@ ", request.URL.description);
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
