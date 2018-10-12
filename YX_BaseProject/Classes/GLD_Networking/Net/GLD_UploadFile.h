//
//  GLD_UploadFile.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/12.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    UploadFileTypePng,
    UploadFileTypeJpg,
    UploadFileTypeMp3
} UploadFileType;
@interface GLD_UploadFile : NSObject

- (instancetype)initWithData:(NSData *)data andFileType:(UploadFileType)type;
- (NSData *)fileData;
- (NSString *)fileType;

@end
