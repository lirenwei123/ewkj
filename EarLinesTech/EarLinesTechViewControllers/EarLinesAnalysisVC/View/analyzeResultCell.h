//
//  analyzeResultCell.h
//  EarLinesTech
//
//  Created by apple   on 2018/4/24.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, cellType) {
    cellTypeScore,
    cellTypeContent,
   
};

@interface analyzeResultCell : UITableViewCell
@property(nonatomic,strong)UIImageView *imgv;
@property(nonatomic,strong)UILabel *scoreLab;
@property(nonatomic,strong)UILabel *contentLab;
@property(nonatomic,strong)UIButton *titleBtn;


    -(instancetype)initWithFrame:(CGRect)frame withType:(cellType)type;
@end
