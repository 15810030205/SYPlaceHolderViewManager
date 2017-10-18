//
//  SYPlaceHolderViewManager.m
//  SYPlaceHolderView
//
//  Created by haosy on 2017/10/18.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import "SYPlaceHolderViewManager.h"
#import "UIImage+GIF.h"

//屏幕大小
#define K_ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define K_ScreenWidth   [UIScreen mainScreen].bounds.size.width

//导航栏高度
#define K_NavHeight  64

//除去导航栏高度展示高度
#define K_WithOutNavHeight (K_ScreenHeight - K_NavHeight)

//显示图片大小
#define K_MainImageWidth  100
#define K_MainImageHeight 100

//重试按钮大小
#define K_RetryButtonWidth 70
#define K_RetryButtonHeight 30


//高度相关
//loading图标高度
#define K_LoadingHeight (K_WithOutNavHeight/2 - K_NavHeight/2)

//Error只是图片或者文字时候高度
#define K_ErrorOnlyHeight (K_WithOutNavHeight/2 - K_NavHeight/2)
//Error有图片同时也有文字时候的高度
#define K_ErrorTIIMageHeight (K_WithOutNavHeight/2 - K_MainImageHeight/2 )
//#define K_ErrrorTITextHeight (K_WithOutNavHeight/2 + 8)

//NoDate只是图片或者文字时候高度
#define K_NoDateOnlyHeight (K_WithOutNavHeight/2 - K_NavHeight/2)
//NoDate有图片同时也有文字时候的高度
#define K_NoDateTIIMageHeight (K_WithOutNavHeight/2 - K_MainImageHeight/2)
//#define K_NoDateTITextHeight (K_WithOutNavHeight/2 + 8)

//文字相关
#define K_ErrorTextString @"发生了错误，请点击重试"
#define K_NoDateTextString @"暂时没有数据哦~~"

@interface SYPlaceHolderViewManager ()

@property (nonatomic,strong)UIImageView *mainImageView;//显示主图
@property (nonatomic,strong)UILabel *desLabel;//显示描述
@property (nonatomic,strong)UIButton *retryButton;//重试按钮

@end

@implementation SYPlaceHolderViewManager


- (instancetype )initWithSuperView:(id)View{
    
    SYPlaceHolderViewManager *placeHolder = [SYPlaceHolderViewManager new];
    placeHolder.frame = CGRectMake(0, 0, K_ScreenWidth, K_ScreenHeight);
    placeHolder.backgroundColor = [UIColor whiteColor];
    [View addSubview:placeHolder];

    return placeHolder;
    
}
#pragma mark -- LazyLoad
- (UIImageView *)mainImageView
{
    if (!_mainImageView) {
        _mainImageView = [[UIImageView alloc]initWithFrame:CGRectMake(K_ScreenWidth / 2 - K_MainImageWidth/2 , K_WithOutNavHeight / 2 - K_NavHeight/2, K_MainImageWidth, K_MainImageWidth)];
        
    }
    return _mainImageView;
}
- (UILabel *)desLabel
{
    if (!_desLabel) {
        _desLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, K_ScreenWidth, 16)];
        _desLabel.textColor = [UIColor blackColor];
        _desLabel.textAlignment = NSTextAlignmentCenter;
        _desLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_desLabel];
    }
    return _desLabel;
}
- (UIButton *)retryButton
{
    if (!_retryButton) {
        
        _retryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_retryButton setTitle:@"重试" forState:UIControlStateNormal];
        _retryButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _retryButton.frame = CGRectMake(K_ScreenWidth / 2 - K_RetryButtonWidth/2 , 0, K_RetryButtonWidth, K_RetryButtonHeight);
        _retryButton.backgroundColor = [UIColor colorWithRed:49.0/255.0 green:194.0/255.0  blue:124.0/255.0  alpha:1.0];
        _retryButton.layer.cornerRadius = 3.0f;
        _retryButton.clipsToBounds = YES;
        [_retryButton addTarget:self action:@selector(retryAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _retryButton;
}
- (void)retryAction:(id)sender
{
    if (self.retryButtonBlock) {
        self.retryButtonBlock();
    }
}
#pragma mark -- SetState
- (void)setState:(PlaceHoderState)state
{
    self.hidden = NO;
   
    switch (state) {
            
        case PlaceHoderStateLoading:
            [self configureLoadingUI];
            break;
            
        case PlaceHoderStateNormal:
            self.hidden = YES;
            break;
            
        case PlaceHoderStateError:
            [self configureErrorUI];
            break;
            
        case PlaceHoderStateNoDate:
            [self configureNoDateUI];
            break;
            
        default:
            break;
    }
    
}
#pragma mark -- 配置UI
- (void)configureLoadingUI
{
    CGRect frame = self.mainImageView.frame;
    frame.origin.y = K_NoDateOnlyHeight + 30.0f;
    frame.size.height = 40.0f;
    frame.size.width = 40.0f;
    frame.origin.x = K_ScreenWidth/2 -20.0f;
    self.mainImageView.frame = frame;
    
    UIImage *image = [UIImage sd_animatedGIFNamed:@"loading"];
    self.mainImageView.image = image;
    
    [self addSubview:self.mainImageView];
}

- (void)configureErrorUI
{
    switch (self.type) {
        case PlaceHoderTypeOnlyText:
        {
            CGRect frame = self.desLabel.frame;
            frame.origin.y = K_ErrorOnlyHeight;
            self.desLabel.frame = frame;
            self.desLabel.text = K_ErrorTextString;
            
            [self addSubview:self.retryButton];
            CGRect retryframe = self.retryButton.frame;
            retryframe.origin.y = K_ErrorOnlyHeight + self.desLabel.frame.size.height +10 ;
            self.retryButton.frame = retryframe;
        }
            break;
        case PlaceHoderTypeOnlyImage:
        {
            CGRect frame = self.mainImageView.frame;
            frame.origin.y = K_ErrorOnlyHeight;
            self.mainImageView.frame = frame;
            [self.mainImageView setImage:[UIImage imageNamed:@"icon_null"]];
            [self addSubview:self.mainImageView];
            
            [self addSubview:self.retryButton];
            CGRect retryframe = self.retryButton.frame;
            retryframe.origin.y = K_ErrorOnlyHeight + self.mainImageView.frame.size.height +10 ;
            self.retryButton.frame = retryframe;
        }
            break;
        case PlaceHoderTypeTextImage:
        {
            CGRect frame = self.mainImageView.frame;
            frame.origin.y = K_ErrorTIIMageHeight;
            self.mainImageView.frame = frame;
            [self.mainImageView setImage:[UIImage imageNamed:@"icon_null"]];
            [self addSubview:self.mainImageView];
            
            CGRect textframe = self.desLabel.frame;
            textframe.origin.y =  K_ErrorTIIMageHeight + K_MainImageHeight + 10;
            self.desLabel.frame = textframe;
            self.desLabel.text = K_ErrorTextString;
            
            [self addSubview:self.retryButton];
            CGRect retryframe = self.retryButton.frame;
            retryframe.origin.y = textframe.origin.y + self.desLabel.frame.size.height + 10 ;
            self.retryButton.frame = retryframe;
        }
            break;
        default:
            break;
    }
}
- (void)configureNoDateUI
{
    switch (self.type) {
        case PlaceHoderTypeOnlyText:
        {
            CGRect frame = self.desLabel.frame;
            frame.origin.y = K_NoDateOnlyHeight;
            self.desLabel.frame = frame;
            self.desLabel.text = K_NoDateTextString;
        }
            break;
        case PlaceHoderTypeOnlyImage:
        {
            CGRect frame = self.mainImageView.frame;
            frame.origin.y = K_NoDateOnlyHeight;
            self.mainImageView.frame = frame;
            [self.mainImageView setImage:[UIImage imageNamed:@"icon_null"]];
            [self addSubview:self.mainImageView];
        }
            break;
        case PlaceHoderTypeTextImage:
        {
            CGRect frame = self.mainImageView.frame;
            frame.origin.y = K_NoDateTIIMageHeight;
            self.mainImageView.frame = frame;
            [self.mainImageView setImage:[UIImage imageNamed:@"icon_null"]];
            [self addSubview:self.mainImageView];
            
            CGRect textframe = self.desLabel.frame;
            textframe.origin.y = K_NoDateTIIMageHeight + K_MainImageHeight + 10;
            self.desLabel.frame = textframe;
            self.desLabel.text = K_NoDateTextString;
        }
            break;
        default:
            break;
    }
}


@end
