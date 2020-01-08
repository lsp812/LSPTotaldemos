//
//  HXFTransverseTableViewCell.m
//  HeXinFound
//
//  Created by lishaopeng on 2018/7/5.
//  Copyright © 2018年 Dusk. All rights reserved.
//

#import "HXFTransverseTableViewCell.h"


@interface HXFTransverseTableViewCell ()

@property (nonatomic, weak) UIImageView *imageV;

@property (nonatomic, assign) BOOL haveEffect;

@end

@implementation HXFTransverseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.transform = CGAffineTransformMakeRotation(M_PI/2);
        [self setBackgroundColor:[UIColor clearColor]];
        self.haveEffect = NO;
        [self createView];
    }
    return self;
}

- (void)createView
{
    UIImageView *imageV = [[UIImageView alloc]init];
    self.imageV = imageV;
    [self addSubview:imageV];
}

- (void)layoutSubviews
{
    if(self.haveEffect)
    {
        [UIView animateWithDuration:0.15 animations:^{
            [self.imageV setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        }];
    }
    else
    {
        [UIView animateWithDuration:0.15 animations:^{
            [self.imageV setFrame:CGRectMake(15, 15, self.frame.size.width-2*15, self.frame.size.height-2*15)];
        }];
    }
}

- (void)fillCellImage:(UIImage *)image
{
    self.imageV.image = image;
}

- (void)clearCell
{
    self.imageV.image = [UIImage imageNamed:@""];
    [self hideEffect];
}

- (void)hideEffect
{
    self.haveEffect = NO;
    [self layoutSubviews];
}

- (void)showEffect
{
    self.haveEffect = YES;
    [self layoutSubviews];
}

@end
