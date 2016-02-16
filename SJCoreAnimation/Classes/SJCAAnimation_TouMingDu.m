//
//  SJCAAnimation_TouMingDu.m
//  SJCoreAnimation
//
//  Created by SPIREJ on 16/2/16.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJCAAnimation_TouMingDu.h"

@interface SJCAAnimation_TouMingDu ()
@property(nonatomic, strong)CALayer *layer;
@end

@implementation SJCAAnimation_TouMingDu

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
    [self TouMingDu];
}

//实例3：透明度属性
- (void)TouMingDu{
    //初始化的时候就定制好动画类型
    CABasicAnimation *ban = [CABasicAnimation animationWithKeyPath:@"opacity"];
    //透明度是float类型
    ban.fromValue = [NSNumber numberWithFloat:1.0];
    ban.toValue = [NSNumber numberWithFloat:0.1];
    ban.duration = 3.0;
    ban.removedOnCompletion = NO;
    ban.fillMode = kCAFillModeForwards;
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
