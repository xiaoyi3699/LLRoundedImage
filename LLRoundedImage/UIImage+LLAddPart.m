//
//  UIImage+LLAddPart.m
//  LLRoundedImage
//
//  Created by WangZhaomeng on 2017/7/11.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UIImage+LLAddPart.h"

@implementation UIImage (LLAddPart)

- (UIImage *)ll_roundImageSize:(CGSize)size radius:(NSInteger)radius{
    int w = size.width;
    int h = size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    //CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, radius, radius);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), self.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    UIImage *img = [UIImage imageWithCGImage:imageMasked];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageMasked);
    return img;
}

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth, float ovalHeight){
    float fw, fh;
    if (ovalWidth == 0 || ovalHeight == 0){
        CGContextAddRect(context, rect);
        return;
    }
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    //根据圆角路径绘制
    CGContextMoveToPoint(context, fw, fh/2);
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1);
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

- (UIImage *)ll_imageWithShadowFrame:(CGRect)shadowFrame hollowFrame:(CGRect)hollowFrame shadowColor:(UIColor *)shadowColor{
    UIGraphicsBeginImageContextWithOptions(shadowFrame.size, NO, 1);
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(con, shadowColor.CGColor);
    CGContextFillRect(con, shadowFrame);
    CGContextAddEllipseInRect(con, hollowFrame);
    CGContextSetBlendMode(con, kCGBlendModeClear);
    CGContextFillPath(con);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
