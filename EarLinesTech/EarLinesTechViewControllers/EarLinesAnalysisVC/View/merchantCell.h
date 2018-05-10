//
//  merchantCell.h
//  EarLinesTech
//
//  Created by  RWLi on 2018/5/10.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface merchantCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgv;
@property (weak, nonatomic) IBOutlet UILabel *describleLab;
@property (weak, nonatomic) IBOutlet UILabel *zhongleiLab;
@property (weak, nonatomic) IBOutlet UILabel *adressLab;




@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UIButton *star2;
@property (weak, nonatomic) IBOutlet UIButton *star3;
@property (weak, nonatomic) IBOutlet UIButton *star4;
@property (weak, nonatomic) IBOutlet UIButton *star5;

+(instancetype)cell;
@end
