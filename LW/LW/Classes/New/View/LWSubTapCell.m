//
//  LWSubTapCell.m
//  LW
//
//  Created by 刘威 on 2018/1/25.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWSubTapCell.h"
#import <UIImageView+WebCache.h>

@interface LWSubTapCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *subView;

@end

@implementation LWSubTapCell
-(void)setFrame:(CGRect)frame{
    frame.size.height -= 1;
    [super setFrame:frame];
}

//重写item属性set方法 给xib控件设置数据
-(void)setItem:(LWSubTapItem *)item{
    _item = item;
    //通过SDWebImage设置iconView图片
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:item.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        //裁剪图片 设置头像圆角
        //开启上下文
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
        //设置裁剪路径
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        //设置裁剪区域
        [path addClip];
        //画图
        [image drawAtPoint:CGPointZero];
        //获取上下文裁剪的图片
        _iconView.image = UIGraphicsGetImageFromCurrentImageContext();
        //关闭上下文
        UIGraphicsEndImageContext();
    }];
    self.nameView.text = item.theme_name;
    //但订阅人数超过10000时 设置为1万
    self.subView.text = ({
        NSString *subNmuber = [NSString stringWithFormat:@"%@人订阅",item.sub_number];
        if (item.sub_number.integerValue >= 10000) {
            subNmuber = [NSString stringWithFormat:@"%0.1lf万人订阅",item.sub_number.integerValue * 1.0 / 10000];
        }
        subNmuber;
    });
}

- (void)awakeFromNib {
    [super awakeFromNib];
//    //设置头像圆角
//    self.iconView.layer.cornerRadius = 30;
//    self.iconView.layer.masksToBounds = YES;
}

@end
