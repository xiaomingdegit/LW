//
//  LWFriendTrendController.m
//  LW
//
//  Created by 刘威 on 2018/1/19.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWFriendTrendController.h"
#import "LWLoginRegisterController.h"

@interface LWFriendTrendController ()

@end

@implementation LWFriendTrendController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条内容
    [self setNavigationItem];
}

//弹出登陆注册页面
- (IBAction)LonginRegisterClick:(id)sender {
    LWLoginRegisterController *loginRegisterController = [[LWLoginRegisterController alloc] init];
    [self presentViewController:loginRegisterController animated:YES completion:nil];
}

- (void)setNavigationItem{
    self.navigationItem.title = @"我的关注";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"friendsRecommentIcon" clickImageName:@"friendsRecommentIcon-click" addTarget:nil action:nil];
}
@end
