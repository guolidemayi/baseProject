//
//  GLD_BaseViewController.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLD_BaseViewController : UIViewController

- (instancetype)initWithTitle:(NSString *)title onClick:(void (^)(void))clickHandler;
- (instancetype)initWithTitle:(NSString *)title;
@end
