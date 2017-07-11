//
//  LLViewController.m
//  LLRoundedImage
//
//  Created by WangZhaomeng on 2017/7/10.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLViewController.h"
#import "LLImageViewController.h"

@interface LLViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *titles;

@end

@implementation LLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"四种方式";
    _titles = @[@"第一种方式：正常图片，无圆角",
                @"第二种方式：使用layer.cornerRadius和layer.masksToBounds切圆角",
                @"第三种方式：使用drawRect绘制圆角",
                @"第四种方式：使用遮罩绘制圆角"];
    
    CGRect rect = self.view.bounds;
    rect.origin.y = 64;
    rect.size.height -= 64;
    _tableView = [[UITableView alloc] initWithFrame:rect];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        if (cell.textLabel.font.pointSize > 14) {
            cell.textLabel.font = [UIFont systemFontOfSize:14];
        }
        
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LLImageViewControllerType type = (LLImageViewControllerType)indexPath.row;
    LLImageViewController *imageVC = [[LLImageViewController alloc] initWithType:type];
    [self.navigationController pushViewController:imageVC animated:YES];
    
}

@end
