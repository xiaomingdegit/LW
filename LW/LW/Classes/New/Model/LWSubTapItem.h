//
//  LWSubTapItem.h
//  LW
//
//  Created by 刘威 on 2018/1/25.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWSubTapItem : NSObject
//图片url
@property (nonatomic, strong) NSString *image_list;
//订阅数量
@property (nonatomic, strong) NSString *sub_number;
//标题
@property (nonatomic, strong) NSString *theme_name;
//根据字典信息返回模型
+ (instancetype)subTapWithDict:(NSDictionary *)dict;
//根据字典数字信息返回模型数组
+ (NSArray *)subTapItemsWithArray:(NSArray *)arr;

@end
