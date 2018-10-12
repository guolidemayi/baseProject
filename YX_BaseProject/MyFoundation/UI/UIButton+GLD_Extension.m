//
//  UIButton+GLD_Extension.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "UIButton+GLD_Extension.h"

@implementation UIButton (GLD_Extension)

- (NSString *)title {
    return [self titleForState:UIControlStateNormal];
}

- (void)setTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
}

- (NSString *)selectedTitle {
    return [self titleForState:UIControlStateSelected];
}

- (void)setSelectedTitle:(NSString *)selectedTitle {
    [self setTitle:selectedTitle forState:UIControlStateSelected];
}

- (NSString *)disabledTitle {
    return [self titleForState:UIControlStateDisabled];
}

- (void)setDisabledTitle:(NSString *)disabledTitle {
    [self setTitle:disabledTitle forState:UIControlStateDisabled];
}

- (UIImage *)image {
    return [self imageForState:UIControlStateNormal];
}

- (void)setImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateNormal];
}

- (UIImage *)selectedImage {
    return [self imageForState:UIControlStateSelected];
}

- (void)setSelectedImage:(UIImage *)selectedImage {
    [self setImage:selectedImage forState:UIControlStateSelected];
}

- (UIImage *)disabledImage {
    return [self imageForState:UIControlStateDisabled];
}

- (void)setDisabledImage:(UIImage *)disabledImage {
    [self setImage:disabledImage forState:UIControlStateDisabled];
}

- (UIImage *)backgroundImage {
    return [self backgroundImageForState:UIControlStateNormal];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}

- (UIImage *)selectedBackgroundImage {
    return [self backgroundImageForState:UIControlStateSelected];
}

- (void)setSelectedBackgroundImage:(UIImage *)selectedBackgroundImage {
    [self setBackgroundImage:selectedBackgroundImage forState:UIControlStateSelected];
}

- (UIImage *)disabledBackgroundImage {
    return [self backgroundImageForState:UIControlStateDisabled];
}

- (void)setDisabledBackgroundImage:(UIImage *)disabledBackgroundImage {
    [self setBackgroundImage:disabledBackgroundImage forState:UIControlStateDisabled];
}

@end
