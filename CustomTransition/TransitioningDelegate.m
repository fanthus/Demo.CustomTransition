//
//  TransitioningDelegate.m
//  CustomTransition
//
//  Created by Frank on 16/2/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "TransitioningDelegate.h"
#import "Animator.h"

@implementation TransitioningDelegate

//转场代理方法需要提供我们自己的动画对象.

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    Animator *animator = [[Animator alloc] init];
    animator.presenting = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    Animator *animator = [[Animator alloc] init];
    animator.presenting = NO;
    return animator;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
    //UIKit calls the transitioning delegate’s interactionControllerForPresentation: method to see if an interactive animator object is available.
    //If that method returns nil, UIKit performs the animations without user interactions.
    return nil;
}

@end
