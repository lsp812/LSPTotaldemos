//
//  LSPARViewController.m
//  LSPTotaldemos
//
//  Created by lishaopeng on 2018/12/25.
//  Copyright © 2018年 lishaopeng. All rights reserved.
//

#import "LSPARViewController.h"
#import <ARKit/ARKit.h>

@interface LSPARViewController ()

//
@end

@implementation LSPARViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"AR体验";
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self startInterface];
}

//开始展示页面
- (void)startInterface
{
    //创建ARScnView
    //11.0之后的一些方法。if (@available(iOS 11.0, *))
//    CGSize viewSize = CGSizeMake(300, 300);
    CGSize viewSize = CGSizeMake(hxf_ScreenWidth, hxf_ScreenHeight);
   
    ARSCNView *view = [[ARSCNView alloc]initWithFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
//    view.allowsCameraControl = true;
    view.autoenablesDefaultLighting = YES;
    view.showsStatistics = YES;
    [self.view addSubview:view];
    //
    SCNScene *scene = [SCNScene scene];
    view.scene = scene;
    //
    ARSession *session = [[ARSession alloc]init];
    [session runWithConfiguration:[self createWorldTrackingConfig]];
    view.session = session;
    //
    SCNNode *childNode = [self createNode];
    [scene.rootNode addChildNode:childNode];
}

- (SCNNode *)createNode
{
    //    SCNSphere *sphere = [SCNSphere sphereWithRadius:0.5];
    //    node.geometry = sphere;
    //    node.position = SCNVector3Make(0, -2, -2);
    // 创建一个球体几何绑定到节点上去
    // 创建子节点 给子节点添加几何形状
    SCNNode *childNode = [SCNNode node];
    // 设置节点的位置(x,y,z分别对应右，上，后/正数)
    childNode.position = SCNVector3Make(0, -2, -2);
    // 设置几何形状，我们选择立体字体
    SCNText *text = [SCNText textWithString:@"那都不是事" extrusionDepth:0.03];
    // 设置字体颜色
    text.firstMaterial.diffuse.contents = [UIColor redColor];
    // 设置字体大小
    text.font = [UIFont systemFontOfSize:0.15];
    // 给几点绑定几何物体
    childNode.geometry = text;
    
    return childNode;
}

#pragma mark -- ARConfiguration 5种类型start

#pragma mark -- ARWorldTrackingConfiguration 11.0

- (ARWorldTrackingConfiguration *)createWorldTrackingConfig
{
    ARWorldTrackingConfiguration *worldConfig = [[ARWorldTrackingConfiguration alloc]init];
    return worldConfig;
}

#pragma mark -- AROrientationTrackingConfiguration 11.0

- (AROrientationTrackingConfiguration *)createOrientationTrackingConfig
{
    AROrientationTrackingConfiguration *worldConfig = [[AROrientationTrackingConfiguration alloc]init];
    return worldConfig;
}

#pragma mark -- ARFaceTrackingConfiguration 11.0

- (ARFaceTrackingConfiguration *)createFaceTrackingConfig
{
    ARFaceTrackingConfiguration *worldConfig = [[ARFaceTrackingConfiguration alloc]init];
    return worldConfig;
}

#pragma mark -- ARImageTrackingConfiguration 12.0

- (ARImageTrackingConfiguration *)createImageTrackingConfig
{
    ARImageTrackingConfiguration *worldConfig = [[ARImageTrackingConfiguration alloc]init];
    return worldConfig;
}

#pragma mark -- ARObjectScanningConfiguration 12.0

- (ARObjectScanningConfiguration *)createObjectScanningTrackingConfig
{
    ARObjectScanningConfiguration *worldConfig = [[ARObjectScanningConfiguration alloc]init];
    return worldConfig;
}

#pragma mark -- ARConfiguration 5种类型end














#pragma mark --  无用的测试代码
/*无用代码做测试用的
- (void)createInterface
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIView *littleView = [[UIView alloc]init];
    [littleView setFrame:CGRectMake(0, 64, size.width, size.height-64)];
    littleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:littleView];
    //
}

- (void)testy
{
    SCNView *view = [[SCNView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    view.backgroundColor = [UIColor blackColor];
    view.allowsCameraControl = true;
    [self.view addSubview:view];
    view.center = self.view.center;
    //
    SCNScene *scene = [SCNScene scene];
    view.scene = scene;
    //
    SCNNode *node = [SCNNode node];
    [scene.rootNode addChildNode:node];
    SCNSphere *sphere = [SCNSphere sphereWithRadius:0.5];
    node.geometry = sphere;
    //
    // 创建一个球体几何绑定到节点上去
    // 创建子节点 给子节点添加几何形状
    SCNNode *childNode = [SCNNode node];
    // 设置节点的位置
    childNode.position = SCNVector3Make(-0.5, 0, 1);
    // 设置几何形状，我们选择立体字体
    SCNText *text = [SCNText textWithString:@"让学习成为一种习惯" extrusionDepth:0.03];
    // 设置字体颜色
    text.firstMaterial.diffuse.contents = [UIColor redColor];
    // 设置字体大小
    text.font = [UIFont systemFontOfSize:0.15];
    // 给几点绑定几何物体
    childNode.geometry = text;
    [node addChildNode:childNode];
    //
}

//眼球追踪
- (void)eyeyTracking
{
    UIImageView *imageV = [[UIImageView alloc]init];
    imageV.image = [UIImage imageNamed:@""];
    imageV.backgroundColor = [UIColor greenColor];
    [imageV setFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:imageV];
    //    UIGestureRecognizer
    //    UICollisionBehaviorModeEverything
    //    UIHoverGestureRecognizer *hover = [[UIHoverGestureRecognizer alloc]init];
    
    //    UITapGestureRecognizer
}
*/

@end
