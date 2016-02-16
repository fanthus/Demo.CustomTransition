//
//  Animator.m
//  CustomTransition
//
//  Created by xiushan.fan on 16/2/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "Animator.h"

@implementation Animator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 3.0f;
}


// 符合 UIViewControllerContextTransitioning 协议的转场上下文是 UIKit 提供的.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    // 1.通过转场上下文拿到所有动画需要的参数.
    // 2.利用 UIView 的 Animation 方法去执行 fromView 和 toView 的视图动画.
    // 3.结束之后通知 UIKit 完毕，并清理对应没有用的资源
    UIView *containerView = [transitionContext containerView];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    [containerView addSubview:toView];
    toView.alpha = 0.0f;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:0.9
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toView.alpha = 1.0f;
                     }
                     completion:^(BOOL finished) {
                         BOOL success = ![transitionContext transitionWasCancelled];
                         if ((self.presenting && !success) || (!self.presenting && success)) {
                             [toView removeFromSuperview];
                         }
                         [transitionContext completeTransition:success];
                     }];
}

@end
