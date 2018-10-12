//
//  GLD_SegmentView.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/12.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_SegmentView.h"
#import "UIFont+Extension.h"

@interface GLD_SegmentView ()
@property (nonatomic, strong) UIView *colorView;
@property (nonatomic, strong) UIView *indicatorView;

@property (nonatomic, strong) UIScrollView *titleView;
@property (nonatomic, strong) UIScrollView *contentView;
@end
@implementation GLD_SegmentView

- (instancetype)init { return [self initWithFrame:CGRectZero]; }

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self configuration];
        [self layoutUI];
    }
    return self;
}

#pragma mark - Utils

- (void)configuration {
    
    self.backgroundColor = [UIColor whiteColor];
}

- (void)layoutUI {
    [self addSubview:self.titleView];
    [self addSubview:self.contentView];
    
    [self.indicatorView addSubview:self.colorView];
    [self.titleView addSubview:self.indicatorView];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(35);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom);
        make.bottom.left.right.equalTo(self);
    }];
    
    [self.colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.indicatorView);
        make.height.equalTo(self.indicatorView);
        make.width.equalTo(self.indicatorView).multipliedBy(0.25);
    }];
}

#pragma mark - Getter

- (UIView *)colorView {
    if (!_colorView) {
        _colorView = [UIView new];
        _colorView.backgroundColor = [UIColor colorWithHex:0xf14b5e];
    }
    return _colorView;
}

- (UIView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [UIView new];
        _indicatorView.backgroundColor = [UIColor clearColor];
    }
    return _indicatorView;
}

- (UIScrollView *)titleView {
    if (!_titleView) {
        _titleView = [UIScrollView new];
        _titleView.backgroundColor = [UIColor colorWithHex:0xe5e5e5];
        _titleView.showsVerticalScrollIndicator = NO;
        _titleView.showsHorizontalScrollIndicator = NO;
    }
    return _titleView;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        _contentView = [UIScrollView new];
        _contentView.pagingEnabled = YES;
        _contentView.backgroundColor = [UIColor colorWithHex:0xe5e5e5];
        _contentView.bounces = NO;
        _contentView.showsVerticalScrollIndicator = NO;
        _contentView.showsHorizontalScrollIndicator = NO;
        [_contentView neverAdjustScrollInsets];
    }
    return _contentView;
}


@end
