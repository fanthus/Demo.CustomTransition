//
//  ViewController.m
//  CustomTransition
//
//  Created by Frank on 16/2/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "ViewController.h"
#import "TransitioningDelegate.h"
#import "ViewControllerB.h"

@interface ViewController () {

    TransitioningDelegate *transDelegate;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 0, 320, 460);
    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"Hello world" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)btnPressed:(id)sender {
    // 1. 转场代理必须是全局的，否则 present 完之后就被释放掉，dismiss 的时候还是默认的转场动画了.
    // 2. present 谁 dismiss 谁 则赋给谁转场代理
    // 3. 开始转场之后 UIKit 负责调用转场代理的方法.
    
    transDelegate = [[TransitioningDelegate alloc] init];
    ViewControllerB *vcb = [[ViewControllerB alloc] init];
    vcb.view.backgroundColor = [UIColor greenColor];
    vcb.transitioningDelegate = transDelegate;
    [self presentViewController:vcb
                       animated:YES
                     completion:^{
                         NSLog(@"presented");
                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
