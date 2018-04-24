//
//  analyzeResultCell.m
//  EarLinesTech
//
//  Created by apple   on 2018/4/24.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "analyzeResultCell.h"

@interface analyzeResultCell()
   
    
@end


@implementation analyzeResultCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

    -(instancetype)initWithFrame:(CGRect)frame withType:(cellType)type{
        if(self == [ super initWithFrame:frame]){
            switch (type) {
                case cellTypeScore:
                [self scoreCell];
                break;
                case cellTypeContent:
                [self contentCell];
                break;
                default:
                break;
            }
        }
        return self;
    }
    
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

    
    -(void)scoreCell{
        UIImageView *imgv = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, 90, 90)];
        _imgv = imgv;
        [self.contentView addSubview:_imgv];
        
        UILabel *score = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_imgv.frame)+10, 20, self.contentView.frame.size.width-CGRectGetMaxX(_imgv.frame)-10-20, 20)];
        [self.contentView addSubview:score];
        score.textAlignment = NSTextAlignmentLeft;
        _scoreLab = score;
        
        UILabel *content = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_imgv.frame)+10, CGRectGetMaxY(_scoreLab.frame)+15, self.contentView.frame.size.width-CGRectGetMaxX(_imgv.frame)-10-20, self.contentView.frame.size.height -CGRectGetMaxY(_scoreLab.frame)-15-5 )];
        [self.contentView addSubview:content];
        content.textAlignment = NSTextAlignmentLeft;
        content.font = EWKJfont(12);
        content.textColor = COLOR(0x33);
        _contentLab = content;
        
    }
    
      -(void)contentCell{
          UIButton * titleB = [[UIButton alloc]initWithFrame:CGRectMake((self.contentView.frame.size.width-200)/2, 20, 200, 30)];
          titleB.clipsToBounds = YES;
          titleB.layer.cornerRadius = 3;
          titleB.userInteractionEnabled = NO;
          titleB.titleLabel.font = EWKJfont(15);
          titleB.titleLabel.textColor = [UIColor whiteColor];
          [self.contentView addSubview:titleB];
          _titleBtn = titleB;
          
          UILabel * content = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_titleBtn.frame)+20, self.contentView.frame.size.width - 40, self.contentView.frame.size.height-CGRectGetMaxY(_titleBtn.frame)-20-10)];
          content.font = EWKJfont(12);
          content.textColor = COLOR(0x33);
          _contentLab = content;
          [self.contentView addSubview:_contentLab];
        
          
      }
    
@end
