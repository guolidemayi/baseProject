//
//  GLD_SegmentBinder.m
//  YX_BaseProject
//
//  Created by yiyangkeji on 2018/4/13.
//  Copyright © 2018年 com.yxvzb. All rights reserved.
//

#import "GLD_SegmentBinder.h"

#define screenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
@interface GLD_SegmentBinder ()<UIScrollViewDelegate>


//@property (nonatomic, weak)UIView *selecteItemView;
@property (nonatomic, weak)id<GLD_SegmentViewDataSource> dataSourceDelegate;
@property (nonatomic, weak)id<GLD_SegmentViewDelegate> delegate;

@property (nonatomic, weak)UIButton *selectBut;
@property (nonatomic, assign)CGFloat titleHeight;
@property (nonatomic, assign)NSInteger itemCount;
@end


static const NSInteger initialTag = 101;


@implementation GLD_SegmentBinder


- (UIView *)selecteItemView{
    if (!self.selectBut) return nil;
    return [self itemViewAtIndexInSegmentView:(self.selectBut.tag - initialTag)];
}
- (NSInteger)selecteIndex{
    if (!self.selectBut) return 0;
    return self.selectBut.tag - initialTag;
}

//相当于点击标题
- (void)setSelecteIndex:(NSInteger)selecteIndex{
    if (selecteIndex < 0) return;
    
    [self didSelectedTitle:[self.titleView viewWithTag:selecteIndex + initialTag]];
}
//点击按钮
- (void)didSelectedTitle:(UIButton *)senser{
    
    if (![senser isEqual:self.selectBut]) {
        
        if ([self.delegate respondsToSelector:@selector(SegmentView:didScrollToItemAtIndex:)]) {
            [self.delegate SegmentView:self didScrollToItemAtIndex:senser.tag - initialTag];
        }
        self.selectBut.selected = NO;
        self.selectBut = senser;
        self.selectBut.selected = YES;
        
        [self.contentView setContentOffset:CGPointMake((senser.tag - initialTag) * screenWidth, 0) animated:YES];
        
        
    }
    
    
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetX = scrollView.contentOffset.x * MIN(self.itemCount, 5);
    self.indicatorView.mj_x = offsetX;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSUInteger index = scrollView.contentOffset.x / CGRectGetWidth([UIScreen mainScreen].bounds) + initialTag;
    [self didSelectedTitle:[self.titleView viewWithTag:index]];
}
- (void)setDataSourceDelegate:(id<GLD_SegmentViewDataSource>)dataSourceDelegate{
    self.dataSourceDelegate = dataSourceDelegate;
    
    
    //设置数据后布局
    [self layoutContentView];
    //
    [self setSelecteIndex:self.selecteIndex];
}


- (void)layoutContentView{
    //赋值
    self.itemCount = [self itemCountForSegmentView];
    self.titleHeight = [self headerHeight];
    
    
    self.contentView.delegate = self;
    
    self.contentView.contentSize = CGSizeMake(screenWidth * self.itemCount, 0);
    
    for (int i = 0; i < self.itemCount; i++) {
        [self addtitleButAtIndex:i];
        [self addContentViewAtIndex:i];
    }
}



- (void)addtitleButAtIndex:(NSInteger)index{
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    
    NSString *title = [self titleForHeaderAtIndex:index];
    NSAttributedString *nomalStr = [[NSAttributedString alloc]initWithString:title attributes:[self attributesAtIndex:index andIsSelect:NO]];
    
    NSAttributedString *selecteStr = [[NSAttributedString alloc]initWithString:title attributes:[self attributesAtIndex:index andIsSelect:YES]];
    [but setAttributedTitle:nomalStr forState:UIControlStateNormal];
    [but setAttributedTitle:selecteStr forState:UIControlStateSelected];
    
    CGFloat width = screenWidth / MIN(self.itemCount, 5);
    but.tag = 0 + initialTag;
    but.frame = CGRectMake(width * index, 0, width, self.titleHeight - 3);
    
    [self.titleView addSubview:but];
    
    self.indicatorView.frame = CGRectMake(0, self.titleHeight - 3, width, 2);
    self.titleView.contentSize = CGSizeMake(width * self.itemCount, 0);
    [self.titleView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(self.titleHeight));
    }];
}

- (void)addContentViewAtIndex:(NSInteger)index{
    UIView *contentView = [self itemViewAtIndexInSegmentView:index];
    
    contentView.frame = CGRectMake(index * screenWidth, self.titleHeight, screenWidth, CGRectGetHeight(self.bounds) - self.titleHeight);
    [self.contentView addSubview:contentView];
    
}
- (CGFloat)headerHeight{
    if ([self.dataSourceDelegate respondsToSelector:@selector(heightOfheaderForSegmentView:)]) {
       return [self.dataSourceDelegate heightOfheaderForSegmentView:self];
    }
    return 0;
}

- (NSInteger)itemCountForSegmentView{
    if ([self.dataSourceDelegate respondsToSelector:@selector(numbersOfItemInSegmentView:)]) {
        return [self.dataSourceDelegate numbersOfItemInSegmentView:self];
    }
    return 0;
}

- (UIView *)itemViewAtIndexInSegmentView:(NSInteger)index{
    if ([self.dataSourceDelegate respondsToSelector:@selector(segmentView:itemViewAtIndex:)]) {
      return  [self.dataSourceDelegate segmentView:self itemViewAtIndex:index];
    }
    return [UIView new];
}
- (NSString *)titleForHeaderAtIndex:(NSInteger)index{
    if ([self.dataSourceDelegate respondsToSelector:@selector(segmentView:titleForItemAtIndex:)]) {
      return [self.dataSourceDelegate segmentView:self titleForItemAtIndex:index];
    }
    return @"";
}
- (NSDictionary *)attributesAtIndex:(NSInteger)index andIsSelect:(BOOL)select{
    if ([self.dataSourceDelegate respondsToSelector:@selector(segmentView:attributesForTitleAtIndex:isSelected:)]) {
        return [self.dataSourceDelegate segmentView:self attributesForTitleAtIndex:index isSelected:select];
    }
    return @{};
}
@end
