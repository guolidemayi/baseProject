//
//  UIView+GLD_ErrorView.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/16.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "UIView+GLD_ErrorView.h"
#import "GLD_ErrorViewBinder.h"
#import <objc/runtime.h>

@implementation UIView (GLD_ErrorView)

static void *errorKey = &errorKey;

- (UIView<GLD_ErrorBinderProtocol> *)errorView{
    GLD_ErrorViewBinder *errorView = objc_getAssociatedObject(self, errorKey);
    
    if (errorView) {
        errorView = [self addErrorView];
        //保存
        objc_setAssociatedObject(self, errorKey, errorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return errorView;
    
}

- (GLD_ErrorViewBinder *)addErrorView {
    
    GLD_ErrorViewBinder *errorView = [[GLD_ErrorViewBinder alloc] initWithFrame:self.bounds];
    errorView.backgroundColor = self.backgroundColor;
    [self addSubview:errorView];
    
    if (![self isKindOfClass:[UIScrollView class]]) {
        [errorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsZero);
        }];
    }
    errorView.hidden = YES;
    return errorView;
}
@end
