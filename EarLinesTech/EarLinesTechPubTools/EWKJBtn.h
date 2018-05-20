//
//  EWKJBtn
//  initVC
//
//  Created by QianLong on 2017/9/5.
//  Copyright © 2017年 lrw. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EWKJBtn;
typedef void(^T)(EWKJBtn *btn);
typedef NS_ENUM(NSUInteger, BTNTYPE) {
    BTNTYPEEWKJ,
    BTNTYPEEWKJ_share,
    BTNTYPEEWKJ_personalCenter,
    BTNTYPEEWKJ_personalCenter_rightdetail,
    BTNTYPE_mallClass,
    BTNTYPERL,
    BTNTYPELR,
    BTNTYPEUD,
    BTNTYPETEXT,
    BTNTYPEIMG,
    BTNTYPEOTHER//这是为二级菜单btn样式
    
};

typedef NS_ENUM(NSUInteger, BTNCONTOLSTATE) {
    BTNCONTOLNORMAL,
    BTNCONTOLDISABLE,
    BTNCONTOLCLICKED,
};


@interface EWKJBtn : UIView
//
@property(nonatomic,strong) T touchEvent;

//
@property(nonatomic,strong) UIImageView *imgv;
//
@property(nonatomic,strong) UILabel *lab;
@property(nonatomic,strong) UILabel *rightDetailLab;
//
@property(nonatomic,strong) UILabel *otherLab;

-(instancetype)initWithFrame:(CGRect)frame img:(UIImage*)img title:(NSString*)title touchEvent:(T)event andbtnType:(BTNTYPE)type;

-(instancetype)initWithFrame:(CGRect)frame normalImg:(UIImage *)img1 clickedImage:(UIImage *)clickImg disableImg:(UIImage *)img2 title:(NSString *)title touchEvent:(T)event andbtnType:(BTNTYPE)type;

-(instancetype)initWithFrame:(CGRect)frame  titleLeft:(NSString *)titleL titleRight:(NSString *)titleR touchEvent:(T)event;
//耳纹科技定制
-(instancetype)initEWKJDetailBtnFrame:(CGRect)frame Title:(NSString*)title touchEvent:(T)event;
-(instancetype)initEWKJDetailBtnFrame:(CGRect)frame ImageName:(NSString*)imgName touchEvent:(T)event;

@property(nonatomic,assign)BTNCONTOLSTATE btnState;



@end
