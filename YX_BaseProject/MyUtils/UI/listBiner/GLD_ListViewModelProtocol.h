//
//  GLD_ListViewModelProtocol.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/16.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GLD_ListViewModel;

@protocol GLD_ListViewModelProtocol <NSObject>

- (NSMutableArray *)allData;

- (RACCommand *)refreshCommand;
@optional
- (RACCommand *)loadMoreCommand;
@end

@protocol GLD_ListCellViewModelProtocol <NSObject>


- (instancetype)initWithListModel:(id)model;
@end


@protocol GLD_TableBinderProtocol < UITableViewDelegate, UITableViewDataSource>

- (NSArray<Class> *)CellClaesses;
@optional
- (NSArray<UINib *> *)cellForNibs;
@end
