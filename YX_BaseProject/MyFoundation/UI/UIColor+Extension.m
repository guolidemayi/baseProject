//
//  UIColor+Extension.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/12.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)
+ (UIColor *)colorWithHex:(long)rgbValue {
    return [UIColor colorWithRed:((rgbValue & 0xff0000) >> 16)/255.0 green:((rgbValue & 0x00FF00) >> 8)/255.0 blue:(rgbValue & 0x0000FF)/255.0 alpha:1.0];
}
@end
