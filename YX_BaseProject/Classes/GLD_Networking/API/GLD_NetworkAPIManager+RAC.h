//
//  GLD_NetworkAPIManager+RAC.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/12.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_NetworkAPIManager.h"

@interface GLD_NetworkAPIManager (RAC)

- (RACSignal *)dataSignalWithConfig:(GLD_APIConfiguration *)config;

@end
