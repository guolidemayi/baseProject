//
//  GLD_SegmentViewProtocol.h
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/13.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GLD_SegmentView;
@protocol GLD_SegmentViewDelegate <NSObject>

@optional
- (void)SegmentView:(GLD_SegmentView *)segmentView didScrollToItemAtIndex:(NSInteger)Index;
@end


@protocol GLD_SegmentViewDataSource <NSObject>

- (NSInteger)numbersOfItemInSegmentView:(GLD_SegmentView *)segmentView;

- (UIView *)segmentView:(GLD_SegmentView *)segmentView itemViewAtIndex:(NSInteger)index;
- (NSString *)segmentView:(GLD_SegmentView *)segmentView titleForItemAtIndex:(NSInteger)index;
- (NSDictionary *)segmentView:(GLD_SegmentView *)segmentView attributesForTitleAtIndex:(NSInteger)index isSelected:(BOOL)selected;

@optional

- (CGFloat)heightOfheaderForSegmentView:(GLD_SegmentView *)segmentView;
@end


@protocol GLD_SegmentViewProtocol <NSObject>

@property (nonatomic, strong,readonly)UIView *selecteItemView;
@property (nonatomic, assign)NSInteger selecteIndex;

- (void)setDelegate:(id<GLD_SegmentViewDelegate>)delegate;
- (void)setDataSourceDelegate:(id<GLD_SegmentViewDataSource>)dataSourceDelegate;

@end
