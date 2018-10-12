//
//  GLD_Mediator.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GLD_Router [GLD_Mediator shareMediaor]

@interface GLD_Mediator : NSObject

+ (instancetype)shareMediaor;

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)isShould;

- (UINavigationController *)currentNavVc;
@end
