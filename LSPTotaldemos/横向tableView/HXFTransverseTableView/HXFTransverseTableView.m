//
//  HXFTransverseTableView.m
//  HeXinFound
//
//  Created by lishaopeng on 2018/7/5.
//  Copyright © 2018年 Dusk. All rights reserved.
//

#import "HXFTransverseTableView.h"
#import "HXFTransverseTableViewCell.h"

@interface HXFTransverseTableView ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic, weak) UITableView *tableV;

@property (nonatomic, copy) NSArray *imageArray;

@end

@implementation HXFTransverseTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray
{
    self = [super init];
    if(self)
    {
        [self setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.imageArray = [NSArray arrayWithArray:imageArray];
        [self createTableView];
    }
    return self;
}

- (void)createTableView
{
    UITableView *tableView = [[UITableView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.transform = CGAffineTransformMakeRotation(-M_PI/2);
    tableView.showsVerticalScrollIndicator = NO;
    tableView.bounces = NO;
    tableView.backgroundColor = [UIColor clearColor];
    [tableView setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:tableView];
    self.tableV = tableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return [UIScreen mainScreen].bounds.size.width/3.0;
    return tableView.frame.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.imageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"HXFTransverseTableViewCell";
    HXFTransverseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
    {
        cell = [[HXFTransverseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell clearCell];
    NSString *imageName = self.imageArray[indexPath.row];
    [cell fillCellImage:[UIImage imageNamed:imageName]];
    if(indexPath.row==1)
    {
        [cell showEffect];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(transverseTableView:didSelectRowAtIndexPath:)])
    {
        [self.delegate transverseTableView:self didSelectRowAtIndexPath:indexPath];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat height = scrollView.frame.size.height;
    NSInteger row = scrollView.contentOffset.y/height+2;
    [self haveEffectRow:row];
}

- (void)haveEffectRow:(NSInteger)row
{
    NSIndexPath *indexprefix = [NSIndexPath indexPathForRow:(row-2) inSection:0];
    HXFTransverseTableViewCell *prefixCell = [self.tableV cellForRowAtIndexPath:indexprefix];
    [prefixCell hideEffect];
    
    NSIndexPath *indexMid = [NSIndexPath indexPathForRow:(row-1) inSection:0];
    HXFTransverseTableViewCell *midCell = [self.tableV cellForRowAtIndexPath:indexMid];
    [midCell showEffect];
    
    NSIndexPath *indexAfter = [NSIndexPath indexPathForRow:row inSection:0];
    HXFTransverseTableViewCell *afterCell = [self.tableV cellForRowAtIndexPath:indexAfter];
    [afterCell hideEffect];
    //
    NSIndexPath *showIndex = [NSIndexPath indexPathForRow:row inSection:0];
    if(self.delegate && [self.delegate respondsToSelector:@selector(showEffectImageIndex:)])
    {
        [self.delegate showEffectImageIndex:showIndex];
    }
}

@end
