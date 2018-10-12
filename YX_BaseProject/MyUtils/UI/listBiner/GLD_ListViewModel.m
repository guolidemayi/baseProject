//
//  GLD_ListViewModel.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/16.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_ListViewModel.h"
#import "GLD_ListViewModelProtocol.h"


@interface GLD_ListViewModel ()

@property (nonatomic, assign)int page;

@property (nonatomic, strong)NSMutableArray *allData;
@property (nonatomic, strong)RACCommand *refreshCommand;
@property (nonatomic, strong)RACCommand *loadMoreCommand;

@end
@implementation GLD_ListViewModel

- (RACCommand *)refreshCommand{
    if (!_refreshCommand) {
        @weakify(self);
        _refreshCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            return [[self fetchDataWithPage:self.page] doNext:^(id x) {
                self.page = 2;
                [self.allData removeAllObjects];
                [self.allData addObjectsFromArray:x];
            }];
        }];
    }
    return _refreshCommand;
}

- (RACCommand *)loadMoreCommand{
    if (!_loadMoreCommand) {
        @weakify(self);
        _loadMoreCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            return [[self fetchDataWithPage:self.page] doNext:^(id x) {
                self.page += 1;
                [self.allData addObjectsFromArray:x];
            }];
        }];
    }
    return _loadMoreCommand;
}


- (NSMutableArray *)allData{
    if (_allData == nil) {
        _allData = [NSMutableArray array];
    }
    return _allData;
}





- (RACSignal *)fetchDataWithPage:(int)page{
    return [RACSignal empty];
}


@end
