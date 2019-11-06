//
//  UIView+XUNUIKit.h
//  Pods
//
//  Created by xun on 2019/10/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (XUNUIKit)

@property CGFloat xun_x;
@property CGFloat xun_y;
@property CGFloat xun_width;
@property CGFloat xun_height;

@property CGFloat xun_centerX;
@property CGFloat xun_centerY;
@property CGPoint xun_origin;
@property CGSize  xun_size;

/// 子视图与父视图上下左右边距【需先添加至父视图】
@property UIEdgeInsets  xun_edgeInsets;
/// 子视图中心与父视图中心的偏移量【需先添加至父视图】
@property CGPoint       xun_leadingCenter;
/// 子视图中心与父视图中心的 x 轴偏移量【需先添加至父视图】
@property CGFloat       xun_leadingXCenter;
/// 子视图中心与父视图中心的 y 轴偏移量【需先添加至父视图】
@property CGFloat       xun_leadingYCenter;

@property (readonly) CGFloat xun_right;
@property (readonly) CGFloat xun_bottom;
/// 子视图右侧与父视图右侧距离
@property (readonly) CGFloat xun_trailingRight;
/// 子视图底部与父视图底部距离
@property (readonly) CGFloat xun_trailingBottom;

/// 全部填充
- (void)xun_fill;
/// 上下填充
- (void)xun_verticalFill;
/// 左右填充
- (void)xun_horizontalFill;

/// 距离父视图右边距离【更改 x 轴位置】
- (void)xun_cx_trailingRight:(CGFloat)trailing;
/// 距离父视图右边距离【更改宽度】
- (void)xun_cw_trailingRight:(CGFloat)trailing;
/// 距离父视图底部距离【更改 y 轴位置】
- (void)xun_cy_trailingBottom:(CGFloat)trailing;
/// 距离父视图底部距离【更改高度】
- (void)xun_ch_trailingBottom:(CGFloat)trailing;

/// 更改 x 轴位置，设置右边位置
- (void)xun_cx_right:(CGFloat)right;
/// 更改宽度，设置右边位置
- (void)xun_cw_right:(CGFloat)right;
/// 更改 y 轴位置，设置底部位置
- (void)xun_cy_bottom:(CGFloat)bottom;
/// 更改高度，设置底部位置
- (void)xun_ch_bottom:(CGFloat)bottom;

/// 设置frame
- (void)xun_makeFrame:(void (^)(CGRect *frame))block;


@end

NS_ASSUME_NONNULL_END
