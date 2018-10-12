//
//  UIFont+Extension.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/16.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Extension)
/** 获取不同字号的字体 */
+ (UIFont *)fontOfCode:(NSInteger)number;

/** 粗体 */
+ (UIFont *)boldFontOfCode:(NSInteger)number;

@end
