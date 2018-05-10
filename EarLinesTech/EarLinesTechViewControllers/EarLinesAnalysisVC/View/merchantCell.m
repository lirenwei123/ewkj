//
//  merchantCell.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/5/10.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "merchantCell.h"

@implementation merchantCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    self.contentView.backgroundColor = COLOR(249);
    _describleLab.font = EWKJfont(14);
    _describleLab.textColor = COLOR(0x33);
    

    [_star1 setImage:[UIImage imageNamed:@"Five_pointed_star"] forState:UIControlStateNormal];
    [_star1 setImage:[UIImage imageNamed:@"Five_pointed_star_l"] forState:UIControlStateSelected];
    [_star2 setImage:[UIImage imageNamed:@"Five_pointed_star"] forState:UIControlStateNormal];
    [_star2 setImage:[UIImage imageNamed:@"Five_pointed_star_l"] forState:UIControlStateSelected];
    [_star3 setImage:[UIImage imageNamed:@"Five_pointed_star"] forState:UIControlStateNormal];
    [_star3 setImage:[UIImage imageNamed:@"Five_pointed_star_l"] forState:UIControlStateSelected];
    [_star4 setImage:[UIImage imageNamed:@"Five_pointed_star"] forState:UIControlStateNormal];
    [_star4 setImage:[UIImage imageNamed:@"Five_pointed_star_l"] forState:UIControlStateSelected];
    [_star5 setImage:[UIImage imageNamed:@"Five_pointed_star"] forState:UIControlStateNormal];
    [_star5 setImage:[UIImage imageNamed:@"Five_pointed_star_l"] forState:UIControlStateSelected];
    
    _zhongleiLab.textColor = COLOR(0x66);
    _zhongleiLab.font = EWKJfont(11);
    
    _adressLab.textColor = COLOR(0x66);
    _adressLab.font = EWKJfont(11);
    
    [self setStar4];
    
    
    
}

+(instancetype)cell{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setStar1{
    _star1.selected = YES;
    _star2.selected = NO;
    _star3.selected = NO;
    _star4.selected = NO;
    _star5.selected = NO;
}

-(void)setStar2{
    _star1.selected = YES;
    _star2.selected = YES;
    _star3.selected = NO;
    _star4.selected = NO;
    _star5.selected = NO;
}

-(void)setStar3{
    _star1.selected = YES;
    _star2.selected = YES;
    _star3.selected = YES;
    _star4.selected = NO;
    _star5.selected = NO;
}
-(void)setStar4{
    _star1.selected = YES;
    _star2.selected = YES;
    _star3.selected = YES;
    _star4.selected = YES;
    _star5.selected = NO;
}
-(void)setStar5{
    _star1.selected = YES;
    _star2.selected = YES;
    _star3.selected = YES;
    _star4.selected = YES;
    _star5.selected = YES;
}

@end
