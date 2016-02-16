//
//  ViewControllerB.m
//  CustomTransition
//
//  Created by Frank on 16/2/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "ViewControllerB.h"

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 0, 320, 460);
    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"Hello world" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)btnPressed:(id)sender {
    self.modalPresentationStyle = UIModalPresentationCustom;
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 NSLog(@"dismissed");
                             }];
}


- (void)dealloc {
    NSLog(@"VCB dealloced");
}

@end
