//
//  LWCollectionViewCell.m
//  LW
//
//  Created by 刘威 on 2018/2/1.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWCollectionViewCell.h"
#import <UIImageView+WebCache.h>
@interface LWCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;


@end

@implementation LWCollectionViewCell

-(void)setItem:(LWCollectionItem *)item{
    _item = item;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:item.icon]];
    self.nameLable.text = item.name;
}

@end
