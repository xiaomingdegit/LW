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
//重写item属性set方法 给xib控件设置数据
-(void)setItem:(LWSubTapItem *)item{
    _item = item;
    //通过SDWebImage设置iconView图片
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:item.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameView.text = item.theme_name;
    self.subView.text = item.sub_number;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    //设置头像圆角
    self.iconView.layer.cornerRadius = 30;
    self.iconView.layer.masksToBounds = YES;
}


@end
