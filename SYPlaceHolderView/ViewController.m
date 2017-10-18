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

@interface ViewController () 
@property (nonatomic,strong)SYPlaceHolderViewManager *placeholderManager;

@end

@implementation ViewController

/**
 typedef NS_ENUM(NSInteger , PlaceHoderState) {
 PlaceHoderStateLoading = 0,
 PlaceHoderStateNormal  = 1,
 PlaceHoderStateError   = 2,
 PlaceHoderStateNoDate  = 3,
 PlaceHoderStateCustom  = 4,
 };
 
 typedef NS_ENUM(NSInteger , PlaceHoderType ) {
 PlaceHoderTypeOnlyText  = 0, //只是显示一句话
 PlaceHoderTypeOnlyImage = 1, //只显示一个图片
 PlaceHoderTypeTextImage = 2, //显示图还有文字，图在文字之上
 };

 */
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor grayColor];
    
    
}
- (IBAction)pushAction:(id)sender {
    SecondViewController *viewController = [SecondViewController new];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    [self presentViewController:nav animated:YES completion:^{}];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
