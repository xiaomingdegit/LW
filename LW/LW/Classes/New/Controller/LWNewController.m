//
//  LWNewController.m
//  LW
//
//  Created by 刘威 on 2018/1/19.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWNewController.h"
#import "LWSubTapController.h"

@interface LWNewController ()

@end

@implementation LWNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条内容
    [self setNavigationItem];
}

- (void)setNavigationItem{
    self.navigationItem.title = @"新帖";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"MainTagSubIcon" clickImageName:@"MainTagSubIconClick" addTarget:self action:@selector(tagSubClick)];
}

- (void)tagSubClick{
    LWSubTapController *subTabController = [[LWSubTapController alloc] init];
    [self.navigationController pushViewController:subTabController animated:YES];
}

@end
