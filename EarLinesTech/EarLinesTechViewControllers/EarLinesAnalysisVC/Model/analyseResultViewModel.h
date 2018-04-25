//
//  analyseResultViewModel.h
//  EarLinesTech
//
//  Created by apple   on 2018/4/25.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface analyseResultViewModel : NSObject

@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *content;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,assign)CGFloat contentHeight;

-(instancetype)initWithScore;
-(instancetype)initWithContent;
@end
