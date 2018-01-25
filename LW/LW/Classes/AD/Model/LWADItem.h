//
//  LWADItem.h
//  LW
//
//  Created by 刘威 on 2018/1/24.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWADItem : NSObject

@property (nonatomic, strong) NSString *ori_curl;
@property (nonatomic, strong) NSString *w_picurl;
@property (nonatomic, assign) CGFloat h;
@property (nonatomic, assign) CGFloat w;

+(instancetype)ADItemWithDict:(NSDictionary *)dict;


@end
