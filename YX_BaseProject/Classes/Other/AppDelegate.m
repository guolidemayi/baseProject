//
//  AppDelegate.m
//  XianYu
//
//  Created by li  bo on 16/5/28.
//  Copyright © 2016年 li  bo. All rights reserved.
//

#import "AppDelegate.h"
#import "GLD_Mediator+Root.h"
#import "LBTabBarController.h"

#define LBKeyWindow [UIApplication sharedApplication].keyWindow
@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];


//    LBTabBarController *tabBarVc = [[LBTabBarController alloc] init];
//
//
//    CATransition *anim = [[CATransition alloc] init];
//    anim.type = @"rippleEffect";
//    anim.duration = 1.0;
//
//
//    [self.window.layer addAnimation:anim forKey:nil];

    self.window.rootViewController = [GLD_Router tabbarViewControllor];




    return YES;
}


@end
