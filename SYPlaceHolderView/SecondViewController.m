//
//  SecondViewController.m
//  SYPlaceHolderView
//
//  Created by haosy on 2017/10/18.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import "SecondViewController.h"
//#import "SYPlaceHolderViewManager.h"

@interface SecondViewController ()
@end

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.placeholderManager.state = PlaceHoderStateLoading;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.placeholderManager.state = PlaceHoderStateNormal;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
