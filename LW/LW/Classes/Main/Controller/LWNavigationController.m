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

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
   //当push的viewController不是根控制器时
    if (self.childViewControllers.count > 0) {
        //统一设置返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImageName:@"navigationButtonReturn" clickImageName:@"navigationButtonReturnClick" addTarge:self action:@selector(backClick) title:@"返回"];
        //隐藏底部导航条
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

-(void)backClick{
    [self popViewControllerAnimated:YES];
}

@end
