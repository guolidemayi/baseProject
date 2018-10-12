//
//  GLD_UploadFile.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/12.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_UploadFile.h"

@interface GLD_UploadFile ()

@property (nonatomic, strong)NSData *fileData;
@property (nonatomic, copy)NSString *fileType;
@end
@implementation GLD_UploadFile

- (instancetype)initWithData:(NSData *)data andFileType:(UploadFileType)type{
    self = [super init];
    if(self){
        self.fileData = data;
        switch (type) {
            case UploadFileTypeJpg:
                self.fileType = @"image/jpeg";
                break;
            case UploadFileTypePng:
                self.fileType = @"image/png";
                break;
            case UploadFileTypeMp3:
                self.fileType = @"audio/mp3";
                break;
        }
    }
    return self;
}


@end
