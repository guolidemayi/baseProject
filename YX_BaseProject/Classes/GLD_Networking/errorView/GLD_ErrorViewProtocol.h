//
//  GLD_ErrorViewProtocol.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/16.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol GLD_ErrorBinderProtocol <NSObject>
- (void)setError:(NSError *)error;

- (UIButton *)errorTextButton;
- (UIImageView *)errorImageView;

@end
