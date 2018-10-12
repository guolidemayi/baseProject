//
//  GLD_ListViewModel.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/16.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLD_ListViewModelProtocol.h"


@interface GLD_ListViewModel : NSObject<GLD_ListViewModelProtocol>

- (RACSignal *)fetchDataWithPage:(int)page;
@end
