//
//  LWCollectionItem.m
//  LW
//
//  Created by 刘威 on 2018/2/1.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWCollectionItem.h"

@implementation LWCollectionItem

+(instancetype)collectionItemWithDict:(NSDictionary *)dict{
    LWCollectionItem *item = [[LWCollectionItem alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

+(NSMutableArray *)conllectionItemsWithInfoArray:(NSArray *)infoArr{
    NSMutableArray *arrM = [[NSMutableArray alloc] init];
    [infoArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LWCollectionItem *item = [LWCollectionItem collectionItemWithDict:obj];
        [arrM addObject:item];
    }];
    return arrM;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
