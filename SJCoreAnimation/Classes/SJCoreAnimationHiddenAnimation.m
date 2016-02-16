//
//  SJCoreAnimationHiddenAnimation.m
//  SJCoreAnimation
//
//  Created by SPIREJ on 16/2/3.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJCoreAnimationHiddenAnimation.h"

@interface SJCoreAnimationHiddenAnimation ()
{
    BOOL _isChanged;
}
@property(nonatomic, strong)CALayer *layer;
@end
/**
 1.根层
 所有的视图默认情况下都有一个layer层对象，这个层就是根层
 通过addSubLayer添加的层都是子层
 2.隐式动画都是相对于子层来说的
 当修改了某个子层的属性的时候，会默认产生动画效果，就是所谓的隐式动画
 3.修改哪些属性会产生隐式动画效果
 1）Frame 缩放动画
 2）backgroundColor会产生颜色渐变动画
 4.关闭隐式动画
 CATransaction是layer内部设置饮食动画的开关
 */
@implementation SJCoreAnimationHiddenAnimation

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"隐式动画";
    _layer = [CALayer layer];
    [self.view.layer addSublayer:_layer];
    _layer.frame = CGRectMake(100, 100, 100, 100);
    _layer.backgroundColor = [UIColor brownColor].CGColor;
    _isChanged = NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _isChanged = !_isChanged;
    if (_isChanged) {
        //关闭隐式动画效果
//        [CATransaction setDisableActions:YES];
        //1.改变子图层bounds
        _layer.frame = self.view.bounds;
        //2.改变子图层背景色
        self.layer.backgroundColor = [UIColor redColor].CGColor;
    }else{
        _layer.frame = CGRectMake(100, 100, 100, 100);
        self.layer.backgroundColor = [UIColor brownColor].CGColor;
    }
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
