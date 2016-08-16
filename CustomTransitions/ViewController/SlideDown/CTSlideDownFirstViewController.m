//
//  CTSlideDownFirstViewController.m
//  CustomTransitions
//
//  Created by 顾晨洁 on 16/8/16.
//  Copyright © 2016年 alientech. All rights reserved.
//

#import "CTSlideDownFirstViewController.h"
#import "CTSlideDownSecondViewController.h"
#import "CTSlideDownTransitionAnimator.h"

@interface CTSlideDownFirstViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic) UILabel *label;
@property (nonatomic) UIButton *presentBtn;

@end

@implementation CTSlideDownFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addLabel];
    [self addPresentButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                    sourceController:(UIViewController *)source {
    CTSlideDownTransitionAnimator *animator = [CTSlideDownTransitionAnimator new];
    animator.isPresenting = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    CTSlideDownTransitionAnimator *animator = [CTSlideDownTransitionAnimator new];
    animator.isPresenting = NO;
    return animator;
}

#pragma mark Methods
- (void)addPresentButton {
    self.presentBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.presentBtn setTitle:@"Present Second View Controller" forState:UIControlStateNormal];
    [self.view addSubview:self.presentBtn];
    [self.presentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.bottom.equalTo(-20);
    }];
    [self.presentBtn bk_addEventHandler:^(id sender) {
        CTSlideDownSecondViewController *secondViewController = [CTSlideDownSecondViewController new];
        secondViewController.transitioningDelegate = self; // 3, 设置代理方
        // 设置成UIModalPresentationFullScreen 使<ContextTransitioning>能提供到参与过渡动画的控制器的frame值
        secondViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:secondViewController animated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
}

- (void)addLabel {
    self.label = [UILabel new];
    self.label.text = @"A";
    self.label.font = [UIFont systemFontOfSize:120];
    self.label.textColor = [UIColor customGrayColor];
    [self.label sizeToFit];
    [self.view addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(0);
    }];
}
@end
