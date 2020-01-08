//
//  LSPPermissionsVC.m
//  LSPTotaldemos
//
//  Created by lishaopeng on 2019/7/3.
//  Copyright © 2019 lishaopeng. All rights reserved.
//

#import "LSPPermissionsVC.h"

@interface LSPPermissionsVC ()

@end

@implementation LSPPermissionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
//    [self jumpAction];
    // Do any additional setup after loading the view.
}

- (void)createView
{
    NSMutableArray *mutArray = [NSMutableArray array];
    [mutArray addObject:@"相机权限"];
    [mutArray addObject:@"相册权限"];
    //
    for (NSInteger j=0; j<mutArray.count; j++)
    {
        CGFloat originY = 100+j*50;
        CGFloat height = 44;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(120, originY, 150, height)];
        [btn setTitle:[mutArray objectAtIndex:j] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [self.view addSubview:btn];
    }
    //
}

- (void)jumpAction
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    //
}



@end
