//
//  LLImageTableViewCell.h
//  LLRoundedImage
//
//  Created by WangZhaomeng on 2017/7/11.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    LLImageViewControllerTypeFirst = 0, //第一种方式
    LLImageViewControllerTypeSecond,    //第二种方式
    LLImageViewControllerTypeThird,     //第三种方式
    LLImageViewControllerTypeFourth,    //第四种方式
    
}LLImageViewControllerType;

@interface LLImageTableViewCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
                         type:(LLImageViewControllerType)type;

@property (nonatomic, strong) UIImageView *llImageView_0;
@property (nonatomic, strong) UIImageView *llImageView_1;
@property (nonatomic, strong) UIImageView *llImageView_2;
@property (nonatomic, strong) UIImageView *llImageView_3;
@property (nonatomic, strong) UIImageView *llImageView_4;

- (void)setImage:(UIImage *)image;

@end
