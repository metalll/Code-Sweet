//
//  NSDRoot.m
//  CodeSweet
//
//  Created by NullStackDev on 9/26/16.
//  Copyright © 2016 NullStackDev. All rights reserved.
//

#import "NSDRoot.h"
#import "NSDOAuth.h"
@interface NSDRoot ()

@end

@implementation NSDRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDOAuth * oAuthVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Auth"];
    [[self navigationController] presentViewController:oAuthVC animated:YES completion:nil];
    // Do any additional setup after loading the view.
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
