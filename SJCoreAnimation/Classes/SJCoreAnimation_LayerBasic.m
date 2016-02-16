//
//  SJCoreAnimation_LayerBasic.m
//  SJCoreAnimation
//
//  Created by SPIREJ on 16/2/1.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJCoreAnimation_LayerBasic.h"

@interface SJCoreAnimation_LayerBasic ()
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation SJCoreAnimation_LayerBasic

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"SJCoreAnimation_LayerBasic";
    [self testLayer];
    [self testImageLayer];
    [self testImageLayerTransform];
    [self createNewLayer];
}

/**
 *  示例1：CALayer的基本操作
 */
-(void)testLayer{
    //获得图层的对象
    CALayer *layer = self.colorView.layer;
    //图层基本操作：
    //设置边框宽度
    layer.borderWidth = 5;
    //设置边框的颜色
    layer.borderColor = [UIColor redColor].CGColor;
    //设置圆角边框，取值为float类型（圆角半径）
    layer.cornerRadius = 20;
    //如果是正方形结构，可以使用它的宽度作为圆角半径
    layer.cornerRadius = self.colorView.frame.size.width*0.5;
    //设置阴影，直接设置是看不出来的，因为阴影是透明的
    layer.shadowColor = [UIColor brownColor].CGColor;
    //设置阴影偏移量（右、下）
    layer.shadowOffset = CGSizeMake(20, 20);
    //默认是透明的，需要设置它的透明度
    layer.shadowOpacity = 0.5;
}

/**
 *  示例2：操作imageViewLayer
 */
-(void)testImageLayer{
    //图层对图片的处理
    self.iconImageView.layer.borderWidth = 2;
    self.iconImageView.layer.borderColor = [UIColor purpleColor].CGColor;
    //设置圆角边框，但是边框之外多余的地方需要剪裁掉
    self.iconImageView.layer.cornerRadius = self.iconImageView.frame.size.width/2;
    //设置阴影
    self.iconImageView.layer.shadowColor = [UIColor blueColor].CGColor;
    self.iconImageView.layer.shadowOffset = CGSizeMake(10, 10);
    self.iconImageView.layer.shadowOpacity = 0.5;
    //超出边框的内容剪裁掉，注意，阴影也是会被剪裁的
    self.iconImageView.layer.masksToBounds = YES;
}

/**
 *  示例3：旋转Layer
 */
-(void)testImageLayerTransform{
    //首先回想手势时候的旋转方式
    //旋转角度（pi/4）
    self.iconImageView.transform = CGAffineTransformMakeRotation(M_PI_4);
    //平移（右、下）
    //    self.iconImageView.transform = CGAffineTransformMakeTranslation(0, 100);
    //缩放（x比例，y比例）
    //    self.iconImageView.transform = CGAffineTransformMakeScale(1.5, 0.5);
    //图层的形变属性
    //注意图层的形变属性是以 CA 开头，因为它是CoreAnimation的API
    //缩放x、y、z三个维度，取值是倍数关系即比例，因为我们iOS是平面的，所以z相关的给0就可以
    self.iconImageView.layer.transform = CATransform3DMakeScale(1.5, 0.5, 0);
    //平移,  形变操作设置会覆盖之前的transform属性
    self.iconImageView.layer.transform = CATransform3DMakeTranslation(0, 100, 0);
    //旋转
    //旋转参数，就是设置旋转的向量，就是用来确定旋转方向的变量,由CGFloat x,CGFloat y,CGFloat z 这三个坐标确定点，与原点连接的这条直线确定向量方向，即旋转方向
    //就是确定图层是绕着哪个轴（向量）进行旋转（即旋转方向是垂直于轴的），值给1，给100都行，主要是为了确定方向，x-y-z轴有个确定的范围（介于-1和+1之间）
    //如果要实现与之前 相同的效果，只要沿着z轴设置就可以
    //要强调一下，想要用好三维效果，必须要有比较强的专业知识，比如游戏开发，我们作为平面开发人员，只需要了解就好
    self.iconImageView.layer.transform = CATransform3DMakeRotation(M_PI_4, 1, 1, 1);
}

//创建一个新图层
-(void)createNewLayer
{
    //新建一个图层对象
    CALayer *layer = [CALayer layer];
    //layer方法不是单例，只是一个快速获得对象的方法而已
    layer.borderWidth = 5;
    layer.borderColor = [UIColor yellowColor].CGColor;
    //视图的layer属性是只读的，所以我们是不可以直接替换的
    //self.iconImageView.layer = layer;
    //添加图层对象到视图的方法
    [self.iconImageView.layer addSublayer:layer];
    //想要显示必须给frame
    layer.frame = self.iconImageView.bounds;
    //图层本身就可以显示在屏幕上，如果我们把图层内容完全填充了，就会覆盖原来视图上面的内容
    //所以图层经常是用来处理视图的周边效果，比如边框，阴影，圆角什么的
    layer.backgroundColor = [UIColor redColor].CGColor;
    //直接向图层上添加内容
    layer.contents = (id)[UIImage imageNamed:@"haed.jpg"].CGImage;
}


@end
