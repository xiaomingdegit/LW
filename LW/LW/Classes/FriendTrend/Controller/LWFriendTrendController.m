//
//  LWFriendTrendController.m
//  LW
//
//  Created by 刘威 on 2018/1/19.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWFriendTrendController.h"

@interface LWFriendTrendController ()

@end

@implementation LWFriendTrendController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条内容
    [self setNavigationItem];
}

- (void)setNavigationItem{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"friendsRecommentIcon" clickImageName:@"friendsRecommentIcon-click" addTarget:nil action:nil];
}
@end
