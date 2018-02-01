//
//  LWCollectionItem.h
//  LW
//
//  Created by 刘威 on 2018/2/1.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWCollectionItem : NSObject

@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *url;

+(instancetype)collectionItemWithDict:(NSDictionary *)dict;

+(NSMutableArray *)conllectionItemsWithInfoArray:(NSArray *)dict;

@end
