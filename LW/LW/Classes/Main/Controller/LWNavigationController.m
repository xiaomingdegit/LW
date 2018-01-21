//
//  LWNavigationController.m
//  LW
//
//  Created by 刘威 on 2018/1/21.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWNavigationController.h"

@interface LWNavigationController ()

@end

@implementation LWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar];
}

-(void)setNavigationBar{
    //设置navigationBar字体属性
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:20]}];
    //设置navigationBar背景图片
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

@end
