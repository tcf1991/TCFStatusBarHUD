//
//  TCFStatusBarHUD.m
//  TCFStatusBarHUD
//
//  Created by 汤春风 on 16/3/18.
//  Copyright © 2016年 tcf. All rights reserved.
//

#import "TCFStatusBarHUD.h"

#define TCFMessageFont  [UIFont systemFontOfSize:12]

@implementation TCFStatusBarHUD
static UIWindow *window_;
static NSTimer *timer_;
//** 消息停留的时间  */
static CGFloat const TCFMessageDuration = 2.0;

//** 隐藏动画的时间  */
static CGFloat const TCFAnimationDuration = 0.25;
/**
 *  显示窗口
 */
+(void)showWindow{
    
    CGFloat windowH = 20;
    CGRect  frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    frame.origin.y = 0;
    
    [UIView animateWithDuration:TCFAnimationDuration animations:^{
        window_.frame = frame;
        
    }];
    
    
}

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"TCFStatusBarHUD.bundle/success"]];
    
}


/**
 *  显示失败信息
 */

+ (void)showError:(NSString *)msg{
    
    [self showMessage:msg image:[UIImage imageNamed:@"TCFStatusBarHUD.bundle/error"]];

    
    
}




/**
 *  正在加载
 */

+ (void)showLoading:(NSString *)msg{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    
    
    [self showWindow];
    //添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = TCFMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    //文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : TCFMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20 ;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
    
    
}

/**
 *  显示普通信息
 */
+(void)showMessage:(NSString *)msg{
    [self showMessage:msg image:nil];
    
    
}


/**
 *  显示普通信息
 *
 *  @param msg   文字
 *  @param image 图片
 */

+ (void)showMessage:(NSString *)msg image:(UIImage *)image{
    [self showWindow];
    // 先停止定时器
    [timer_ invalidate];
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = TCFMessageFont;
    
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }

    button.frame = window_.bounds;
    [window_ addSubview:button];

    //定时消失
    timer_ = [NSTimer scheduledTimerWithTimeInterval:TCFMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
    
}

/**
 *  隐藏
 */
+ (void)hide{
    [UIView animateWithDuration:TCFAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
    } completion:^(BOOL finished) {
        
        window_ = nil;
        timer_ = nil;
    }];
    
}
@end
