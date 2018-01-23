//
//  LWADController.m
//  LW
//
//  Created by 刘威 on 2018/1/23.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWADController.h"

#define iphone5 (screenHeight == 568)
#define iphone6 (screenHeight == 667)
#define iphone6p (screenHeight == 736)

@interface LWADController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroudImageView;
@property (weak, nonatomic) IBOutlet UIImageView *adImageView;
@property (weak, nonatomic) IBOutlet UIButton *jumpButton;

@end

@implementation LWADController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLunchImage];
}

-(void)setLunchImage{
    if (iphone5) {
        self.backgroudImageView.image = [UIImage imageNamed:@"LaunchImage-568@2x"];
    }else if(iphone6){
        self.backgroudImageView.image = [UIImage imageNamed:@"LaunchImage-667@2x"];
    }else if(iphone6p){
        self.backgroudImageView.image = [UIImage imageNamed:@"LaunchImage-736h@3x"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
