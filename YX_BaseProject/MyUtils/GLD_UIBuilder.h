//
//  GLD_UIBuilder.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBNavigationController.h"

@interface GLD_UIBuilder : NSObject

+ (LBNavigationController *)navigationControllerWithRootVC:(UIViewController *)rootVC;
@end
