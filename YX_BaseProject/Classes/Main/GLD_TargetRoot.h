//
//  GLD_TargetRoot.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GLD_TargetRoot : NSObject
- (UITabBarController *)tabbarViewController;

- (UIViewController *)homeViewControllor:(id)params;
- (UIViewController *)otherViewControllor:(id)params;
@end
