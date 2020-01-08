//
//  LSPTestVC.m
//  LSPTotaldemos
//
//  Created by lishaopeng on 2019/1/2.
//  Copyright © 2019年 lishaopeng. All rights reserved.
//

#import "LSPTestVC.h"
@interface LSPTestVC ()

@end

@implementation LSPTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createButton];
}

- (void)createButton
{
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setFrame:CGRectMake(100, 200, 120, 50)];
//    [button setTitle:@"title" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
////    [button setBackgroundColor:[UIColor greenColor]];
//    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
////    button.showsTouchWhenHighlighted = YES;
////    button.reversesTitleShadowWhenHighlighted = YES;
//    [self.view addSubview:button];
    
    //
    UIImageView *imageV = [[UIImageView alloc]init];
    [imageV setFrame:CGRectMake(0, 0, 60, 60)];
    imageV.image = [UIImage imageNamed:@"icon_date_loan"];
//    imageV.layer.maskedCorners = kCALayerMinXMinYCorner;
//    imageV.layer.cornerRadius = 20;
//    imageV.alpha = 0;
    imageV.layer.masksToBounds = YES;
    //
    UIImageView *yuan = [[UIImageView alloc]init];
    [yuan setFrame:CGRectMake(100,300, 60, 60)];
    yuan.backgroundColor = [UIColor greenColor];
//    yuan.layer.cornerRadius = 20;
    [self.view addSubview:yuan];
    //
    yuan.layer.mask = imageV.layer;
//
    
    
    
    
    
    
    
    
    
    
//    UIImageView *imgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 200, 200)];
//    imgV2.layer.masksToBounds = YES;
//    imgV2.image = [UIImage imageNamed:@"icon_date_loan"];
//    //
//    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 200, 200)];
//    imgV.backgroundColor = [UIColor redColor];
//    [self.view addSubview:imgV];
//    //
//    imgV.layer.mask = imgV2.layer;
}

- (void)clickAction:(UIButton *)button
{
    NSLog(@"click");
    
}

- (void)addTarget
{
//    NSOperation
//    NSOperationQueue *queue = [NSOperationQueue ];
}

//- (void)createView
//{
//    UITextField *textF = [[UITextField alloc]init];
//    textF.backgroundColor = [UIColor clearColor];
//    textF.textColor = HEF_COLOR_HEX(@"32333c");
//    textF.font = [UIFont systemFontOfSize:12.0];
//    textF.textAlignment = NSTextAlignmentCenter;
//    textF.text = @"sfsdgdfgggfdsasdsssfsdfsfgsgkjlbgrbgibgauibueiwuewbrewfubef";
//    [textF setFrame:CGRectMake(100, 400, 200, 20)];
////    textF.editing = NO;
////    textF.enabled = NO;
////    label.editing
////    [label setEditing];
//    [self.view addSubview:textF];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)createLabel
{
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = HEF_COLOR_HEX(@"32333c");
    label.font = [UIFont systemFontOfSize:12.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"sfsdgdfgggfdsasdsssfsdfsfgsgkjlbgrbgibgauibueiwuewbrewfubef";
    [label setFrame:CGRectMake(100, 400, 200, 20)];
    [self.view addSubview:label];
}

@end
