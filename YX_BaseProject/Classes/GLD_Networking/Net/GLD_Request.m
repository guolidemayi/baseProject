//
//  GLD_Request.m
//  GLD_Networking
//
//  Created by yiyangkeji on 2017/6/27.
//  Copyright © 2017年 yiyangkeji. All rights reserved.
//

#import "GLD_Request.h"
#import "GLD_Service.h"
#import "AFURLRequestSerialization.h"

#define RequestTimeoutInterval 8
@interface GLD_Request ()

@property(nonatomic, strong)AFJSONRequestSerializer *requestSerializer;
@end
@implementation GLD_Request

static GLD_Request *shareRequest;
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareRequest = [[GLD_Request alloc]init];
    });
    return shareRequest;
}

#pragma mark - Interface

+ (void)switchService{
    [GLD_Service switchService];
}

- (NSMutableURLRequest *)generateRequestWithPath:(NSString *)path useHttps:(BOOL)useHttps method:(NSString *)method params:(NSDictionary *)params headers:(NSDictionary *)headers{
    NSString *urlString = [self urlWithPath:path useHttps:useHttps];
    NSLog(@"url = %@", urlString);
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:method URLString:urlString parameters:params error:nil];
    request.timeoutInterval = RequestTimeoutInterval;
    [self setCommonRequestHeaderForRequest:request];
//    [self setCookies];
    NSLog(@"urlString = %@",urlString);
    [headers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString *  _Nonnull obj, BOOL * _Nonnull stop) {
        [request setValue:obj forHTTPHeaderField:key];
    }];
    return request;
}

- (NSMutableURLRequest *)generateUploadRequestWithPath:(NSString *)path useHttps:(BOOL)useHttps method:(NSString *)method params:(NSDictionary *)params headers:(NSDictionary *)headers contents:(NSArray<GLD_UploadFile *> *)contents{
    NSString *urlString = [self urlWithPath:path useHttps:useHttps];
    NSLog(@"url = %@", urlString);
    NSMutableURLRequest *request = [self.requestSerializer multipartFormRequestWithMethod:method URLString:urlString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [contents enumerateObjectsUsingBlock:^(GLD_UploadFile * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [formData appendPartWithFormData:obj.fileData name:obj.fileType];
        }];
        
    } error:nil];
    [self setCommonRequestHeaderForRequest:request];
    //    [self setCookies];
    
    [headers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString *  _Nonnull obj, BOOL * _Nonnull stop) {
        [request setValue:obj forHTTPHeaderField:key];
    }];
    return request;
}


- (NSString *)urlWithPath:(NSString *)path useHttps:(BOOL)useHttps{
    if ([path hasPrefix:@"http"]) {
        return path;
    }else{
        NSString *baseUrl = [GLD_Service currentService].baseUrl;
//        if (useHttps && baseUrl.length > 4) {
//            NSMutableString *stringM = [NSMutableString stringWithString:baseUrl];
//            [stringM insertString:@"s" atIndex:4];
//            baseUrl = [stringM copy];
//        }
        return [NSString stringWithFormat:@"%@/%@",baseUrl,path];
        
    }
}

- (void)setCookies {
    
}

- (NSMutableURLRequest *)setCommonRequestHeaderForRequest:(NSMutableURLRequest *)request {
    //    在这里设置通用的请求头
//    [request setValue:@"2" forHTTPHeaderField:@"os"];
//    [request setValue:[[UIDevice currentDevice] systemVersion] forHTTPHeaderField:@"osVersion"];
//    [request setValue:[YXUniversal getDeviceInfo] forHTTPHeaderField:@"phoneModel"];
//    [request setValue:[YXUniversal currentLanguage] forHTTPHeaderField:@"osLang"];
//    
//    if(IsExist_String([AppDelegate shareDelegate].token)){
//        [request setValue:[AppDelegate shareDelegate].token forHTTPHeaderField:@"token"];
//    }
    
    NSString* sNowVersion= [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    [request setValue:sNowVersion forHTTPHeaderField:@"appVersion"];
    
    return  request;
}
- (AFJSONRequestSerializer *)requestSerializer{
    if (!_requestSerializer) {
        _requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return _requestSerializer;
}
@end
