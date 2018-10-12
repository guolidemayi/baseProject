//
//  GLD_NetworkClient.h
//  GLD_Networking
//
//  Created by yiyangkeji on 2017/6/27.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLD_NetworkConfig.h"

@class GLD_UploadFile;
@interface GLD_NetworkClient : NSObject


- (NSNumber *)dispatchTaskWithPath:(NSString *)path
                          useHttps:(BOOL)useHttps
                       requestType:(gld_networkRequestType)requestType
                            params:(NSDictionary *)params
                           headers:(NSDictionary *)headers
                  completionHandle:(void(^)(NSURLResponse *response,id responseObject,NSError *error))completionHandle;


- (NSNumber *)dispatchUploadTaskWithPath:(NSString *)path
                                useHttps:(BOOL)useHttps
                                  params:(NSDictionary *)params
                                 headers:(NSDictionary *)headers
                                contents:(NSArray<GLD_UploadFile *> *)contents
                        completionHandle:(void(^)(NSURLResponse *response,id responseObject,NSError *error))completionHandle;
+ (instancetype)shareInstance;

+ (void)cancleTaskWithTaskIdentifier:(NSNumber *)taskIdentifier;
+ (void)cancelAlltask;
@end
