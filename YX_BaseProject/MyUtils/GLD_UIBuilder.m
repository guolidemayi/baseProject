//
//  GLD_UIBuilder.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_UIBuilder.h"

@implementation GLD_UIBuilder

+ (LBNavigationController *)navigationControllerWithRootVC:(UIViewController *)rootVC{
    return [[LBNavigationController alloc]initWithRootViewController:rootVC];
}
@end
