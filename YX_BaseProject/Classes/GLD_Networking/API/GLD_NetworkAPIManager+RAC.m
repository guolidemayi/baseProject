//
//  GLD_NetworkAPIManager+RAC.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/12.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_NetworkAPIManager+RAC.h"

@implementation GLD_NetworkAPIManager (RAC)

- (RACSignal *)dataSignalWithConfig:(GLD_APIConfiguration *)config{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSNumber *nuber = [self dispatchDataTaskWith:config andCompletionHandler:^(NSError *error, id result) {
            
            if (error) {
                [subscriber sendError:error];
            }else{
                [subscriber sendNext:result];
            }
            [subscriber sendCompleted];
            
        }];
        return [RACDisposable disposableWithBlock:^{
            [GLD_NetworkAPIManager cancelTaskWith:nuber];
        }];
    }];
}

@end
