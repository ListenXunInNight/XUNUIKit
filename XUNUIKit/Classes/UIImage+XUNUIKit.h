//
//  UIImage+XUNUIKit.h
//  Pods
//
//  Created by xun on 2019/10/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (XUNUIKit)
+ (UIImage *)xun_imageWithColor:(UIColor *)color;
+ (UIImage *)xun_imageWithColor:(UIColor *)color
                            size:(CGSize)size;

- (UIImage *)xun_roundCorner;
- (UIImage *)xun_roundCornerWithRadius:(CGFloat)radius;
- (UIImage *)xun_roundCornerWithSize:(CGSize)size;
- (UIImage *)xun_roundCorners:(UIRectCorner)corners
                      withSize:(CGSize)size;
/// 最多仅支持 32 种渐变
+ (UIImage *)xun_gradientImageWithSize:(CGSize)size
                                 colors:(NSArray *)colors
                             startPoint:(CGPoint)startPoint
                               endPoint:(CGPoint)endPoint;


/// 绘制文本【居中显示】
- (UIImage *)xun_drawText:(NSString *)text
            withAttributes:(NSDictionary *)attributes;
- (UIImage *)xun_drawText:(NSString *)text
            withAttributes:(NSDictionary *)attributes
                    origin:(CGPoint)origin;
/// 圆环裁剪
- (UIImage *)xun_clipByRingWithWidth:(CGFloat)width
                               color:(UIColor *)color;
/**
 绘制文本至图片

 @param text 文本内容
 @param attributes 文本属性
 @param origin 文本原点
 @param textSize 获取文本 size 方便调试【仅在 DEBUG 环境有效】
 @return 绘制后的图片
 */
- (UIImage *)xun_drawText:(NSString *)text
            withAttributes:(NSDictionary *)attributes
                    origin:(CGPoint)origin
                  textSize:(CGSize * _Nullable)textSize;

/// 反色
- (UIImage *)xun_invertColor;
@end

NS_ASSUME_NONNULL_END
