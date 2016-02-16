//
//  SJItemsTab.m
//  SJCoreAnimation
//
//  Created by SPIREJ on 16/2/16.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJItemsTab.h"
#import "SJCAAnimation_WeiYi.h"
#import "SJCAAnimation_SuoFang.h"
#import "SJCAAnimation_TouMingDu.h"
#import "SJCAAnimation_XuanZhuan.h"
#import "SJCAAnimation_ZuHeAnimation.h"
#import "SJCAAnimation_RectRun.h"

@interface SJItemsTab ()

@end

#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight  [UIScreen mainScreen].bounds.size.height
#define cellHeight 70

#define kLabelTitles @[@"1- 位移",@"2- 缩放",@"3- 透明度",@"4- 旋转",@"5- 组合动画",@"6- 绕矩形环跑"]
#define kDetialLabelText @[@"SJCAAnimation_WeiYi.h",@"SJCAAnimation_SuoFang.h",@"SJCAAnimation_TouMingDu.h",@"SJCAAnimation_XuanZhuan.h",@"SJCAAnimation_ZuHeAnimation.h",@"SJCAAnimation_RectRun.h"]

@interface SJItemsTab ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, copy)NSMutableArray *labelTextArray;
@property(nonatomic, copy)NSMutableArray *DetailLabelTextArray;

@end

@implementation SJItemsTab

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.frame = CGRectMake(0, 0, kDeviceWidth, kDeviceHeight);
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (NSMutableArray *)labelTextArray{
    if (!_labelTextArray) {
        _labelTextArray = [NSMutableArray arrayWithArray:kLabelTitles];
    }
    return _labelTextArray;
}
- (NSMutableArray *)DetailLabelTextArray{
    if (!_DetailLabelTextArray) {
        _DetailLabelTextArray = [NSMutableArray arrayWithArray:kDetialLabelText];
    }
    return _DetailLabelTextArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"";
    
    [self tableView];
    [self labelTextArray];
    [self DetailLabelTextArray];
}
//每组显示多少行cell数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _labelTextArray.count;
}
//cell内容设置，属性设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifily = @"cellIdentifily";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifily];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifily];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = _labelTextArray[indexPath.row];
    cell.detailTextLabel.text = _DetailLabelTextArray[indexPath.row];
    return cell;
}

// Variable height support
//cell 的高度（每组可以不一样）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.f;
}

//选中cell时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            SJCAAnimation_WeiYi *weiyiVC = [[SJCAAnimation_WeiYi alloc] init];
            [self.navigationController pushViewController:weiyiVC animated:YES];
        }
            break;
        case 1:
        {
            SJCAAnimation_SuoFang *suofangVC = [[SJCAAnimation_SuoFang alloc] init];
            [self.navigationController pushViewController:suofangVC animated:YES];
        }
            break;
        case 2:
        {
            SJCAAnimation_TouMingDu *toumingduVC = [[SJCAAnimation_TouMingDu alloc] init];
            [self.navigationController pushViewController:toumingduVC animated:YES];
        }
            break;
        case 3:
        {
            SJCAAnimation_XuanZhuan *xuanzhuanVC = [[SJCAAnimation_XuanZhuan alloc] init];
            [self.navigationController pushViewController:xuanzhuanVC animated:YES];
        }
            break;
        case 4:
        {
            SJCAAnimation_ZuHeAnimation *zuheVC = [[SJCAAnimation_ZuHeAnimation alloc] init];
            [self.navigationController pushViewController:zuheVC animated:YES];
        }
            break;
        case 5:
        {
            SJCAAnimation_RectRun *rectRun = [[SJCAAnimation_RectRun alloc] init];
            [self.navigationController pushViewController:rectRun animated:YES];
        }
            break;
        default:
            break;
    }
}


@end