//
//  SJCAAnimation_XuanZhuan.m
//  SJCoreAnimation
//
//  Created by SPIREJ on 16/2/16.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJCAAnimation_XuanZhuan.h"

@interface SJCAAnimation_XuanZhuan ()
@property(nonatomic, strong)CALayer *layer;
@end

@implementation SJCAAnimation_XuanZhuan

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
    [self XuanZhuan];
}
//实例4：旋转属性
- (void)XuanZhuan{
    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnima.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    //CATransform3DIdentity 是单位矩阵，该矩阵没有缩放、旋转、歪斜、透视。把该矩阵应用到图层上面会把图层几何属性修改为默认值
    //沿着Z轴旋转
    transformAnima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0, 0, 1)];
    //旋转效果累计（即下一次动画执行是否接着刚才的动画）
    transformAnima.cumulative = YES;
    //旋转2遍
    transformAnima.repeatCount = 2;
    transformAnima.duration = 3.0;
    [self.layer addAnimation:transformAnima forKey:nil];
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
