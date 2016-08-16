//
//  CTCrossDissolveSecondViewController.m
//  CustomTransitions
//
//  Created by 顾晨洁 on 16/8/15.
//  Copyright © 2016年 alientech. All rights reserved.
//

#import "CTCrossDissolveSecondViewController.h"

@interface CTCrossDissolveSecondViewController ()

@end

@implementation CTCrossDissolveSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor customPurpleColor];
    [self addDismissButton];
}

- (void)addDismissButton {
    UIButton *dismissBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [dismissBtn setTitle:@"Dismiss" forState:UIControlStateNormal];
    [dismissBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:dismissBtn];
    [dismissBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(0);
    }];
    [dismissBtn bk_addEventHandler:^(id sender) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
