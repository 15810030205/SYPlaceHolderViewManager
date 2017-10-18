//
//  SYPlaceHolderViewManager.h
//  SYPlaceHolderView
//
//  Created by haosy on 2017/10/18.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@interface SYPlaceHolderViewManager : UIView
//初始化
- (instancetype )initWithSuperView:(id)View;
//重试按钮点击
@property (nonatomic)void(^retryButtonBlock)(void);

//类型 （需要先传入）
@property (nonatomic,assign) PlaceHoderType type;
//状态 （需要再类型后传入）
@property (nonatomic,assign) PlaceHoderState state;



@end
