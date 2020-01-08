//
//  LSPButtonVC.m
//  LSPTotaldemos
//
//  Created by lishaopeng on 2019/8/12.
//  Copyright © 2019 lishaopeng. All rights reserved.
//

#import "LSPButtonVC.h"
#import "UIButton+Extension.h"

@interface LSPButtonVC ()

@end

@implementation LSPButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createButton];
}

- (void)createButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(100, 200, 200, 50)];
    [button setTitle:@"防止重复点击" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)clickAction:(UIButton *)button
{
    NSLog(@"click");
}

@end
