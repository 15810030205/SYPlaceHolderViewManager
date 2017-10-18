//
//  SecondViewController.m
//  SYPlaceHolderView
//
//  Created by haosy on 2017/10/18.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import "SecondViewController.h"
#import "SYPlaceHolderViewManager.h"

@interface SecondViewController ()
@property (nonatomic,strong)SYPlaceHolderViewManager *placeholderManager;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    _placeholderManager = [[SYPlaceHolderViewManager alloc]initWithSuperView:self.view];
    _placeholderManager.type = PlaceHoderTypeTextImage;
    _placeholderManager.state = PlaceHoderStateLoading;
    _placeholderManager.retryButtonBlock = ^{
        NSLog(@"重试");
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
