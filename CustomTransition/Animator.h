//
//  Animator.h
//  CustomTransition
//
//  Created by xiushan.fan on 16/2/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL presenting;

@end
