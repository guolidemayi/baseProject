//
//  UIScrollView+Extension.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/13.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "UIScrollView+Extension.h"

@implementation UIScrollView (Extension)


- (void) neverAdjustScrollInsets {
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}
@end
