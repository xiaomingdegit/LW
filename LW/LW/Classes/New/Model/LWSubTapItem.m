//
//  LWSubTapItem.m
//  LW
//
//  Created by 刘威 on 2018/1/25.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWSubTapItem.h"

@implementation LWSubTapItem
//根据字典信息返回模型
+ (instancetype)subTapWithDict:(NSDictionary *)dict{
    LWSubTapItem *subTapItem = [[LWSubTapItem alloc] init];
    [subTapItem setValuesForKeysWithDictionary:dict];
    return subTapItem;
}
//根据字典数字信息返回模型数组
+ (NSArray *)subTapItemsWithArray:(NSArray *)arr{
    NSMutableArray *arrM = [[NSMutableArray alloc] init];
    //遍历数组 获取每个模型信息 生成模型
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LWSubTapItem *subTapItem = [LWSubTapItem subTapWithDict:obj];
        [arrM addObject:subTapItem];
    }];
    return arrM.copy;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
