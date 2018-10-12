//
//  NSString+Extension.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/10/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

- (CGSize)sizeWithBoundingSize:(CGSize)boundingSize fontCode:(NSInteger)fontCode;

- (NSURL *)url;
- (UIImage *)image;
- (NSString *)encodeURLString;

- (BOOL)isValidPhoneNum;

@end

NS_ASSUME_NONNULL_END
