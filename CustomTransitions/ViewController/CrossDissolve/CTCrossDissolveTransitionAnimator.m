//
//  CTCrossDissolveTransitionAnimator.m
//  CustomTransitions
//
//  Created by 顾晨洁 on 16/8/15.
//  Copyright © 2016年 alientech. All rights reserved.
//

#import "CTCrossDissolveTransitionAnimator.h"

@implementation CTCrossDissolveTransitionAnimator


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //containerView用来承载fromView和toView
    UIView *containerView = transitionContext.containerView;
    
    UIView *fromView;
    UIView *toView;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromViewController.view;
        toView = toViewController.view;
    }
    
    fromView.frame = transitionContext.containerView.frame;
    toView.frame = transitionContext.containerView.frame;
    
    fromView.alpha = 1.0f;
    toView.alpha = 0.0f;
    
    [containerView addSubview:toView];
    
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    
    //自定义过渡动画, UIView animation和Core animation都可以, 本例用的是UIView animation
    [UIView animateWithDuration:transitionDuration animations:^{
        fromView.alpha = 0.0f;
        toView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        // 当动画结束时，通知transitionContext已经完成转换
        [transitionContext completeTransition:YES];
    }];
    
}

@end
