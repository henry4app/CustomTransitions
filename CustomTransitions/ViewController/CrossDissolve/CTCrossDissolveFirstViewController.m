//
//  CTCrossDissolveFirstViewController.m
//  CustomTransitions
//
//  Created by 顾晨洁 on 16/8/15.
//  Copyright © 2016年 alientech. All rights reserved.
//

#import "CTCrossDissolveFirstViewController.h"
#import "CTCrossDissolveSecondViewController.h"
#import "CTCrossDissolveTransitionAnimator.h"

@interface CTCrossDissolveFirstViewController ()<UIViewControllerTransitioningDelegate> //1，必须遵守协议

@end

@implementation CTCrossDissolveFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addPresentButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIViewControllerTransitioningDelegate
// 2, 执行代理方法
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    return [CTCrossDissolveTransitionAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [CTCrossDissolveTransitionAnimator new];
}

#pragma mark Methods
- (void)addPresentButton {
    UIButton *presentBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [presentBtn setTitle:@"Present Second View Controller" forState:UIControlStateNormal];
    [self.view addSubview:presentBtn];
    [presentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(0);
    }];
    [presentBtn bk_addEventHandler:^(id sender) {
        CTCrossDissolveSecondViewController *secondViewController = [CTCrossDissolveSecondViewController new];
        secondViewController.transitioningDelegate = self; // 3, 设置代理方
        secondViewController.modalPresentationStyle = UIModalPresentationCustom;
        [self presentViewController:secondViewController animated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
}


@end
