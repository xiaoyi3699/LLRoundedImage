//
//  LLImageViewController.m
//  LLRoundedImage
//
//  Created by WangZhaomeng on 2017/7/11.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLImageViewController.h"

@interface LLImageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LLImageViewController{
    LLImageViewControllerType _type;
    NSMutableArray *_images;
}

- (instancetype)initWithType:(LLImageViewControllerType)type {
    self = [super init];
    if (self) {
        _type      = type;
        self.title = @"图片展示";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _images = [NSMutableArray arrayWithCapacity:32];
    for (NSInteger i = 0; i < 32; i ++) {
        NSString *imageName = [NSString stringWithFormat:@"%ld.jpg",(long)i];
        [_images addObject:[UIImage imageNamed:imageName]];
    }
    
    CGRect rect = self.view.bounds;
    rect.origin.y = 64;
    rect.size.height -= 64;
    _tableView = [[UITableView alloc] initWithFrame:rect];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    _tableView.rowHeight = 60;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _images.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LLImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[LLImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell" type:_type];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell setImage:_images[indexPath.row]];
    return cell;
}

@end
