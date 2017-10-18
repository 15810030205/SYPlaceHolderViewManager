//
//  ThirdViewController.m
//  SYPlaceHolderView
//
//  Created by haosy on 2017/10/18.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self)weakSelf = self;
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.placeholderManager.type = PlaceHoderTypeTextImage;
    self.placeholderManager.state = PlaceHoderStateError;
    self.placeholderManager.retryButtonBlock = ^{
        
        weakSelf.placeholderManager.state = PlaceHoderStateNormal;
    };
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
