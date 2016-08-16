//
//  CTSlideDownSecondViewController.m
//  CustomTransitions
//
//  Created by 顾晨洁 on 16/8/16.
//  Copyright © 2016年 alientech. All rights reserved.
//

#import "CTSlideDownSecondViewController.h"

@interface CTSlideDownSecondViewController ()
@property (nonatomic) UILabel *label;
@property (nonatomic) UIButton *dismissBtn;
@end

@implementation CTSlideDownSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor customPurpleColor];
    [self addDismissButton];
    [self addLabel];
}

#pragma mark - Methods

- (void)addDismissButton {
    self.dismissBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.dismissBtn setTitle:@"Dismiss" forState:UIControlStateNormal];
    [self.dismissBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.dismissBtn];
    [self.dismissBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.bottom.equalTo(-20);
    }];
    [self.dismissBtn bk_addEventHandler:^(id sender) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
}

- (void)addLabel {
    self.label = [UILabel new];
    self.label.text = @"B";
    self.label.font = [UIFont systemFontOfSize:120];
    self.label.textColor = [UIColor whiteColor];
    [self.label sizeToFit];
    [self.view addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
