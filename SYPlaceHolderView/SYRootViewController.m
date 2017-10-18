//
//  SYRootViewController.m
//  SYPlaceHolderView
//
//  Created by haosy on 2017/10/18.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import "SYRootViewController.h"

@interface SYRootViewController ()

@end

@implementation SYRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    [self addDismissButton];
    
    [self configureUI];
    
}

- (void)configureUI {
    
    _placeholderManager = [[SYPlaceHolderViewManager alloc]initWithSuperView:self.view];
    
}




- (void)addDismissButton
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)backAction:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{}];
}


@end
