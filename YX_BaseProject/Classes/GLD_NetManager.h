//
//  GLD_NetManager.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/3/26.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//


#import "GLD_NetworkAPIManager.h"

@interface GLD_NetManager : GLD_NetworkAPIManager

- (RACSignal *)home_netGet:(NSString *)str;


@end
