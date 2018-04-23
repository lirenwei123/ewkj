//
//  EWKJMainViewController.m
//  ERWENKEJI
//
//  Created by  RWLi on 2018/4/9.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "EWKJMainViewController.h"
#import "EarLinesAnalysisViewController.h"
#import "EarLinesTechnologyViewController.h"
#import "MyEarLinesVC/PersonalDataCtrl.h"
#import "OnlineShoppingVC/OnlineShoppingViewController.h"



#define btnMargin_edge (15)
#define btnW1 (90)
#define btnW (150)
#define btnH (40)
@interface EWKJMainViewController ()

@end



@implementation EWKJMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}



-(void)addUI{
   
   self.title = @"耳纹科技分析";
    UIImageView *imgv = [[UIImageView alloc]initWithFrame:self.view.bounds];
//    imgv.backgroundColor = [UIColor cyanColor];
    imgv.image = [UIImage imageNamed:@"index_banner.jpg"];
    [self.view addSubview:imgv];
    
    
    
    //耳纹分析
    EWKJBtn *fenxi = [[EWKJBtn alloc]initWithFrame:CGRectMake(SW-btnMargin_edge-btnW, (SH-btnH)*.5, btnW, 44) img:nil title:nil touchEvent:^(EWKJBtn *btn) {
       [self click:btn];
    } andbtnType:BTNTYPEEWKJ];
    fenxi.tag = 100;
    fenxi.imgv.image = [UIImage imageNamed:@"index_btn"];
    fenxi.lab.font = EWKJboldFont_XXL;
    fenxi.clipsToBounds= YES;
    fenxi.layer.cornerRadius = 5;
    [self.view addSubview:fenxi];
    
    
    //在线选购,耳纹科技,我的耳纹
    CGFloat magin_in = (SW-3*btnW1-btnMargin_edge*2)/2;
    CGFloat y = SH-btnH-60;
    NSArray *titles = @[@"在线选购",@"耳纹科技",@"我的耳纹"].copy;

    for (int i = 0 ; i<titles.count; i++) {

        EWKJBtn *wode = [[EWKJBtn alloc]initWithFrame:CGRectMake(btnMargin_edge+(btnW1+magin_in)*i,y,btnW1,btnH) img:nil title:titles[i] touchEvent:^(EWKJBtn *btn) {
            
            //点击事件
            [self click:btn];
            
        } andbtnType:BTNTYPEEWKJ];
        wode.imgv.image =  [UIImage imageNamed:@"index_btn_bottom"];
        wode.tag = 101+i;
        wode.clipsToBounds =YES;
        wode.layer.cornerRadius = 3;
        [self.view addSubview:wode];
    }
   
    
}


-(void)click:(EWKJBtn*)sender{

    NSArray *classArray = @[@"EarLinesAnalysisViewController",@"OnlineShoppingViewController",@"EarLinesTechnologyViewController",@"PersonalCenterCtrl"].copy;
    NSInteger index = sender.tag -100;
    if (index < classArray.count) {
        Class class = NSClassFromString(classArray[index]);
        if (class) {
            UIViewController *vc = [[class alloc]init];
            vc.title = sender.lab.text;
            [self.navigationController pushViewController:vc animated:NO];
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
