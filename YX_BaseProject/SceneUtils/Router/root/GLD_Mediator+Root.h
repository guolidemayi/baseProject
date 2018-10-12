//
//  GLD_Mediator+Root.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_Mediator.h"

@interface GLD_Mediator (Root)

- (UITabBarController *)tabbarViewControllor;
- (UIViewController *)homeViewControllorWithTitle:(NSString *)title;
- (UIViewController *)otherViewControllerWithTitle:(NSString *)title onClick:(void (^)(void))onClickHandler;
@end
