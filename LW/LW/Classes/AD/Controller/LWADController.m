//
//  LWADController.m
//  LW
//
//  Created by 刘威 on 2018/1/23.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWADController.h"
#import "LWADItem.h"
#import <UIImageView+WebCache.h>
#import "LWTabBarController.h"
#import "LWNetworkManager.h"

#define iphone5 (screenHeight == 568)
#define iphone6 (screenHeight == 667)
#define iphone6p (screenHeight == 736)

//获取广告参数值
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface LWADController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroudImageView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
//跳过广告按钮
@property (weak, nonatomic) IBOutlet UIButton *jumpButton;
//广告数据模型
@property (strong, nonatomic) LWADItem *adItem;
//广告图片
@property (weak, nonatomic) UIImageView *imageView;
//倒计时timer NSTimer 通常用weak
@property (weak, nonatomic) NSTimer *timer;

@end

@implementation LWADController

- (UIImageView *)imageView{
    if (_imageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [_contentView addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        //给广告imageView 添加点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [imageView addGestureRecognizer:tap];
        _imageView = imageView;
    }
    return _imageView;
}
//触发点击手势
- (void)tap{
    //通过safai跳转到指定网页
    NSURL *url = [NSURL URLWithString:self.adItem.ori_curl];
    UIApplication *application = [UIApplication sharedApplication];
    if ([application canOpenURL:url]) {
        [application openURL:url];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景图片
    [self setLunchImage];
    //设置广告数据
    [self loadADData];
    //设置计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(jumpTimeChange) userInfo:nil repeats:YES];
    //为跳过按钮添加点击事件
    [self.jumpButton addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
}

//移除广告页面
- (void)jump{
    //修改设置主窗口控制器为LWTabBarController
    [UIApplication sharedApplication].keyWindow.rootViewController = [[LWTabBarController alloc] init];
    //销毁计时器
    [self.timer invalidate];
}

- (void)jumpTimeChange{
    //倒计时长为3秒
    static int i = 3;
    //修改跳过按钮上倒计时的值
    [self.jumpButton setTitle:[NSString stringWithFormat:@"  跳过（%d）",i] forState:UIControlStateNormal];
    //但倒计时的值为0时 移除广告页面
    if (i == 0) {
        [self jump];
    }
    i--;
}

- (void)loadADData{
    
    [[LWNetworkManager shared] requestWithMothod:GET url:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:@{@"code2":code2} completion:^(id responseDate, BOOL isSuccess) {
        if (isSuccess) {
            NSDictionary *dirt = [responseDate[@"ad"] lastObject];
            self.adItem = [LWADItem ADItemWithDict:dirt];
            //根据比例 设置广告图片显示的imageView的frame
            CGFloat imageViewHeight = screenWidth / self.adItem.w * self.adItem.h;
            self.imageView.frame = CGRectMake(0, 0, screenWidth, imageViewHeight);
            //设置广告图片
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.adItem.w_picurl]];
        }
    }];
}

//根据屏幕来加载图片
- (void)setLunchImage{
    if (iphone5) {
        self.backgroudImageView.image = [UIImage imageNamed:@"LaunchImage-568@2x"];
    }else if(iphone6){
        self.backgroudImageView.image = [UIImage imageNamed:@"LaunchImage-667@2x"];
    }else if(iphone6p){
        self.backgroudImageView.image = [UIImage imageNamed:@"LaunchImage-736h@3x"];
    }
}

@end
