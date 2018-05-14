//
//  HomePageViewController.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/5/14.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *topImgV;
@property (weak, nonatomic) IBOutlet UILabel *bottomLab;
@property (weak, nonatomic) IBOutlet UIButton *ewkjBtn;
@property (weak, nonatomic) IBOutlet UIButton *myEwBtn;
@property (weak, nonatomic) IBOutlet UIButton *ewlinesAnasize;

@property (weak, nonatomic) IBOutlet UIButton *onlineShopBtn;

@property (weak, nonatomic) IBOutlet UILabel *topLogoLab;
@property (weak, nonatomic) IBOutlet UIImageView *toplogImgv;
@property (weak, nonatomic) IBOutlet UIImageView *earImgv;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;

@end

@implementation HomePageViewController


- (IBAction)click:(UIButton *)sender {
    NSArray *classArray = @[@"EarLinesAnalysisViewController",@"OnlineShoppingViewController",@"EarLinesTechnologyViewController",@"PersonalCenterCtrl"].copy;
    NSInteger index = sender.tag -100;
    if (index < classArray.count) {
        Class class = NSClassFromString(classArray[index]);
        if (class) {
            UIViewController *vc = [[class alloc]init];
            vc.title = sender.titleLabel.text;
            if (index!=1) {
                EWKJBaseViewController *ctrl = (EWKJBaseViewController*)vc;
                ctrl.isNeedLogin = YES;
            }
            [self.navigationController pushViewController:vc animated:NO];
        }
    }
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"耳纹科技分析";
    
    [self myInit];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if( [[NSUserDefaults standardUserDefaults]boolForKey:ISLOGIN]){
            NSString *account= [USERBaseClass user].account;
            __block  NSString *pwd = [USERBaseClass user].pwd;
            
            if (account.length && pwd.length ) {
                NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:account,@"Account",pwd,@"Password", nil];
                [[EWKJRequest request]requestWithAPIId:user1 httphead:nil bodyParaDic:dict completed:^(id datas) {
                    
                    if (datas) {
                        //更新token
                        NSDictionary *dic = (NSDictionary*)datas[@"Data"];
                        USERBaseClass *user = [USERBaseClass user];
                        user.token = dic[@"Token"];
                        if (user) {
                            [NSKeyedArchiver archiveRootObject:user toFile:USERINFOPATH];
                        }
                    }
                    
                } error:^(NSError *error) {
                    
                    if (error) {
                        [self alertWithString:[NSString stringWithFormat:@"%@",error]];
                    }
                }];
                
            }
        }
    });
    
}

-(void)myInit{
    _topImgV.frame = CGRectMake(0, navigationBottom, SW,SH*0.6);
    _topLogoLab.frame = CGRectMake(20, navigationBottom+10, SW/3, 30);
    _toplogImgv.frame = CGRectMake(CGRectGetMaxX(_topLogoLab.frame)+20, navigationBottom+10, SW-60-SW/3, 130);
    _earImgv.frame = CGRectMake(10, CGRectGetMaxY(_topLogoLab.frame)+40, SW/2, SH*0.6-CGRectGetMaxY(_topLogoLab.frame)-50);
    _detailLab.frame = CGRectMake(CGRectGetMaxX(_earImgv.frame)+10, CGRectGetMaxY(_toplogImgv.frame), SW-30-CGRectGetMaxX(_earImgv.frame), 150);
    _ewlinesAnasize.frame = CGRectMake(SW-150, CGRectGetMaxY(_detailLab.frame)+20, 120, 40);
    
    
    
    CGFloat margin = 20;
    CGFloat seperrate = 50;
    CGFloat w = (SW-2*margin-2*seperrate)/3;
    CGFloat h = 40;
    
    
    _onlineShopBtn.frame = CGRectMake(margin, SH-bottomHeight-h-30, w, 50);
    _ewkjBtn.frame = CGRectMake(margin+w+seperrate, SH-bottomHeight-h-30, w, 50);
    _myEwBtn.frame = CGRectMake(SW-margin-w, SH-bottomHeight-h-30, w, 50);
    
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
