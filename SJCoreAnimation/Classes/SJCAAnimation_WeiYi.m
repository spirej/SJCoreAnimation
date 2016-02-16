//
//  SJCAAnimation_WeiYi.m
//  SJCoreAnimation
//
//  Created by SPIREJ on 16/2/16.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJCAAnimation_WeiYi.h"

@interface SJCAAnimation_WeiYi ()
@property(nonatomic, strong)CALayer *layer;
@end

@implementation SJCAAnimation_WeiYi

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    CALayer *layer = [CALayer layer];
    [self.view.layer addSublayer:layer];
    layer.frame = CGRectMake(100, 200, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    self.layer = layer;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self WeiYi];
}
//实例1：（位移）以position作为参考点来执行动画的
-(void)WeiYi{
    //创建基础动画
    CABasicAnimation *ban = [CABasicAnimation animation];
    //设置动画路径
    //从什么值开始，因为fromValue是个id类型，所以把起点point包装成NSValue传递给他
    //锚点的位置（如果不写fromValue，代表从当前位置开始变）
    ban.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    //变化到什么值结束
    ban.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 500)];
    
    //设置动画对象
    //keyPath 决定了执行怎样的动画
    //使用kvc的方式来告诉动画，要使用layer的哪个属性变动来完成动画效果
    //    NSString *keyPath = @"position";
    //
    //    [self.layer addAnimation:ban forKey:keyPath];
    
    //没起作用，因为是在动画添加到layer之后的属性，所以没有起作用
    ban.duration = 3.0;
    
    //当动画执行完成后，还会回到最初的位置，这是核心动画的特点
    //禁止归位，执行完动画之后移除动画效果
    //注意这量两个属性，要改变核心动画的属性，必须都添加到layer之前，否则无效
    
    //动画完成后不删除
    ban.removedOnCompletion = NO;
    //保持最新的状态
    ban.fillMode = kCAFillModeForwards;
    NSString *keyPath = @"position";
    [self.layer addAnimation:ban forKey:keyPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
