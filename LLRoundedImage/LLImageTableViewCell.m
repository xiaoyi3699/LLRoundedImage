//
//  LLImageTableViewCell.m
//  LLRoundedImage
//
//  Created by WangZhaomeng on 2017/7/11.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLImageTableViewCell.h"
#import "UIImage+LLAddPart.h"

@implementation LLImageTableViewCell {
    LLImageViewControllerType _type;
    CGFloat _screenScale;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
                         type:(LLImageViewControllerType)type{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _type = type;
        _screenScale = [UIScreen mainScreen].scale;
        
        _llImageView_0 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        _llImageView_1 = [[UIImageView alloc] initWithFrame:CGRectMake(60, 10, 40, 40)];
        _llImageView_2 = [[UIImageView alloc] initWithFrame:CGRectMake(110, 10, 40, 40)];
        _llImageView_3 = [[UIImageView alloc] initWithFrame:CGRectMake(160, 10, 40, 40)];
        _llImageView_4 = [[UIImageView alloc] initWithFrame:CGRectMake(210, 10, 40, 40)];
        
        [self addSubview:_llImageView_0];
        [self addSubview:_llImageView_1];
        [self addSubview:_llImageView_2];
        [self addSubview:_llImageView_3];
        [self addSubview:_llImageView_4];
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    
    CGFloat cornerRadius = arc4random()%5+15;
    
    if (_type == LLImageViewControllerTypeThird) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            UIImage *roundImage = [image ll_roundImageSize:CGSizeMake(40*_screenScale, 40*_screenScale) radius:cornerRadius*_screenScale];
            dispatch_async(dispatch_get_main_queue(), ^{
                _llImageView_0.image = roundImage;
                _llImageView_1.image = roundImage;
                _llImageView_2.image = roundImage;
                _llImageView_3.image = roundImage;
                _llImageView_4.image = roundImage;
            });
        });
    }
    else {
        if (_type == LLImageViewControllerTypeSecond) {
            
            _llImageView_0.layer.cornerRadius = cornerRadius;
            _llImageView_0.layer.masksToBounds = YES;
            
            _llImageView_1.layer.cornerRadius = cornerRadius;
            _llImageView_1.layer.masksToBounds = YES;
            
            _llImageView_2.layer.cornerRadius = cornerRadius;
            _llImageView_2.layer.masksToBounds = YES;
            
            _llImageView_3.layer.cornerRadius = cornerRadius;
            _llImageView_3.layer.masksToBounds = YES;
            
            _llImageView_4.layer.cornerRadius = cornerRadius;
            _llImageView_4.layer.masksToBounds = YES;
        }
        else if (_type == LLImageViewControllerTypeFourth) {
            
            [self setShadowWithImageView:_llImageView_0];
            [self setShadowWithImageView:_llImageView_1];
            [self setShadowWithImageView:_llImageView_2];
            [self setShadowWithImageView:_llImageView_3];
            [self setShadowWithImageView:_llImageView_4];
        }
        _llImageView_0.image = image;
        _llImageView_1.image = image;
        _llImageView_2.image = image;
        _llImageView_3.image = image;
        _llImageView_4.image = image;
    }
}

//使用遮罩绘制圆角
- (void)setShadowWithImageView:(UIImageView *)imageView {
    CAShapeLayer *markLayer = [[CAShapeLayer alloc] init];
    markLayer.frame = CGRectMake(0, 0, 40, 40);
    markLayer.fillColor = [UIColor whiteColor].CGColor;
    markLayer.fillRule = kCAFillRuleEvenOdd;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, nil, markLayer.bounds);
    CGPathAddEllipseInRect(path, nil, markLayer.bounds);
    markLayer.path = path;
    
    for (CALayer *layer in imageView.layer.sublayers) {
        [layer removeFromSuperlayer];
    }
    [imageView.layer addSublayer:markLayer];
}

@end
