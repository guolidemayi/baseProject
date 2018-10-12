//
//  GLD_ErrorView.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/16.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_ErrorView.h"

@interface GLD_ErrorView ()

@property (nonatomic, strong) UIButton *errorTextButton;
@property (nonatomic, strong) UIImageView *errorImageView;
@end

@implementation GLD_ErrorView

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self configuration];
        
        [self layoutUI];
    }
    return self;
}

#pragma mark - Private

- (void)configuration {
    self.backgroundColor = [UIColor colorWithHex:0xf4f4f7];
}

- (void)layoutUI {
    
    [self addSubview:self.errorTextButton];
    [self addSubview:self.errorImageView];
    
    [self.errorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    [self.errorTextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.errorImageView.mas_bottom).offset(5);
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.height.mas_equalTo(30);
    }];
}

#pragma mark - Getter

- (UIImageView *)errorImageView {
    if (!_errorImageView) {
        _errorImageView = [UIImageView new];
        _errorImageView.contentMode = UIViewContentModeScaleAspectFit;
        _errorImageView.image = @"UI_errorNoData".image;
    }
    return _errorImageView;
}

- (UIButton *)errorTextButton {
    if (!_errorTextButton) {
        _errorTextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _errorTextButton.titleLabel.font = [UIFont fontOfCode:3];
        [_errorTextButton setTitleColor:[UIColor colorWithRed:126.0/255 green:132.0/255 blue:145.0/255 alpha:1] forState:UIControlStateNormal];
        _errorTextButton.backgroundColor = [UIColor clearColor];
    }
    return _errorTextButton;
}

@end
