//
//  UIButton+GLD_Extension.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (GLD_Extension)
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *selectedTitle;
@property (nonatomic, copy) NSString *disabledTitle;

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) UIImage *disabledImage;

@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) UIImage *selectedBackgroundImage;
@property (nonatomic, strong) UIImage *disabledBackgroundImage;
@end
