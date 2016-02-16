//
//  SJCAAnimation_SuoFang.m
//  SJCoreAnimation
//
//  Created by SPIREJ on 16/2/16.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJCAAnimation_SuoFang.h"

@interface SJCAAnimation_SuoFang ()
@property(nonatomic, strong)CALayer *layer;
@end

@implementation SJCAAnimation_SuoFang

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
    [self SuoFang];
}

//实例2：缩放属性
-(void)SuoFang{
    CABasicAnimation *ban = [CABasicAnimation animation];
    ban.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5, 1.5, 1)];
    ban.duration = 1.0;
    
    //  self.layer.transform =
    //  transform.scale表示等比例拉伸
    //  transform按照参数比例拉伸
    ban.keyPath = @"transform";
    //执行完动画不删除动画
    ban.removedOnCompletion = NO;
    //保持最新状态
    ban.fillMode = kCAFillModeForwards;
    //如果通过keyPath设置了属性，后面的参数可以传nil
    [self.layer addAnimation:ban forKey:nil];
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
