//
//  LWTabBar.m
//  LW
//
//  Created by 刘威 on 2018/1/21.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWTabBar.h"

@interface LWTabBar ()

@property (nonatomic, weak) UIButton *plusButton;

@end

@implementation LWTabBar

-(UIButton *)plusButton{
    if (_plusButton == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [button sizeToFit];
        [self addSubview:button];
        _plusButton = button;
    }
    return _plusButton;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat butW = self.frame.size.width / (self.items.count + 1);
    CGFloat butH = self.frame.size.height;
    NSInteger i = 0;
    for (UIView *item in self.subviews) {
        if ([item isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i++;
            }
            CGFloat butX = i * butW;
            item.frame = CGRectMake(butX, 0, butW, butH);
            i++;
        }
    }
    self.plusButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
}

@end
