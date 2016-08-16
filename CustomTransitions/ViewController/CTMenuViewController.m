//
//  CTMenuViewController.m
//  CustomTransitions
//
//  Created by 顾晨洁 on 16/8/15.
//  Copyright © 2016年 alientech. All rights reserved.
//

#import "CTMenuViewController.h"
#import "CTMenuTableViewCell.h"
#import "CTCrossDissolveFirstViewController.h"

@interface CTMenuViewController ()

@property (nonatomic) NSArray *items;

@end

@implementation CTMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTableView];
    [self configureNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.items[indexPath.row] firstObject];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = [self viewControllerForRowAtIndexPath:indexPath];
    viewController.title = [self titleForRowAtIndexPath:indexPath];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - Private methods

- (void)configureTableView {
    [self.tableView registerClass:[CTMenuTableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.items = @[@[@"Cross Dissolve", [CTCrossDissolveFirstViewController class]]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.preservesSuperviewLayoutMargins = NO;
    self.tableView.separatorInset = UIEdgeInsetsZero;
}

- (void)configureNavigationBar {
    self.navigationController.navigationBar.barTintColor = [UIColor customGreenColor];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationItem.title = @"Menu";
}

- (NSString *)titleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.items[indexPath.row] firstObject];
}

- (UIViewController *)viewControllerForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.items[indexPath.row] lastObject] new];
}


@end
