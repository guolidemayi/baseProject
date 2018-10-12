//
//  gld_configure.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/3/26.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#ifndef gld_configure_h
#define gld_configure_h



//屏幕适配
#define WIDTH(_width) @((_width) * DEVICEWIDTH_SCALE)
#define HEIGHT(_height) @((_height) * DEVICEWIDTH_SCALE)
#define W(_width) ((_width) * DEVICEWIDTH_SCALE)
#define H(_height) ((_height) * DEVICEWIDTH_SCALE)


#define WS(weakSelf)  __weak __typeof(self)weakSelf = self;

#define IsExist_Array(_array) (_array!= nil && _array.count>0)
#define IsExist_String(_str) (_str!=nil && _str.length!=0 && ![_str isEqualToString:@""])
#define GetString(_str) (IsExist_String(_str) ? _str: @"")
#endif /* gld_configure_h */
