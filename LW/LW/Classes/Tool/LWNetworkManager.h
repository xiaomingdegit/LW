//
//  LWNetworkManager.h
//  LW
//
//  Created by 刘威 on 2018/1/25.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import <AFHTTPSessionManager.h>

typedef enum : NSUInteger {
    GET,
    POST,
}Method;

@interface LWNetworkManager : AFHTTPSessionManager

+(instancetype)shared;
-(void)requestWithMothod:(Method)mothod url:(NSString *)url parameters:(NSDictionary *)parameters completion:(void(^)(id responseDate, BOOL isSuccess))completion;

@end
