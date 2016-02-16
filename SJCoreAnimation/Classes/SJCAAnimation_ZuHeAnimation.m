//
//  SJCAAnimation_ZuHeAnimation.m
//  SJCoreAnimation
//
//  Created by SPIREJ on 16/2/16.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJCAAnimation_ZuHeAnimation.h"

@interface SJCAAnimation_ZuHeAnimation ()
@property(nonatomic, strong)CALayer *layer;
@end

@implementation SJCAAnimation_ZuHeAnimation

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
    [self ZuHeAnimation];
}
//实例6：组合动画CAAnimationGroup
-(void)ZuHeAnimation{
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    //缩放
    CABasicAnimation *banScale = [CABasicAnimation animation];
    banScale.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1.5, 1)];
    banScale.duration = 3.0;
    banScale.keyPath = @"transform";
    banScale.removedOnCompletion = NO;
    banScale.fillMode = kCAFillModeForwards;
    //透明
    CABasicAnimation *banOpacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    banOpacity.fromValue = [NSNumber numberWithFloat:1.0];
    banOpacity.toValue = [NSNumber numberWithFloat:0.1];
    banOpacity.duration = 3.0;
    banOpacity.removedOnCompletion = NO;
    banOpacity.fillMode = kCAFillModeForwards;
    //旋转
    CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    transformAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    transformAnim.cumulative = YES;
    transformAnim.repeatCount = 2;
    transformAnim.duration = 2.0;
    animGroup.animations = [NSArray arrayWithObjects:self.pathAnimation, banScale, banOpacity, transformAnim, nil];
    animGroup.duration = 5.0;
    [self.layer addAnimation:animGroup forKey:nil];
}
//CAKeyframeAnimation
//CABasicAnimation算是CAKeyFrameAnimation的特殊情况，即不考虑中间变换过程，只考虑起始点与目标点就可以了。而CAKeyFrameAnimation则更复杂一些，允许我们在起点与终点间自定义更多内容来达到我们的实际应用需求,KeyFrame的意思是关键帧，所谓“关键”就是改变物体运动趋势的帧，在该点处物体将发生运动状态，比如矩形的四个角，抛物线的顶点等

-(CAAnimation*)pathAnimation{
    /**
     CAKeyframeAnimation
     
     在画线的时候，方法的内部默认创建一个path。它把路径都放到了path里面去。
     1.创建路径  CGMutablePathRef 调用该方法相当于创建了一个路径，这个路径用来保存绘图信息。
     2.把绘图信息添加到路径里边。
     以前的方法是点的位置添加到ctx（图形上下文信息）中，ctx 默认会在内部创建一个path用来保存绘图信息。
     在图形上下文中有一块存储空间专门用来存储绘图信息，其实这块空间就是CGMutablePathRef。
     3.把路径添加到上下文中。
     */
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path,NULL,50.0,120.0);
    CGPathAddLineToPoint(path, NULL, 300, 488);
    CGPathAddCurveToPoint(path,NULL,50.0,275.0,150.0,275.0,150.0,120.0);
    CGPathAddCurveToPoint(path,NULL,150.0,275.0,250.0,275.0,250.0,120.0);
    CGPathAddCurveToPoint(path,NULL,250.0,275.0,350.0,275.0,350.0,120.0);
    CGPathAddCurveToPoint(path,NULL,350.0,275.0,450.0,275.0,450.0,120.0);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animation setPath:path];
    [animation setDuration:3.0];
    
    CFRelease(path);
    //ARC的诞生大大简化了我们针对内存管理的开发工作，但是只支持管理 Objective-C 对象, 不支持 Core Foundation 对象。Core Foundation 对象必须使用CFRetain和CFRelease来进行内存管理
    //http://blog.csdn.net/yiyaaixuexi/article/details/8553659
    
    return animation;
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
