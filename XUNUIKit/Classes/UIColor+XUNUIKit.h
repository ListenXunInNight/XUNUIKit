//
//  UIColor+XUNUIKit.h
//  Pods
//
//  Created by xun on 2019/10/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (XUNUIKit)
/// 颜色值 RGBA
@property (readonly) UInt32 xun_RGBA;
/// 颜色值 RGB
@property (readonly) UInt32 xun_RGB;


+ (instancetype)xun_colorWithHex:(UInt32)hex;
+ (instancetype)xun_colorWithHex:(UInt32)hex
                       alpha:(float)alpha;

/// 更改颜色透明度
- (UIColor *)xun_colorWithAlpha:(float)alpha;
/// 反色
- (UIColor *)xun_reverseColor;
@end

NS_ASSUME_NONNULL_END
