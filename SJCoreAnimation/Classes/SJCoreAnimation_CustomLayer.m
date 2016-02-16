//
//  SJCoreAnimation_CustomLayer.m
//  SJCoreAnimation
//
//  Created by SPIREJ on 16/2/4.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJCoreAnimation_CustomLayer.h"
#import "CustomLayer.h"

@interface SJCoreAnimation_CustomLayer ()
@property(nonatomic, strong)CALayer *layer;
@end

@implementation SJCoreAnimation_CustomLayer

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"自定义图层";
    
    CustomLayer *cLayer = [CustomLayer layer];
    cLayer.backgroundColor = [UIColor brownColor].CGColor;
    [self.view.layer addSublayer:cLayer];
    self.layer = cLayer;
    
    self.layer.frame = self.view.bounds;
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    
    //需要显示自定义layer调用setNeedsDisplay方法，才会调用drawInContext: 方法
    [cLayer setNeedsDisplay];
    
    //设置图层的代理，当我们不想重写drawInContext，或者不想自定义CALayer的时候，可以设置它的代理方法来实现相应的功能
    cLayer.delegate = self;
}

//设置CALayer的代理方法
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGContextAddRect(ctx, CGRectMake(100, 300, 100, 100));
    CGContextSetStrokeColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextFillPath(ctx);
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
