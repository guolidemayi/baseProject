//
//  GLD_ErrorViewBinder.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/16.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_ErrorViewBinder.h"
#import "UIFont+Extension.h"
#import "GLD_NetworkError.h"

@interface GLD_ErrorViewBinder ()

@end

@implementation GLD_ErrorViewBinder

- (UIButton *)errorTextButton{
    return self.errorTextButton;
}
- (UIImageView *)errorImageView{
    return self.errorImageView;
}
- (void)setError:(NSError *)error {
    
    self.errorTextButton.userInteractionEnabled = YES;
    switch (error.code) {
            
        case gld_NetworkTaskErrorNoData: {
            
            self.errorTextButton.userInteractionEnabled = NO;
            [self.errorTextButton setTitle:@"暂无数据" forState:UIControlStateNormal];
            [self.errorTextButton setAttributedTitle:nil forState:UIControlStateNormal];
//            self.errorImageView.image = @"UI_errorNoData".image;
        }   break;
            
        case gld_NetworkTaskErrorCannotConnectedToInternet: {
            
            [self.errorTextButton setTitle:nil forState:UIControlStateNormal];
            [self.errorTextButton setAttributedTitle:[self attributedTextWithPrefixText:@"没有网络, " suffixText:@"点击重试"] forState:UIControlStateNormal];
//            self.errorImageView.image = @"UI_errorNoNetwork".image;
        }   break;
            
        default: {
            
            [self.errorTextButton setTitle:nil forState:UIControlStateNormal];
            [self.errorTextButton setAttributedTitle:[self attributedTextWithPrefixText:@"加载失败, " suffixText:@"点击重试"] forState:UIControlStateNormal];
//            self.errorImageView.image = @"UI_errorDefault".image;
        }   break;
    }
    
}

#pragma mark - Utils

- (NSAttributedString *)attributedTextWithPrefixText:(NSString *)prefixText suffixText:(NSString *)suffixText {
    
    UIColor *prefixTextColor = [UIColor colorWithRed:126.0/255 green:132.0/255 blue:145.0/255 alpha:1];
    UIColor *suffixTextColor = [UIColor colorWithRed:86.0/255 green:162.0/255 blue:247.0/255 alpha:1];
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:prefixText attributes:@{NSForegroundColorAttributeName : prefixTextColor}];
    [attributedText appendAttributedString:[[NSAttributedString alloc] initWithString:suffixText attributes:@{NSForegroundColorAttributeName : suffixTextColor, NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle), NSUnderlineColorAttributeName : suffixTextColor}]];
    
    [attributedText addAttribute:NSFontAttributeName value:[UIFont fontOfCode:3] range:NSMakeRange(0, attributedText.length)];
    return attributedText;
}
@end
