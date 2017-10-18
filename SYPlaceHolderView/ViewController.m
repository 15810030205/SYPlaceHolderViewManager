//
//  ViewController.m
//  SYPlaceHolderView
//
//  Created by haosy on 2017/10/18.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import "ViewController.h"
#import "SYPlaceHolderViewManager.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"



@interface ViewController () 
@property (nonatomic,strong)SYPlaceHolderViewManager *placeholderManager;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)pushAction:(id)sender {
    SecondViewController *viewController = [SecondViewController new];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    [self presentViewController:nav animated:YES completion:^{}];
    
}
- (IBAction)pushErrorAction:(id)sender {
    
    ThirdViewController *viewController = [ThirdViewController new];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    [self presentViewController:nav animated:YES completion:^{}];
}
- (IBAction)pushNoDate:(id)sender {
    
    FourthViewController *viewController = [FourthViewController new];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    [self presentViewController:nav animated:YES completion:^{}];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
