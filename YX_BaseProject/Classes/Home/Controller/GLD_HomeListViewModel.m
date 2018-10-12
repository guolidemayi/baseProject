//
//  GLD_HomeListViewModel.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/10/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_HomeListViewModel.h"
#import "GLD_NetManager.h"
#import "GLD_WeiboModel.h"
#import "GLD_WeiBoCellViewModel.h"

@implementation GLD_HomeListViewModel

- (RACSignal *)fetchDataWithPage:(int)page{
   
   return [[[GLD_NetManager shareNetWorkManager] home_netGet:@""] map:^id(NSArray *value) {
       
       return [value.rac_sequence map:^id(GLD_WeiboModel *weibo) {
           return [GLD_WeiBoCellViewModel new];
       }];
       
    }];
}
@end
