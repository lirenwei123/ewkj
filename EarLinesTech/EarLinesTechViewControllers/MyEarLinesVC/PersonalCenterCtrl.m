//
//  PersonalCenterCtrl.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/16.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "PersonalCenterCtrl.h"
#import "PersonalDataCtrl.m"

@interface PersonalCenterCtrl ()

@end

typedef NS_ENUM(NSUInteger, PERSONALCENTER_FUNCTION) {
    PERSONALCENTER_FUNCTION_MYORDER=100,
    PERSONALCENTER_FUNCTION_ALLORDER,
    PERSONALCENTER_FUNCTION_WAITPAY,
    PERSONALCENTER_FUNCTION_WAITSEND,
    PERSONALCENTER_FUNCTION_WAITRECEIV,
    PERSONALCENTER_FUNCTION_TUIHUAN,
    PERSONALCENTER_FUNCTION_MYSHOPPING,
    PERSONALCENTER_FUNCTION_MYERWEN,
    PERSONALCENTER_FUNCTION_MYCOLLECT,
    PERSONALCENTER_FUNCTION_ADDRESS,
    PERSONALCENTER_FUNCTION_PERSONALDATA
};

@implementation PersonalCenterCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)addUI{
    self.title = @"个人中心";
    self.view.backgroundColor = COLOR(0xde);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Personal_Center_list_2"] style:UIBarButtonItemStylePlain target:self action:@selector(optionClick)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];

    [self addTopView];
    [self addMenuView];

    
}

-(void)addTopView{
    
    CGFloat  h  = 145-44;
    CGFloat  w = 50;
    UIView *topBG = [[UIView alloc]initWithFrame:CGRectMake(0, 44+statusBarHeight, SW, h)];
    topBG.backgroundColor = [UIColor redColor];
    [self.view addSubview:topBG];
    
    UIImageView *imgv = [[UIImageView alloc]initWithFrame:CGRectMake(15, (h-w)/2, w,w)];
    imgv.image = [UIImage imageNamed:@"Head_portrait"];
    [topBG addSubview:imgv];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(15+w+15, (h-w)/2,100, w/2)];
    name.text = @"lirw";
    name.textColor = [UIColor whiteColor];
    [topBG addSubview:name];
    
    UILabel *huiyuan = [[UILabel alloc]initWithFrame:CGRectMake(15+w+15, h/2, 100, w/2)];
    huiyuan.text = @"普通会员";
    huiyuan.textColor = [UIColor whiteColor];
    [topBG addSubview:huiyuan];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(SW-50, (h-w)/2,50, w/2)];
    lable.text = @"积分";
    lable.textColor =  [UIColor whiteColor];
    [topBG addSubview:lable];
    
    UILabel *jifen =[[UILabel alloc]initWithFrame:CGRectMake(SW-50, h/2, 50, w/2)];
    jifen.textColor= [UIColor whiteColor];
    jifen.text = @"0.00";
    [topBG addSubview:jifen];
    
}

-(void)addMenuView{
    WeakSelf
    CGFloat top  = 145 +statusBarHeight;
    CGFloat h = 44;
    
    NSArray *names = @[@"我的订单",@"查看全部订单",@"待付款",@"待发货",@"待收货",@"待退货",@"我的购物车",@"我的耳纹",@"我的收藏",@"联系地址",@"个人资料"];
    NSArray *imgnames =@[@"Personal_Center_Shopping",@"Personal_l",@"Personal_Center_icon_1",@"Personal_Center_icon_2",@"Personal_Center_icon_3",@"Personal_Center_icon_4",@"Personal_Center_list_1@2x",@"Personal_Center_list_2",@"Personal_Center_list_3",@"landmark",@"Personal_Center_list_5"];
    
    UIView *bg =  [[UIView alloc]initWithFrame:CGRectMake(0, top, SW, 44+88+5*42)];
    bg.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bg];

    
    EWKJBtn *myOrder = [[EWKJBtn alloc]initWithFrame:CGRectMake(15, 0, 135, h) img:[UIImage imageNamed:imgnames[0]] title:names[0] touchEvent:^(EWKJBtn *btn) {
        [weakSelf clickWithFunction:btn.tag];
    } andbtnType:BTNTYPEEWKJ_share];
    myOrder.tag = PERSONALCENTER_FUNCTION_MYORDER;
    [bg addSubview:myOrder];
    EWKJBtn *allOrder = [[EWKJBtn alloc]initWithFrame:CGRectMake(SW-150, 0, 135, h) img:[UIImage imageNamed:imgnames[1]] title:names[1] touchEvent:^(EWKJBtn *btn) {
        [weakSelf clickWithFunction:btn.tag];
    } andbtnType:BTNTYPERL];
    myOrder.tag = PERSONALCENTER_FUNCTION_ALLORDER;
    [bg addSubview:allOrder];
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, top+h-1, SW, 1)];
    line.backgroundColor = COLOR(0xde);
    [self.view addSubview:line];
    
    
    top  = h;
    CGFloat w = SW/4;
     h = 88;
    for (int i = 2; i<6; i++) {
        EWKJBtn *wait = [[EWKJBtn alloc]initWithFrame:CGRectMake((i-2)*w, top, w, h) img:[UIImage imageNamed:imgnames[i]] title:names[i] touchEvent:^(EWKJBtn *btn) {
            [weakSelf clickWithFunction:btn.tag];
        } andbtnType:BTNTYPEUD];
        wait.tag = PERSONALCENTER_FUNCTION_MYORDER +i;
        [bg addSubview:wait];
        if (i!= 5) {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(w*(i-1)-1, top+10, 1, h-20)];
            line.backgroundColor = COLOR(0xde);
            [bg addSubview:line];
        }else{
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, top+h-1, SW, 1)];
            line.backgroundColor = COLOR(0xde);
            [bg addSubview:line];
        }
    }
    
    
    top += h;
    h = 42;
    for (int i = 6; i<names.count; i++) {
        BTNTYPE type = BTNTYPEEWKJ_personalCenter;
        if (i == 6) {
            type = BTNTYPEEWKJ_personalCenter_rightdetail;
        }
        EWKJBtn *wait = [[EWKJBtn alloc]initWithFrame:CGRectMake(15, top+(i-6)*h, SW-30, h) img:[UIImage imageNamed:imgnames[i]] title:names[i] touchEvent:^(EWKJBtn *btn) {
            [weakSelf clickWithFunction:btn.tag];
        } andbtnType:type];
        
        if (type == BTNTYPEEWKJ_personalCenter_rightdetail) {
            wait.rightDetailLab.text = @"3";
        }
        wait.tag = PERSONALCENTER_FUNCTION_MYORDER +i;
        [bg addSubview:wait];
        if (i!= names.count-1) {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(15, top+(i-5)*h-1, SW-30, 1)];
            line.backgroundColor = COLOR(0xde);
            [bg addSubview:line];
        }
    }
    
    
    

}
-(void)optionClick{
    
}

-(void)clickWithFunction:(PERSONALCENTER_FUNCTION)function{
    if (function == PERSONALCENTER_FUNCTION_PERSONALDATA) {
        PersonalDataCtrl *personData = [[PersonalDataCtrl alloc]init];
        [self.navigationController pushViewController:personData animated:NO];
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
