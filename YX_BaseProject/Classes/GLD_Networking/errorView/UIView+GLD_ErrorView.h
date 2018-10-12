//
//  UIView+GLD_ErrorView.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/16.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLD_ErrorViewProtocol.h"

@interface UIView (GLD_ErrorView)

- (UIView<GLD_ErrorBinderProtocol> *)errorView;
@end
