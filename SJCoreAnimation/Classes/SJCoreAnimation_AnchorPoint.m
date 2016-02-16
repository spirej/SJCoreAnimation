//
//  SJCoreAnimation_AnchorPoint.m
//  SJCoreAnimation
//
//  Created by SPIREJ on 16/2/2.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJCoreAnimation_AnchorPoint.h"

@interface SJCoreAnimation_AnchorPoint ()

@end

@implementation SJCoreAnimation_AnchorPoint

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"锚点";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self testPointionAndAnchorPoint];
}

- (void)testPointionAndAnchorPoint{
    UIView *clearView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    clearView.backgroundColor = [UIColor redColor];
    [self.view addSubview:clearView];
    
    CALayer *layer = [CALayer layer];
    [clearView.layer addSublayer:layer];
    //设置lauer的属性
    layer.backgroundColor = [UIColor brownColor].CGColor;
    layer.frame = clearView.bounds;
    
    layer.frame = CGRectMake(100, 400, 50, 50);
    /**
     CALayer有2个非常重要的属性：position和anchorPoint
     @property CGPoint position;
     用来设置CALayer在父层中的位置
     以父层的左上角为原点(0, 0)
      
     @property CGPoint anchorPoint;
     称为“定位点”、“锚点”
     决定着CALayer身上的哪个点会在position属性所指的位置
     以自己的左上角为原点(0, 0)
     它的x、y取值范围都是0~1，默认值为（0.5, 0.5）
     */
    //将layer的锚点定位在父视图的0，0点上
    layer.position = CGPointMake(0, 0);
    //point会影响frame
    
    //anchorPoint比较特殊，它的x,y取值范围是0-1（默认是0.5，0.5）其实就是百分比，anchorPoint其实就是本图层上的哪个点来代表position
    layer.anchorPoint = CGPointMake(0, 0);
    layer.anchorPoint = CGPointMake(0, 0.5);
    layer.anchorPoint = CGPointMake(1, 1);
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
