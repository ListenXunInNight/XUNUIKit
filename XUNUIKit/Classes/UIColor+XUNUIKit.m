//
//  UIColor+XUNUIKit.m
//  Pods
//
//  Created by xun on 2019/10/29.
//

#import "UIColor+XUNUIKit.h"

@implementation UIColor (XUNUIKit)

- (UInt32)xun_RGBA {
    CGFloat r, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    
    UInt32 red = r * 255;
    UInt32 green = g * 255;
    UInt32 blue = b * 255;
    UInt32 alpha = a * 255;
    
    return alpha | (blue << 8) | (green << 16) | (red << 24);
}

- (UInt32)xun_RGB {
    CGFloat r, g, b;
    [self getRed:&r green:&g blue:&b alpha:nil];
    
    UInt32 red = r * 255;
    UInt32 green = g * 255;
    UInt32 blue = b * 255;
    
    return blue | (green << 8) | (red << 16);
}

+ (instancetype)xun_colorWithHex:(UInt32)hex {
    return [self xun_colorWithHex:hex alpha:1];
}

+ (instancetype)xun_colorWithHex:(UInt32)hex alpha:(float)alpha {
    unsigned char r = 0, g = 0, b = 0;
    
    b = hex & 0xFF;
    hex >>= 8;
    g = hex & 0xFF;
    hex >>= 8;
    r = hex & 0xFF;
    return [self colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:alpha];
}

- (UIColor *)xun_colorWithAlpha:(float)alpha {
    CGFloat r, g, b;
    [self getRed:&r green:&g blue:&b alpha:nil];
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

- (UIColor *)xun_reverseColor {
    CGFloat r, g, b;
    [self getRed:&r green:&g blue:&b alpha:nil];
    return [self.class colorWithRed:1-r green:1-g blue:1-b alpha:1];
}


@end
