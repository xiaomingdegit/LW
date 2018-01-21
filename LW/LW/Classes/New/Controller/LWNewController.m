//
//  LWNewController.m
//  LW
//
//  Created by 刘威 on 2018/1/19.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWNewController.h"

@interface LWNewController ()

@end

@implementation LWNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条内容
    [self setNavigationItem];
}

- (void)setNavigationItem{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"MainTagSubIcon" clickImageName:@"MainTagSubIconClick" addTarget:nil action:nil];
}
@end
