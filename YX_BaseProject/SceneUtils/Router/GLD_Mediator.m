//
//  GLD_Mediator.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_Mediator.h"
#import <objc/runtime.h>


@interface GLD_Mediator ()

@property (nonatomic, strong) NSMutableDictionary *cachedTarget;

@end
@implementation GLD_Mediator


+ (instancetype)shareMediaor{
    
    static GLD_Mediator *mediaor;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediaor = [[GLD_Mediator alloc]init];
    });
    return mediaor;
}

- (UINavigationController *)currentNavVc{
    UITabBarController *tabbar = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    return tabbar.selectedViewController;
}

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)isShould{
    
    Class targetClass;
    
    NSObject *target = self.cachedTarget[targetName];
    if (target == nil) {
       targetClass = NSClassFromString(targetName);
        target = [[targetClass alloc]init];
    }
    
    if (target == nil) {
        //可根据开发设置默认处理
        return nil;
    }
    SEL action = NSSelectorFromString(actionName);
    
    if (isShould) {
        self.cachedTarget[targetName] = target;
    }
    
    
    if ([target respondsToSelector:action]) {
        return [self safePerformAction:action target:target params:params];
    }else{
        //如果是swift 对象
        action = NSSelectorFromString([NSString stringWithFormat:@"Action_%@WithParams:", actionName]);
        if ([target respondsToSelector:action]) {
           return [self safePerformAction:action target:target params:params];
        }else{
            SEL act = NSSelectorFromString(@"notFound:");
            if ([target respondsToSelector:act]) {
                return [self safePerformAction:act target:target params:nil];
            }else{
                [self.cachedTarget removeObjectForKey:targetName];
                return nil;
            }
        }
    }
    
}

#pragma mark - private methods
- (id)safePerformAction:(SEL)action target:(NSObject *)target params:(NSDictionary *)params{
    /**
     
     调用方法的两种方式：
     1，performSelector: withObject: 方法。 此方法只能传一个参数
     2，NSIvocation 方法调用。此方法能传多个参数
     */
    // 创建一个函数签名，这个签名可以是任意的，但需要注意，签名函数的参数数量要和调用的一致
    NSMethodSignature *sig = [target methodSignatureForSelector:action];
    
    if(sig == nil)return nil;
    
    const char *type = sig.methodReturnType;
    id value;
//    strcmp 返回值为 相等
    if (strcmp(type, @encode(void)) == 0) {
        //根据方法签名生成
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
        //设置消息调用者
        [invocation setTarget:target];
        //设置调用消息
        [invocation setSelector:action];
        //设置消息调用参数  从2开始是因为0和1分别target和action 占用
        [invocation setArgument:&params atIndex:2];
        //消息调用
        [invocation invoke];
        
        return nil;
    }
    if(strcmp(type, @encode(NSInteger)) == 0){
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        [invocation getReturnValue:&value];
        return value;
    }
    if(strcmp(type, @encode(BOOL)) == 0){
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        [invocation getReturnValue:&value];
        return value;
    }
    if(strcmp(type, @encode(CGFloat)) == 0){
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        [invocation getReturnValue:&value];
        return value;
    }
    if(strcmp(type, @encode(NSUInteger)) == 0){
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        [invocation getReturnValue:&value];
        return value;
    }
    //此方法是利用运行时给对象添加方法 此时编译器并不知道添加的方法是什么，这时候就会报错，这个宏就是忽略此报错的
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    //performSelector:withObject: 此方法不能返回基础数据类型对象（如：CGFloat等）
    return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
    
    
}


- (NSMutableDictionary *)cachedTarget{
    if (!_cachedTarget) {
        _cachedTarget = [NSMutableDictionary dictionary];
        
    }
    return _cachedTarget;
}
@end
