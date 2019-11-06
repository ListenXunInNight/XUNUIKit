//
//  UIImage+XUNUIKit.m
//  Pods
//
//  Created by xun on 2019/10/29.
//

#import "UIImage+XUNUIKit.h"

@implementation UIImage (XUNUIKit)

+ (UIImage *)xun_imageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddRect(ctx, CGRectMake(0, 0, size.width, size.height));
    [color setFill];
    CGContextDrawPath(ctx, kCGPathFill);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)xun_imageWithColor:(UIColor *)color {
    return [self xun_imageWithColor:color size:(CGSize){1, 1}];
}

- (UIImage *)xun_roundCorner {
    CGSize size = self.size;
    return [self xun_roundCorners:0xF withSize:(CGSize){size.width / 2, size.height / 2}];
}
- (UIImage *)xun_roundCornerWithRadius:(CGFloat)radius {
    return [self xun_roundCorners:0xF withSize:(CGSize){radius, radius}];
}
- (UIImage *)xun_roundCornerWithSize:(CGSize)size {
    return [self xun_roundCorners:0xF withSize:size];
}

- (UIImage *)xun_roundCorners:(UIRectCorner)corners
                 withSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, UIScreen.mainScreen.scale);
    
    CGRect rect = (CGRect){(CGPoint){0, 0}, self.size};
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:size];
    [path addClip];
    
    [self drawInRect:rect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)xun_gradientImageWithSize:(CGSize)size
                                 colors:(NSArray *)colors
                             startPoint:(CGPoint)startPoint
                               endPoint:(CGPoint)endPoint {
    CGFloat locations[32];
    NSUInteger count = MIN(32, colors.count);
    NSMutableArray *cs = @[].mutableCopy;
    
    for (int i = 0; i < count; i++) {
        /// 绝对安全，不会越界
        UIColor *color = colors[i];
        [cs addObject:(__bridge id)color.CGColor];
        locations[i] = (CGFloat)i / (count - 1);
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddRect(ctx, (CGRect){CGPointZero, size});
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)cs, locations);
    
    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation);

    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)xun_drawText:(NSString *)text
            withAttributes:(NSDictionary *)attributes {
    
    CGSize size = [text sizeWithAttributes:attributes];
    CGPoint origin = CGPointMake((self.size.width - size.width) / 2, (self.size.height - size.height) / 2);
    
    return [self xun_drawText:text withAttributes:attributes origin:origin textSize:NULL];
}

- (UIImage *)xun_drawText:(NSString *)text
            withAttributes:(NSDictionary *)attributes
                    origin:(CGPoint)origin {
    return [self xun_drawText:text withAttributes:attributes origin:origin textSize:NULL];
}

- (UIImage *)xun_drawText:(NSString *)text
            withAttributes:(NSDictionary *)attributes
                    origin:(CGPoint)origin
                  textSize:(CGSize * _Nullable)textSize {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, UIScreen.mainScreen.scale);
    
    [self drawInRect:(CGRect){CGPointZero, self.size}];
    [text drawAtPoint:origin withAttributes:attributes];
    
#if DEBUG
    if (textSize) {
        CGSize size = [text sizeWithAttributes:attributes];
        textSize->width = size.width;
        textSize->height = size.height;
    }
#endif
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)xun_clipByRingWithWidth:(CGFloat)width
                               color:(UIColor *)color {
    CGSize size = self.size;
    UIGraphicsBeginImageContextWithOptions(self.size, NO, UIScreen.mainScreen.scale);
    
    CGRect rect = (CGRect){(CGPoint){width / 2, width / 2}, {size.width - width, size.height - width}};
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:0xF cornerRadii:size];
    path.lineWidth = width;
    [color setStroke];
    [path stroke];
    [path addClip];
    
    [self drawInRect:rect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)xun_invertColor {
    
    CGImageRef inputCGImage = [self CGImage];
    NSUInteger inputWidth = CGImageGetWidth(inputCGImage);
    NSUInteger inputHeight = CGImageGetHeight(inputCGImage);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    NSUInteger bytesPerPixel = 4;
    NSUInteger bitsPerComponent = 8;
    
    NSUInteger inputBytesPerRow = bytesPerPixel * inputWidth;
    
    UInt32 *inputPixels = (UInt32 *)calloc(inputHeight * inputWidth, sizeof(UInt32));
    
    CGContextRef context = CGBitmapContextCreate(inputPixels,
                                                 inputWidth,
                                                 inputHeight,
                                                 bitsPerComponent,
                                                 inputBytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    CGContextDrawImage(context, CGRectMake(0, 0, inputWidth, inputHeight), inputCGImage);
    
    for (NSUInteger j = 0; j < inputHeight; j++) {
        for (NSUInteger i = 0; i < inputWidth; i++) {
            UInt32 *inputPixel = inputPixels + j * inputWidth + i;
            *inputPixel = *inputPixel ^ 0xFFFFFF;
        }
    }
    CGImageRef newCGImage = CGBitmapContextCreateImage(context);
    UIImage * processedImage = [UIImage imageWithCGImage:newCGImage];
    
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    free(inputPixels);
    
    return processedImage;
}


@end
