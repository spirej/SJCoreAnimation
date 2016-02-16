//
//  SJCAAnimation_RectRun.m
//  SJCoreAnimation
//
//  Created by SPIREJ on 16/2/16.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJCAAnimation_RectRun.h"

@interface SJCAAnimation_RectRun ()
@property(nonatomic, strong)CALayer *layer;
@property(nonatomic, strong)UIButton *pauseBtn;
@property(nonatomic, strong)UIButton *resumeBtn;
@end

@implementation SJCAAnimation_RectRun

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    //1.首先创建一个CALayer对象，因为核心动画直接作用在CALayer上
    CALayer *layer = [CALayer layer];
    [self.view.layer addSublayer:layer];
    layer.frame = CGRectMake(50, 150, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    self.layer = layer;
    
    //继续，暂停
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(50, 100, 50, 30);
    [btn1 setTitle:@"暂停" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(pauseBtnTouch) forControlEvents:UIControlEventTouchUpInside];
    self.pauseBtn = btn1;
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(150, 100, 50, 30);
    [btn2 setTitle:@"继续" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(resumeBtnTouch) forControlEvents:UIControlEventTouchUpInside];
    self.resumeBtn = btn2;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self RectRun];
}
- (void)pauseBtnTouch{
    CFTimeInterval pauseTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.layer.speed = 0.0;
    self.layer.timeOffset = pauseTime;
}
- (void)resumeBtnTouch{
    CFTimeInterval resumeTime = [self.layer timeOffset];
    self.layer.speed = 1.0;
    self.layer.timeOffset = 0.0;
    self.layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil] - resumeTime;
    self.layer.beginTime = timeSincePause;
}

//绕矩形环跑
- (void)RectRun{
    //新处理一下self.layer
    self.layer.frame = CGRectMake(15, 200, 30, 30);
    self.layer.cornerRadius = 15;
    self.layer.masksToBounds = YES;
    
    //来个帧动画
    CAKeyframeAnimation *rectRunAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //设定关键帧位置，必须含起始和终止位置
    rectRunAnimation.values = @[[NSValue valueWithCGPoint:self.layer.frame.origin],
                                [NSValue valueWithCGPoint:CGPointMake(320-15, self.layer.frame.origin.y)],
                                [NSValue valueWithCGPoint:CGPointMake(320-15, self.layer.frame.origin.y+100)],
                                [NSValue valueWithCGPoint:CGPointMake(15, self.layer.frame.origin.y+100)],
                                [NSValue valueWithCGPoint:self.layer.frame.origin]];
    //设定每个关键帧的时长，如果没有显示的设置，则默认每个帧的时间=总duration/(values.count - 1)
    rectRunAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0],
                                  [NSNumber numberWithFloat:0.6],
                                  [NSNumber numberWithFloat:0.7],
                                  [NSNumber numberWithFloat:0.8],
                                  [NSNumber numberWithFloat:1]];
    rectRunAnimation.timingFunctions = @[
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    //重复次数
    rectRunAnimation.repeatCount = 10;
    //动画结束是否执行逆动画
    rectRunAnimation.autoreverses = NO;
    //线性运动方式
    rectRunAnimation.calculationMode = kCAAnimationLinear;
    //持续时间
    rectRunAnimation.repeatDuration = 4;
    //添加动画
    [self.layer addAnimation:rectRunAnimation forKey:@"rectRunAnimation"];
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
