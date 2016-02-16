//
//  CustomLayer.m
//  SJCoreAnimation
//
//  Created by SPIREJ on 16/2/4.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "CustomLayer.h"

@implementation CustomLayer

/*
 想要像UIView上绘图，需要重写drawRect: 方法
 想要向CALayer上绘图，需要重写drawInContext: 方法
 如果设置了代理，那这个方法可以在代理方法里面实现，如果写了这里的方法会优先调用这里的
 */

//- (void)drawInContext:(CGContextRef)ctx{
//    CGContextAddRect(ctx, CGRectMake(100, 200, 100, 100));
//    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
//    CGContextFillPath(ctx);
//}
@end
