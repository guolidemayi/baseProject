//
//  GLD_WeiboModel.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/10/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLD_UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLD_WeiboModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, strong) GLD_UserModel *sender;

@property (nonatomic, copy) NSString *createdDate;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSArray *picUrls;
@property (nonatomic, assign) NSInteger repostsCount;
@property (nonatomic, assign) NSInteger commentsCount;
@property (nonatomic, assign) NSInteger attitudesCount;
@property (nonatomic, assign) BOOL favorited;

@property (nonatomic, strong) GLD_WeiboModel *retweetedWeibo;

@end

NS_ASSUME_NONNULL_END
