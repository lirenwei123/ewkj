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
    -(instancetype)initWithFrame:(CGRect)frame withType:(cellType)type;
@end
