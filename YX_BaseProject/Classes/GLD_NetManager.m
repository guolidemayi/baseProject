//
//  GLD_NetManager.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/3/26.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_NetManager.h"
#import "GLD_NetworkAPIManager+RAC.h"

@interface GLD_NetManager ()

@end

@implementation GLD_NetManager


- (RACSignal *)home_netGet:(NSString *)str{

    GLD_APIConfiguration *config = [[GLD_APIConfiguration alloc]init];
    config.urlPath = homeDetailRequest;
    config.requestParameters = @{@"":@""};
    return [self dataSignalWithConfig:config];
}

@end
