//
//  GLD_TabelBiner.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/16.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_TabelBiner.h"
#import "UIView+GLD_ErrorView.h"
#import "GLD_NetworkError.h"

@interface GLD_TabelBiner ()


@property (nonatomic, strong)UITableView *view;//view
@property (nonatomic, strong)id<GLD_ListViewModelProtocol> viewModel;
@end


@implementation GLD_TabelBiner

@synthesize view = _tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithView:(UITableView *)view andViewModel:(id<GLD_ListViewModelProtocol>)viewModel{
    self = [super init];
    if (self) {
        self.view = view;
        [self bindViewModel:viewModel];
    }
    return self;
}

- (void)refreshData {
    [self.view.mj_header beginRefreshing];
}
- (void)bindViewModel:(id<GLD_ListViewModelProtocol>) viewModel{
    
    self.viewModel = viewModel;
    self.view.delegate = self;
    self.view.dataSource = self;
    
    if (IsExist_Array(self.CellClaesses))
        for (Class class in self.CellClaesses) {
            [self.view registerClass:class forCellReuseIdentifier:[class description]];
        }
    if (IsExist_Array(self.cellForNibs))
        for (UINib *nib in self.cellForNibs) {
            [self.view registerNib:nib forCellReuseIdentifier:[nib description]];
        }
    
    [self bindErrorView];
}


- (void)bindErrorView{
    //订阅，当收到刷新信号时隐藏
    @weakify(self);
    [self.viewModel.refreshCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        self.view.scrollEnabled = YES;
        self.view.errorView.hidden = YES;
    }];
    //订阅错误
    [self.viewModel.refreshCommand.errors subscribeNext:^(NSError *error) {
        @strongify(self);
        [self.view.mj_header endRefreshing];
        if (self.viewModel.allData.count == 0) {
            self.view.scrollEnabled = NO;
            self.view.errorView.hidden = NO;
            self.view.errorView.error = error;
            self.view.errorView.errorTextButton.rac_command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
                [self refreshData];
                return [RACSignal empty];
            }];
        }
    }];
    
}
- (void)bindTableHeader{
    @weakify(self);
    self.view.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        @strongify(self);
        [self.viewModel.refreshCommand execute:nil];
    }];
    [self.viewModel.refreshCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        [self.view.mj_header endRefreshing];
        [self.view.mj_footer resetNoMoreData];
        
        [self.view reloadData];
    }];
    
    
}

- (void)bindTableFooter{
    if (![self.viewModel respondsToSelector:@selector(loadMoreCommand)] ||
        self.viewModel.loadMoreCommand == nil) {
        return;
    }
    
    @weakify(self);
    self.view.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        
        [[self.viewModel.loadMoreCommand execute:nil] subscribeNext:^(id x) {
            
            [self.view.mj_footer endRefreshing];
            [self.view reloadData];
        } error:^(NSError *error) {
            
            if (error.code == gld_NetworkTaskErrorNoMoreData) {
                [self.view.mj_footer endRefreshingWithNoMoreData];
            } else {
                [self.view.mj_footer endRefreshing];
            }
        }];
    }];
    
    [RACObserve(self.view, contentSize) subscribeNext:^(NSNumber *contentSize) {
        @strongify(self);
        self.view.mj_footer.hidden = [contentSize CGSizeValue].height < self.view.mj_h;
    }];
}
@end
