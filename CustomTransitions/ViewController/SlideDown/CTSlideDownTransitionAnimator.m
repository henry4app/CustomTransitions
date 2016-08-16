//
//  CTSlideDownTransitionAnimator.m
//  CustomTransitions
//
//  Created by 顾晨洁 on 16/8/16.
//  Copyright © 2016年 alientech. All rights reserved.
//

#import "CTSlideDownTransitionAnimator.h"

@implementation CTSlideDownTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIView *fromView;
    UIView *toView;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromViewController.view;
        toView = toViewController.view;
    }
    
    UIView *containerView = transitionContext.containerView;
    
    CGAffineTransform offScreenUp = CGAffineTransformMakeTranslation(0, -containerView.frame.size.height);
    CGAffineTransform offScreenDown = CGAffineTransformMakeTranslation(0, containerView.frame.size.height);
    
    if (self.isPresenting) {
        toView.transform = offScreenUp;
    }
    
    [containerView addSubview:fromView];
    [containerView addSubview:toView];
    
    NSTimeInterval animationDuration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:animationDuration animations:^{
        if (self.isPresenting) {
            fromView.transform = offScreenDown;
            fromView.alpha = 0.5;
            toView.transform = CGAffineTransformIdentity;
        } else {
            fromView.transform = offScreenUp;
            toView.alpha = 1.0;
            toView.transform = CGAffineTransformIdentity;
        }

    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}


@end
