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
    

    
    
    _adressLab.textColor = COLOR(0x66);
    _adressLab.font = EWKJfont(11);
    
  
 
    
    
    
}

+(instancetype)cell{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
