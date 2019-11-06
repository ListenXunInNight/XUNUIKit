//
//  CALayer+XUNUIKit.m
//  Pods
//
//  Created by xun on 2019/10/29.
//

#import "CALayer+XUNUIKit.h"

@implementation CALayer (XUNUIKit)
#pragma mark - Getter & Setter
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

- (void)setXun_anchorPointX:(CGFloat)xun_anchorPointX {
    CGPoint anchorPoint = self.anchorPoint;
    anchorPoint.x = xun_anchorPointX;
    self.anchorPoint = anchorPoint;
}

- (CGFloat)xun_anchorPointX {
    return self.anchorPoint.x;
}

- (void)setXun_anchorPointY:(CGFloat)xun_anchorPointY {
    CGPoint anchorPoint = self.anchorPoint;
    anchorPoint.y = xun_anchorPointY;
    self.anchorPoint = anchorPoint;
}

- (CGFloat)xun_anchorPointY {
    return self.anchorPoint.y;
}

- (void)setxun_centerX:(CGFloat)xun_centerX {
    
    CGPoint center = self.xun_center;
    center.x = xun_centerX;
    self.xun_center = center;
}

- (CGFloat)xun_centerX {
    return self.xun_width / 2 + self.xun_x;
}

- (void)setxun_centerY:(CGFloat)xun_centerY {
    CGPoint center = self.xun_center;
    center.y = xun_centerY;
    self.xun_center = center;
}

- (CGFloat)xun_centerY {
    return self.xun_height / 2 + self.xun_y;
}

- (void)setxun_origin:(CGPoint)xun_origin {
    CGRect frame = self.frame;
    frame.origin = xun_origin;
    self.frame = frame;
}

- (CGPoint)xun_origin {
    return self.frame.origin;
}

- (void)setxun_center:(CGPoint)xun_center {
    CGPoint origin;
    origin.x = xun_center.x - self.xun_width * self.anchorPoint.x;
    origin.y = xun_center.y - self.xun_height * self.anchorPoint.y;
    self.xun_origin = origin;
}

- (CGPoint)xun_center {
    return CGPointMake(self.xun_x + self.xun_width * self.anchorPoint.x, self.xun_y + self.xun_height *self.anchorPoint.y);
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
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    CGRect frame;
    frame.origin.x = xun_edgeInsets.left;
    frame.origin.y = xun_edgeInsets.top;
    frame.size.width = self.superlayer.xun_width - xun_edgeInsets.left - xun_edgeInsets.right;
    frame.size.height = self.superlayer.xun_height - xun_edgeInsets.top - xun_edgeInsets.bottom;
    self.frame = frame;
}

- (UIEdgeInsets)xun_edgeInsets {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    return UIEdgeInsetsMake(self.xun_x, self.xun_y, self.superlayer.xun_width - self.xun_right, self.superlayer.xun_height - self.xun_bottom);
}


- (void)setxun_leadingCenter:(CGPoint)xun_leadingCenter {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    CGPoint p = CGPointMake(self.superlayer.xun_width / 2, self.superlayer.xun_height / 2);
    p.x += xun_leadingCenter.x;
    p.y += xun_leadingCenter.y;
    self.xun_center = p;
}

- (CGPoint)xun_leadingCenter {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    CGPoint p;
    p.x = self.xun_centerX - self.superlayer.xun_width / 2;
    p.y = self.xun_centerY - self.superlayer.xun_height / 2;
    return p;
}

- (void)setxun_leadingYCenter:(CGFloat)xun_leadingYCenter {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    self.xun_centerY = self.superlayer.xun_height / 2 + xun_leadingYCenter;
}

- (CGFloat)xun_leadingYCenter {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    return self.xun_centerY - self.superlayer.xun_height / 2;
}

- (void)setxun_leadingXCenter:(CGFloat)xun_leadingXCenter {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    self.xun_centerX = self.superlayer.xun_width / 2 + xun_leadingXCenter;
}
- (CGFloat)xun_leadingXCenter {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    return self.xun_centerX - self.superlayer.xun_width / 2;
}
#pragma mark - Only Getter

- (CGFloat)xun_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)xun_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)xun_trailingRight {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    return self.superlayer.xun_width - self.xun_right;
}

- (CGFloat)xun_trailingBottom {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    return self.superlayer.xun_height - self.xun_bottom;
}

#pragma mark - Only Setter

- (void)xun_fill {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    self.frame = self.superlayer.bounds;
}

- (void)xun_horizontalFill {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    CGRect frame = self.frame;
    frame.origin.x = 0;
    frame.size.width = self.superlayer.xun_width;
    self.frame = frame;
}

- (void)xun_verticalFill {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    CGRect frame = self.frame;
    frame.origin.y = 0;
    frame.size.height = self.superlayer.xun_height;
    self.frame = frame;
}

- (void)xun_cx_trailingRight:(CGFloat)trailing {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    self.xun_x = self.superlayer.xun_width - trailing - self.xun_width;
}

- (void)xun_cw_trailingRight:(CGFloat)trailing {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    self.xun_width = self.superlayer.xun_width - trailing - self.xun_x;
}

- (void)xun_cy_trailingBottom:(CGFloat)trailing {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    self.xun_y = self.superlayer.xun_height - trailing - self.xun_height;
}

- (void)xun_ch_trailingBottom:(CGFloat)trailing {
    NSAssert(self.superlayer, @"Please Add %@ to Superlayer", self);
    self.xun_height = self.superlayer.xun_height - trailing - self.xun_y;
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
