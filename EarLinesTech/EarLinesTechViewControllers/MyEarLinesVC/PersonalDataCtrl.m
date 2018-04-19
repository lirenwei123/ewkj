//
//  PersonalDataCtrl
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/12.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "PersonalDataCtrl.h"
#import "EWKJBtn.h"
#import "pwdCtrl.h"
#import "settingNameCtrl.h"
#import "selectHeadPhotoCtrl.h"

typedef NS_ENUM(NSUInteger, CONTENTYPE) {
    CONTENTYPE_IMG,//图片类型
    CONTENTYPE_TEXTONLY,//只是内容，无手势
    CONTENTYPE_TEXT//文字，有手势
};

typedef NS_ENUM(NSUInteger, PERSONCENTERTAG) {
    PERSONCENTER_headportrait = 100,//头像信息
    PERSONCENTER_name,//昵称信息
    PERSONCENTER_loginpwd,//登录密码设置
    PERSONCENTER_logout//退出登录；
};
typedef NS_ENUM(NSUInteger, LABLETAG) {
    LABLETAG_ACOUNT = 200,//
    LABLETAG_NAME,//昵称信息
    LABLETAG_PWD,//登录密码设置
    LABLETAG_MOBLIE//退出登录；
};

@interface PersonalDataCtrl ()
@property(nonatomic,strong)NSMutableArray *labs;

@end

@implementation PersonalDataCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)addUI{
    self.title = @"我的资料";
    self.view.backgroundColor = COLOR(249);
    
   
    CGFloat height = 60;
    CGFloat top = statusBarHeight +44;
    CGFloat margin = 25;
    CGFloat seprateLineH = 1;
    CGFloat seprateDistance = 10;
    CGFloat leftW = 100;
    CGFloat rightW  = 150;
    
    NSArray * leftTitles  = @[@"个人资料",@"头像",@"账号",@"昵称",@"安全设置",@"登录密码",@"手机号"];
    NSArray * flags = @[@4,@3];//每一段多少个
    NSArray *contentFlags =  @[@(CONTENTYPE_IMG),@(CONTENTYPE_TEXTONLY),@(CONTENTYPE_TEXT),@(CONTENTYPE_TEXT),@(CONTENTYPE_TEXTONLY)];
    
    int cellCount  = 0;
    int j = 0;
    _labs = @[].mutableCopy;
    NSInteger btnTagValue = PERSONCENTER_headportrait;
    
    for (NSNumber *count in flags) {
        UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, top, SW, height*count.intValue)];
        bgView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:bgView];
        for (int i = cellCount; i<cellCount+count.intValue&&i<leftTitles.count; i++) {
            if (i == cellCount) {
                //标题
                UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(margin, 0, SW-2*margin, height)];
                lab.backgroundColor = [UIColor clearColor];
                lab.font = EWKJboldFont_L;
                lab.textColor = COLOR(51);
                lab.text = leftTitles[i];
                lab.textAlignment = NSTextAlignmentLeft;
                [bgView addSubview:lab];
                
            }else{
               //子标题
                UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(margin, (i-cellCount)*height , leftW, height)];
                lab.backgroundColor = [UIColor clearColor];
                lab.font = EWKJboldFont_M;
                lab.textColor =  COLOR(51);
                lab.text = leftTitles[i];
                 lab.textAlignment = NSTextAlignmentLeft;
                [bgView addSubview:lab];
                
                //右边
                NSNumber *num = contentFlags[j];
                j++;
                CONTENTYPE type = num.intValue;
                if (type == CONTENTYPE_IMG ) {
                    EWKJBtn *btn = [[EWKJBtn alloc]initEWKJDetailBtnFrame:CGRectMake(SW-margin-height-20, (i-cellCount)*height, height+30-10, height-10) ImageName:@"Head_portrait" touchEvent:nil];
                    btn.lab.textColor = COLOR(153);
                    [bgView addSubview:btn];
                }else if(type == CONTENTYPE_TEXTONLY){
                    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(SW-2*margin-rightW, (i-cellCount)*height, rightW, height)];
                    lable.textColor =  COLOR(153);
                    lable.font  = EWKJboldFont_M;
                    lable.textAlignment = NSTextAlignmentRight;
                    [bgView addSubview:lable];
                    [_labs addObject:lable];
                }else if (type == CONTENTYPE_TEXT){
                    EWKJBtn *btn= [[EWKJBtn alloc]initEWKJDetailBtnFrame:CGRectMake(SW-margin-rightW, (i-cellCount)*height, rightW, height) Title:@"" touchEvent:nil];
                    btn.lab.font = EWKJboldFont_M;
                    btn.lab.textColor = COLOR(153);
                    [bgView addSubview:btn];
                    [_labs addObject:btn.lab];
                }
                
                if (type != CONTENTYPE_TEXTONLY) {
                    UIButton *topTouch = [[UIButton alloc]initWithFrame:CGRectMake(margin, (i-cellCount)*height , SW-2*margin, height)];
                    topTouch.backgroundColor = [UIColor clearColor];
                    [bgView addSubview:topTouch];
                    [topTouch addTarget:self action:@selector(touchEventWithTag:) forControlEvents:UIControlEventTouchUpInside];
                    topTouch.tag =btnTagValue;
                    btnTagValue++;
                    
                }
                
                
                if (i != cellCount+count.intValue-1) {
                    //划线
                    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(margin, (i+1-cellCount)*height-seprateLineH, SW-margin, seprateLineH)];
                    line.backgroundColor = COLOR(242);
                    [bgView addSubview:line];
                }
            }
        }
        cellCount +=count.intValue;
        top += height*count.intValue + seprateDistance;
        
        
    }
    
    //退出登录按钮
    UIButton *logout = [UIButton buttonWithType:UIButtonTypeCustom];
    logout.backgroundColor = [UIColor redColor];
    [logout setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logout setTitle:@"退出登录" forState:0];
    logout.frame = CGRectMake(margin, top, SW-margin*2, 50);
    logout.layer.cornerRadius  = 25;
    [logout addTarget:self action:@selector(touchEventWithTag:) forControlEvents:UIControlEventTouchUpInside];
    logout.tag = btnTagValue;
    [self.view addSubview:logout];
    
    
    
    //设置死值
    NSArray *values = @[@"1223423",@"DWCFE",@"立即设置",@"12345678910"];
    [_labs enumerateObjectsUsingBlock:^(UILabel * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < values.count) {
            obj.text = values[idx];
        }
    }];
}

-(void)touchEventWithTag:(UIButton *)sender{
    PERSONCENTERTAG tag = sender.tag;
    
    if (tag == PERSONCENTER_name) {
        settingNameCtrl *nameVC = [[settingNameCtrl alloc]init];
        [self.navigationController pushViewController:nameVC animated:NO];
    }else if (tag == PERSONCENTER_logout){
        [self.navigationController popViewControllerAnimated:NO];
    }else if (tag == PERSONCENTER_loginpwd){
        pwdCtrl *vc  =[[pwdCtrl alloc]init];
        vc.pwdType = PWDTYPE_MODIFYPWD;
        [self.navigationController pushViewController:vc animated:NO];
    }else if (tag== PERSONCENTER_headportrait){
        selectHeadPhotoCtrl *headVC = [[selectHeadPhotoCtrl alloc]init];
//        headVC.headPhoto =
        [self.navigationController pushViewController:headVC animated:NO];
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
