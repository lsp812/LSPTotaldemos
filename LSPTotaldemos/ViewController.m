//
//  ViewController.m
//  LSPTotaldemos
//
//  Created by lishaopeng on 2018/12/21.
//  Copyright © 2018年 lishaopeng. All rights reserved.
//

#import "ViewController.h"
#import "LSPCollectionVC.h"
#import "LSPARViewController.h"
#import "LSPVC/LSPWebViewVC.h"
#import "LSPVC/LSPWKWebViewVC.h"
#import "TestViewConteroller.h"
#import "LSPTestVC.h"
#import "LSPThreadVC.h"
#import "LSPPermissionsVC.h"
#import "LSPButtonVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation ViewController

#define CustomTest @"Test"
#define CustomCollectionView @"UICollectionView"
#define CustomARViewController @"LSPARViewController"
#define CustomUIwebView @"LSPWebViewVC"
#define CustomWKWebView @"LSPWKWebViewVC"
#define CustomTableView @"横向tableView"
#define CustomThread @"多线程知识"
#define CustomPermissions @"常用权限设置"
#define CustomButton @"按钮防重复点击"

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"自研";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self createInterface];
}

- (void)createDataSource
{
    self.dataArr = [NSMutableArray arrayWithObjects:CustomTest,CustomCollectionView,CustomARViewController,CustomUIwebView,CustomWKWebView,CustomTableView,CustomThread,CustomPermissions,CustomButton, nil];
}

- (void)createInterface
{
    [self createDataSource];
    //
    CGSize size = [UIScreen mainScreen].bounds.size;
    UITableView *tableView = [[UITableView alloc]init];
    [tableView setFrame:CGRectMake(0, Height_NavBar, size.width, size.height-Height_NavBar)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark --tableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = self.dataArr[indexPath.row];
    static NSString *cellId = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self jumpNextVCWithIndex:indexPath.row];
}

- (void)jumpNextVCWithIndex:(NSInteger)index
{
    NSString *title = self.dataArr[index];
    if([title isEqualToString:CustomTest])
    {
        LSPTestVC *vc = [[LSPTestVC alloc]init];
        UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:navc animated:YES completion:nil];
    }
    else if([title isEqualToString:CustomCollectionView])
    {
        LSPCollectionVC *vc = [[LSPCollectionVC alloc]init];
        UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:navc animated:YES completion:nil];
    }
    else if([title isEqualToString:CustomARViewController])
    {
        LSPARViewController *vc = [[LSPARViewController alloc]init];
        UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:navc animated:YES completion:nil];
    }
    else if([title isEqualToString:CustomUIwebView])
    {
        LSPWebViewVC *vc = [[LSPWebViewVC alloc]init];
        UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:navc animated:YES completion:nil];
    }
    else if([title isEqualToString:CustomWKWebView])
    {
        LSPWKWebViewVC *vc = [[LSPWKWebViewVC alloc]init];
        UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:navc animated:YES completion:nil];
    }
    else if([title isEqualToString:CustomTableView])
    {
        TestViewConteroller *vc = [[TestViewConteroller alloc]init];
        UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:navc animated:YES completion:nil];
    }
    else if([title isEqualToString:CustomThread])
    {
        LSPThreadVC *vc = [[LSPThreadVC alloc]init];
        UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:navc animated:YES completion:nil];
    }
    else if([title isEqualToString:CustomPermissions])
    {
        LSPPermissionsVC *vc = [[LSPPermissionsVC alloc]init];
        UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:navc animated:YES completion:nil];
    }
    else if([title isEqualToString:CustomButton])
    {
        LSPButtonVC *vc = [[LSPButtonVC alloc]init];
        UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:navc animated:YES completion:nil];
    }
    else
    {
        
        //nothing
        
    }
    
}

@end
