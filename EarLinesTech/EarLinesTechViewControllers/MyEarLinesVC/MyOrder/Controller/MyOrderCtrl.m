//
//  MyOrderCtrl.m
//  EarLinesTech
//
//  Created by apple   on 2018/4/20.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "MyOrderCtrl.h"

@interface MyOrderCtrl ()
@property(nonatomic,assign)CGFloat btnW ;
@property (nonatomic,strong)UIView *currentTopLine;
@property (nonatomic,strong) UIView *noneBG;
@property (nonatomic,strong) UIView *topBG;
    @property (nonatomic,strong) EWKJBtn *currentBtn;
@end

@implementation MyOrderCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)addUI{
    self.title = @"我的订单";
    
    CGFloat top = navigationBottom;
    CGFloat magin = 2;
    CGFloat h = 30;
   
    NSArray * topBtnTitles = @[@"全部",@"待付款",@"待发货",@"待收货",@"已完成",@"退换货"];
    CGFloat w = (SW-2*magin)/topBtnTitles.count;
    _btnW = w;
    
    UIView *topbg = [[UIView alloc]initWithFrame:CGRectMake(0, top, SW, h)];
    topbg.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topbg];
    _topBG = topbg;
    
    WeakSelf
    for (int i = 0 ; i< topBtnTitles.count; i++) {
        EWKJBtn * topBtn = [[EWKJBtn alloc]initWithFrame:CGRectMake(magin+w*i, 0, w, h) img:nil title:topBtnTitles[i] touchEvent:^(EWKJBtn *btn) {
            [weakSelf topBtnClick:btn];
        } andbtnType:BTNTYPETEXT];
        topBtn.lab.font = EWKJboldFont(12);
        topBtn.lab.textColor = COLOR(0x33);
        [topbg addSubview:topBtn];
        topBtn.tag = i;
        
        if (i == _orderState-100 ) {
            if(i ==4){
                _orderState ++;
            }else{
                
                _currentBtn = topBtn;
                UIView * bottomLine = [[UIView alloc]initWithFrame:CGRectMake(magin+i*w, h-2, w, 2)];
                bottomLine.backgroundColor = RGB(0xd8,8, 2);
                [topbg addSubview:bottomLine];
                _currentTopLine = bottomLine;
            }
        }
    }
    
    top = top+h+10;
    //没有数据的时候显示
    _noneBG = [[UIView alloc]initWithFrame:CGRectMake(0, top, SW, SH -top)];
    _noneBG.backgroundColor =  [UIColor whiteColor];
    [self.view addSubview:_noneBG];
    CGFloat nonewidth = 150;
    EWKJBtn *noneIMGV = [[EWKJBtn alloc]initWithFrame:CGRectMake((SW-nonewidth)/2, 32, nonewidth, nonewidth) img:[UIImage imageNamed:@"none"] title:@"什么都还没有哦～" touchEvent:nil andbtnType:BTNTYPEUD];
    noneIMGV.lab.font = EWKJfont(14);
    noneIMGV.lab.textColor = COLOR(0x99);
    [_noneBG addSubview:noneIMGV];
    
    
    
    
    //有数据的时候
    
    
}

-(void)topBtnClick:(EWKJBtn*)sender{
    //底线先滑过去
    if(sender != _currentBtn ){
        _currentBtn = sender;
        _orderState = sender.tag;
        WeakSelf
        [UIView animateWithDuration:0.1 animations:^{
            weakSelf.currentTopLine.frame = CGRectMake(2+weakSelf.btnW*sender.tag,28,weakSelf.btnW, 2);
        }];
        
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
