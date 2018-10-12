//
//  GLD_TargetRoot.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_TargetRoot.h"
#import "LBTabBarController.h"
#import "LBHomeViewController.h"

#import "GLD_WeiboListController.h"

@implementation GLD_TargetRoot


- (UITabBarController *)tabbarViewController {
    return [LBTabBarController new];
}

- (UIViewController *)homeViewControllor:(id)params{
    return [[LBHomeViewController alloc]initWithTitle:params[@"title"]];
}

- (UIViewController *)otherViewControllor:(id)params{
    return [[GLD_WeiboListController alloc]initWithTitle:params[@"title"] onClick:params[@"onClick"]];
}
@end
