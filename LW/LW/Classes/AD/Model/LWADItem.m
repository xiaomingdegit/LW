//
//  LWADItem.m
//  LW
//
//  Created by 刘威 on 2018/1/24.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWADItem.h"

@implementation LWADItem

+(instancetype)ADItemWithDict:(NSDictionary *)dict{
    LWADItem *ADItem = [[LWADItem alloc] init];
    [ADItem setValuesForKeysWithDictionary:dict];
    return ADItem;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
