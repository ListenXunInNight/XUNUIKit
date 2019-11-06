//
//  UIView+XUNUIKit.m
//  Pods
//
//  Created by xun on 2019/10/29.
//

#import "UIView+XUNUIKit.h"

@implementation UIView (XUNUIKit)
- (void)setxun_x:(CGFloat)xun_x {
    
    CGRect frame = self.frame;
    frame.origin.x = xun_x;
    self.frame = frame;
}

- (CGFloat)xun_x {
    return self.frame.origin.x;
}


- (void)setxun_y:(CGFloat)xun_y {
    CGRect frame = self.frame;
    frame.origin.y = xun_y;
    self.frame = frame;
}

- (CGFloat)xun_y {
    return self.frame.origin.y;
}

- (void)setxun_width:(CGFloat)xun_width {
    CGRect frame = self.frame;
    frame.size.width = xun_width;
    self.frame = frame;
}

- (CGFloat)xun_width {
    return self.frame.size.width;
}

- (void)setxun_height:(CGFloat)xun_height {
    CGRect frame = self.frame;
    frame.size.height = xun_height;
    self.frame = frame;
}

- (CGFloat)xun_height {
    return self.frame.size.height;
}

- (void)setxun_centerX:(CGFloat)xun_centerX {
    
    CGPoint center = self.center;
    center.x = xun_centerX;
    self.center = center;
}

- (CGFloat)xun_centerX {
    return self.center.x;
}

- (void)setxun_centerY:(CGFloat)xun_centerY {
    CGPoint center = self.center;
    center.y = xun_centerY;
    self.center = center;
}

- (CGFloat)xun_centerY {
    return self.center.y;
}

- (void)setxun_origin:(CGPoint)xun_origin {
    CGRect frame = self.frame;
    frame.origin = xun_origin;
    self.frame = frame;
}

- (CGPoint)xun_origin {
    return self.frame.origin;
}

- (void)setxun_size:(CGSize)xun_size {
    CGRect frame = self.frame;
    frame.size = xun_size;
    self.frame = frame;
}

- (CGSize)xun_size {
    return self.frame.size;
}

- (void)setxun_edgeInsets:(UIEdgeInsets)xun_edgeInsets {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    CGRect frame;
    frame.origin.x = xun_edgeInsets.left;
    frame.origin.y = xun_edgeInsets.top;
    frame.size.width = self.superview.xun_width - xun_edgeInsets.left - xun_edgeInsets.right;
    frame.size.height = self.superview.xun_height - xun_edgeInsets.top - xun_edgeInsets.bottom;
    self.frame = frame;
}

- (UIEdgeInsets)xun_edgeInsets {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    return UIEdgeInsetsMake(self.xun_x, self.xun_y, self.superview.xun_width - self.xun_right, self.superview.xun_height - self.xun_bottom);
}


- (void)setxun_leadingCenter:(CGPoint)xun_leadingCenter {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    CGPoint p = CGPointMake(self.superview.xun_width / 2, self.superview.xun_height / 2);
    p.x += xun_leadingCenter.x;
    p.y += xun_leadingCenter.y;
    self.center = p;
}

- (CGPoint)xun_leadingCenter {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    CGPoint p;
    p.x = self.xun_centerX - self.superview.xun_width / 2;
    p.y = self.xun_centerY - self.superview.xun_height / 2;
    return p;
}

- (void)setxun_leadingYCenter:(CGFloat)xun_leadingYCenter {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    self.xun_centerY = self.superview.xun_height / 2 + xun_leadingYCenter;
}

- (CGFloat)xun_leadingYCenter {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    return self.xun_centerY - self.superview.xun_height / 2;
}

- (void)setxun_leadingXCenter:(CGFloat)xun_leadingXCenter {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    self.xun_centerX = self.superview.xun_width / 2 + xun_leadingXCenter;
}
- (CGFloat)xun_leadingXCenter {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    return self.xun_centerX - self.superview.xun_width / 2;
}
#pragma mark - Only Getter

- (CGFloat)xun_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)xun_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)xun_trailingRight {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    return self.superview.xun_width - self.xun_right;
}

- (CGFloat)xun_trailingBottom {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    return self.superview.xun_height - self.xun_bottom;
}

#pragma mark - Only Setter

- (void)xun_fill {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    self.frame = self.superview.bounds;
}

- (void)xun_horizontalFill {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    CGRect frame = self.frame;
    frame.origin.x = 0;
    frame.size.width = self.superview.xun_width;
    self.frame = frame;
}

- (void)xun_verticalFill {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    CGRect frame = self.frame;
    frame.origin.y = 0;
    frame.size.height = self.superview.xun_height;
    self.frame = frame;
}

- (void)xun_cx_trailingRight:(CGFloat)trailing {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    self.xun_x = self.superview.xun_width - trailing - self.xun_width;
}

- (void)xun_cw_trailingRight:(CGFloat)trailing {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    self.xun_width = self.superview.xun_width - trailing - self.xun_x;
}

- (void)xun_cy_trailingBottom:(CGFloat)trailing {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    self.xun_y = self.superview.xun_height - trailing - self.xun_height;
}

- (void)xun_ch_trailingBottom:(CGFloat)trailing {
    NSAssert(self.superview, @"Please Add %@ to Superview", self);
    self.xun_height = self.superview.xun_height - trailing - self.xun_y;
}

- (void)xun_cx_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}
- (void)xun_cw_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.size.width = right - frame.origin.x;
    self.frame = frame;
}

- (void)xun_cy_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
- (void)xun_ch_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.size.height = bottom - frame.origin.y;
    self.frame = frame;
}

- (void)xun_makeFrame:(void (^)(CGRect *rect))block {
    CGRect frame = self.frame;
    block(&frame);
    self.frame = frame;
}

@end
