//
//  LWEssenceController.m
//  LW
//
//  Created by 刘威 on 2018/1/19.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWEssenceController.h"

@interface LWEssenceController ()

@end

@implementation LWEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条
    [self setNavigationItem];
}

- (void)setNavigationItem{
    self.navigationItem.title = @"精华";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"nav_item_game_icon" clickImageName:@"nav_item_game_click_icon" addTarget:self action:@selector(gameClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationButtonRandom" clickImageName:@"navigationButtonRandomClick" addTarget:nil action:nil];
}

-(void)gameClick{
    func;
}

@end
