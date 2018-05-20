//
//  PersonalCenterCtrl.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/16.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "PersonalCenterCtrl.h"
#import "PersonalDataCtrl.m"
#import "MyOrderCtrl.h"
#import "MyShoppingCartCtrl.h"
#import "MyCollectionCtrl.h"
#import "MyOrderAddressCtrl.h"
#import "MyEarLinesTestedCtrl.h"



@interface PersonalCenterCtrl ()
@property(nonatomic,strong)NSArray * classSrings;
@property(nonatomic,strong)UIImageView *head;
@property(nonatomic,strong)UILabel *nickLab;
@end

typedef NS_ENUM(NSUInteger, PERSONALCENTER_FUNCTION) {
    PERSONALCENTER_FUNCTION_MYORDER=100,
    PERSONALCENTER_FUNCTION_WAITPAY,
    PERSONALCENTER_FUNCTION_WAITSEND,
    PERSONALCENTER_FUNCTION_WAITRECEIV,
    PERSONALCENTER_FUNCTION_TUIHUAN,
    PERSONALCENTER_FUNCTION_MYSHOPPINGCART,
    PERSONALCENTER_FUNCTION_MYERWEN,
    PERSONALCENTER_FUNCTION_MYCOLLECT,
    PERSONALCENTER_FUNCTION_ADDRESS,
    PERSONALCENTER_FUNCTION_PERSONALDATA
};

@implementation PersonalCenterCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

-(void)viewWillAppear:(BOOL)animated{
    if ([USERBaseClass user].imageUrl.length) {
        NSURL *imgurl = [NSURL URLWithString:[USERBaseClass user].imageUrl];
        UIImage *head1 = [UIImage imageWithData:[NSData dataWithContentsOfURL:imgurl]];
        if (head1) {
            _head.image = head1;
        }
    }
    if ([USERBaseClass user].nickName.length){
        _nickLab.text = [USERBaseClass user].nickName;
    }
    
}

-(void)addUI{
    self.navigationTitle.text = @"个人中心";
    self.view.backgroundColor = COLOR(0xde);


    [self addTopView];
    [self addMenuView];
  
    
}

-(void)addTopView{
    
    CGFloat  h  = 145-44;
    CGFloat  w = 50;
    UIImageView *topBG = [[UIImageView alloc]initWithFrame:CGRectMake(0, navigationBottom, SW, h)];
    topBG.image = [UIImage imageNamed:@"Head_portrait_bg"];
    topBG.userInteractionEnabled = YES;
    [self.view addSubview:topBG];
    
    UIImageView *imgv = [[UIImageView alloc]initWithFrame:CGRectMake(15, (h-w)/2, w,w)];
    imgv.image = [UIImage imageNamed:@"Head_portrait"];
    _head = imgv;
    [topBG addSubview:imgv];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(15+w+15, (h-w)/2,200, w/2)];
//    name.text = @"lirw";
    if ([USERBaseClass user].nickName.length==0) {
        name.text =  [USERBaseClass user].account;
    }
    name.textColor = [UIColor whiteColor];
    _nickLab = name;
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
    CGFloat top  = 101 +navigationBottom;
    CGFloat h = 44;
    
    NSArray *names = @[@"我的订单",@"查看全部订单",@"待付款",@"待发货",@"待收货",@"待退货",@"我的购物车",@"我的耳纹",@"我的收藏",@"联系地址",@"个人资料"];
    NSArray *imgnames =@[@"Personal_Center_Shopping",@"Personal_l",@"Personal_Center_icon_1",@"Personal_Center_icon_2",@"Personal_Center_icon_3",@"Personal_Center_icon_4",@"Personal_Center_list_1@2x",@"Personal_Center_list_2",@"Personal_Center_list_3",@"landmark",@"Personal_Center_list_5"];
      _classSrings = @[@"MyOrderCtrl",@"MyOrderCtrl",@"MyOrderCtrl",@"MyOrderCtrl",@"MyOrderCtrl",@"MyShoppingCartCtrl",@"MyEarLinesTestedCtrl",@"MyCollectionCtrl",@"MyOrderAddressCtrl",@"PersonalDataCtrl"];
    
    UIView *bg =  [[UIView alloc]initWithFrame:CGRectMake(0, top, SW, 44+88+5*42)];
    bg.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bg];

    NSInteger functionTag = PERSONALCENTER_FUNCTION_MYORDER;
    
    EWKJBtn *myOrder = [[EWKJBtn alloc]initWithFrame:CGRectMake(15, 0, 135, h) img:[UIImage imageNamed:imgnames[0]] title:names[0] touchEvent:nil andbtnType:BTNTYPEEWKJ_share];
    myOrder.tag = PERSONALCENTER_FUNCTION_MYORDER;
    [bg addSubview:myOrder];
    EWKJBtn *allOrder = [[EWKJBtn alloc]initWithFrame:CGRectMake(SW-150, 0, 135, h) img:[UIImage imageNamed:imgnames[1]] title:names[1] touchEvent:nil andbtnType:BTNTYPERL];
    [bg addSubview:allOrder];
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, top+h-1, SW, 1)];
    line.backgroundColor = COLOR(0xde);
    [self.view addSubview:line];
    EWKJBtn *orderTouchBtn = [[EWKJBtn alloc]initWithFrame:CGRectMake(15, 0, SW-30, h)img:nil title:nil touchEvent:^(EWKJBtn *btn) {
        [weakSelf clickWithFunction:btn.tag];
    } andbtnType:BTNTYPETEXT];
    orderTouchBtn.backgroundColor = [UIColor clearColor];
    orderTouchBtn.tag = functionTag;
    functionTag++;
    [bg addSubview:orderTouchBtn];
    
    
    
    top  = h;
    CGFloat w = SW/4;
     h = 88;
    for (int i = 2; i<6; i++) {
        EWKJBtn *wait = [[EWKJBtn alloc]initWithFrame:CGRectMake((i-2)*w, top, w, h) img:[UIImage imageNamed:imgnames[i]] title:names[i] touchEvent:^(EWKJBtn *btn) {
            [weakSelf clickWithFunction:btn.tag];
        } andbtnType:BTNTYPEUD];
        wait.tag = functionTag++;
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
        EWKJBtn *personThing = [[EWKJBtn alloc]initWithFrame:CGRectMake(15, top+(i-6)*h, SW-30, h) img:[UIImage imageNamed:imgnames[i]] title:names[i] touchEvent:^(EWKJBtn *btn) {
            [weakSelf clickWithFunction:btn.tag];
        } andbtnType:type];
        
        if (type == BTNTYPEEWKJ_personalCenter_rightdetail) {
            personThing.rightDetailLab.text = @"3";
        }
        personThing.tag = functionTag++;
        [bg addSubview:personThing];
        if (i!= names.count-1) {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(15, top+(i-5)*h-1, SW-30, 1)];
            line.backgroundColor = COLOR(0xde);
            [bg addSubview:line];
        }
    }
    
    
    

}


-(void)clickWithFunction:(PERSONALCENTER_FUNCTION)function{
    
    NSInteger classIndex = function - 100;
    if (classIndex < self.classSrings.count) {
        
        NSString *classString = self.classSrings[classIndex];
        Class CtrlClass =  NSClassFromString(classString);
        if (CtrlClass) {
            EWKJBaseViewController * Ctrl = [[CtrlClass alloc]init];
            if([Ctrl isKindOfClass:[MyOrderCtrl class]]){
                MyOrderCtrl *order = (MyOrderCtrl*)Ctrl;
                order.orderState = (OrderState)function;
            }
            
            Ctrl.title = classString;
            [self.navigationController pushViewController:Ctrl animated:NO];
        }
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
