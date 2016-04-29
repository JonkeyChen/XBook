//
//  CSHProgressHUD.m
//  XBook
//
//  Created by Tianjian on 16/4/29.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "CSHProgressHUD.h"

@interface CSHProgressHUD ()

@property (nonatomic,strong) UIWindow *contentView;
@property (nonatomic,strong) UIActivityIndicatorView *loading;

@end

@implementation CSHProgressHUD

- (instancetype)init{
    if (self = [super init]) {
        self.contentView = ({
            UIWindow *etContentView = [[UIWindow alloc] initWithFrame:CGRectZero];
            etContentView.backgroundColor = [UIColor clearColor];
            etContentView.windowLevel = UIWindowLevelStatusBar;
            etContentView.hidden = NO;
            etContentView.rootViewController = nil;
            [etContentView addSubview:self];
            etContentView;
        });
        
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        self.userInteractionEnabled = NO;

        self.loading = ({
            UIActivityIndicatorView *etloading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            etloading.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - etloading.frame.size.width) / 2.0, ([UIScreen mainScreen].bounds.size.height - etloading.frame.size.height) / 2.0, etloading.frame.size.width, etloading.frame.size.height);
            etloading.color = [UIColor colorWithRed:250.0 / 255.0 green:240.0 / 255.0 blue:0.0 / 255.0 alpha:1];;
            [self addSubview:etloading];
            etloading.hidden = YES;
            etloading;
        });
    }
    return self;
}

- (void)show{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.contentView.frame = [UIScreen mainScreen].bounds;
        self.frame = self.contentView.frame;
        
        self.loading.hidden = NO;
        [self.loading startAnimating];
    });
}

- (void)hide{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.loading stopAnimating];
        self.loading.hidden = YES;
        
        [UIView animateWithDuration:0.25 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            self.contentView.frame = CGRectZero;
        }];
    });
}


@end
