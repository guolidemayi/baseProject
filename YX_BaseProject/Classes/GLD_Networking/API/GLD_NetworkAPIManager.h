//
//  GLD_NetworkAPIManager.h
//  GLD_Networking
//
//  Created by yiyangkeji on 2017/6/27.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "GLD_NetworkConfig.h"
#import "GLD_NetworkError.h"


//#import "GLD_RefreshHeader.h"
//#import "YXFooterRefresh.h"

@class GLD_UploadFile;
typedef void(^completionHandleBlock)(NSError *error, id result);
typedef void(^NetworkTaskProgressHandler)(CGFloat progress);

@interface GLD_APIConfiguration : NSObject

+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
@property (copy, nonatomic) NSString *urlPath;
@property (strong, nonatomic) NSDictionary *requestParameters;

@property (assign, nonatomic) BOOL useHttps;
@property (strong, nonatomic) NSDictionary *requestHeader;
@property (strong, nonatomic) NSArray<GLD_UploadFile *> *data;
@property (assign, nonatomic) gld_networkRequestType requestType;

@property (assign, nonatomic) NSTimeInterval cacheValidTimeInterval;
@property (nonatomic, strong) Class deserializeClass;//想要转化的类
@property (nonatomic, copy) NSString *deserializePath;//取值的key
@end

@interface GLD_NetworkAPIManager : NSObject

+ (instancetype)shareNetWorkManager;
+ (void)cancelTaskWith:(NSNumber *)taskIdentifier;

- (NSNumber *)dispatchDataTaskWith:(GLD_APIConfiguration *)config andCompletionHandler:(completionHandleBlock)completionHandle;
- (NSNumber *)dispatchUploadTaskWithConfiguration:(GLD_APIConfiguration *)config progressHandler:(NetworkTaskProgressHandler)progressHandler completionHandler:(completionHandleBlock)completionHandler;
@end
