//
//  GLD_WeiboModel.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/10/9.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_WeiboModel.h"

@implementation GLD_WeiboModel

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"ID": @"idstr",
             @"sender": @"user",
             @"picUrls": @"pic_urls",
             @"createdDate": @"created_at",
             @"repostsCount": @"reposts_count",
             @"commentsCount": @"comments_count",
             @"attitudesCount": @"attitudes_count",
             @"retweetedWeibo": @"retweeted_status"};
}
@end
