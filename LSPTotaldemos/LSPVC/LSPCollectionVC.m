//
//  LSPCollectionVC.m
//  LSPTotaldemos
//
//  Created by lishaopeng on 2018/12/25.
//  Copyright © 2018年 lishaopeng. All rights reserved.
//

#import "LSPCollectionVC.h"
#import "LSPCollectionViewCell.h"

@interface LSPCollectionVC ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation LSPCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self createInterface];
}

- (void)createInterface
{
    CGSize size = [UIScreen mainScreen].bounds.size;
//    CGRect frame = CGRectMake(0, Height_NavBar, size.width, size.height-Height_NavBar);
    CGRect frame = CGRectMake(0, Height_NavBar, size.width, 105);
    UICollectionView *view = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:[self createLayout]];
    view.backgroundColor = [UIColor yellowColor];
    [view registerClass:[LSPCollectionViewCell class] forCellWithReuseIdentifier:@"LSPCollectionViewCell"];
    view.dataSource = self;
    view.delegate = self;
    [self.view addSubview:view];
    //
}

- (UICollectionViewFlowLayout *)createLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    layout.itemSize = CGSizeMake(hxf_ScreenWidth/2, 200);
    layout.itemSize = CGSizeMake(100, 100);
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 3;//最小的水平间距
    layout.minimumLineSpacing = 3;//最小的行间距
    //
    return layout;
}


#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSPCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LSPCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

#pragma mark -- UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = 100;
    if(indexPath.row%2==0)
    {
        width = 150;
    }
    CGSize size = CGSizeMake(width, 100);
    return size;
}

#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSPCollectionViewCell * cell = (LSPCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    //
//    [collectionView reloadItemsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section], nil]];
}

@end
