//
//  GLD_Mediator+Root.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_Mediator+Root.h"

static NSString *const targetRoot = @"GLD_TargetRoot";

@implementation GLD_Mediator (Root)

- (UITabBarController *)tabbarViewControllor{
    return [self performTarget:targetRoot action:@"tabbarViewController" params:nil shouldCacheTarget:NO];
}

- (UIViewController *)homeViewControllorWithTitle:(NSString *)title{
    return [self performTarget:targetRoot action:@"homeViewControllor:" params:@{@"title":title} shouldCacheTarget:NO];
}

- (UIViewController *)otherViewControllerWithTitle:(NSString *)title onClick:(void (^)(void))onClickHandler{
    id params = @{@"title":title ?: @"",
                  @"onClick":onClickHandler
                  };
    return [self performTarget:targetRoot action:@"otherViewControllor:" params:params shouldCacheTarget:NO];
}
@end
