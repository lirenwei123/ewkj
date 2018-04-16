//
//  AnalysisResultViewController.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/12.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "AnalysisResultViewController.h"

@interface AnalysisResultViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backGD;
@property (weak, nonatomic) IBOutlet UIScrollView *contenSC;
@property (weak, nonatomic) IBOutlet UIButton *MaintenanceAdvice;
@property (weak, nonatomic) IBOutlet UIButton *NearbyMerchants;

@end

typedef NS_ENUM(NSUInteger, SHARETYPE) {
    SHARETYPE_WEIXIN=100,
    SHARETYPE_PYQ,
    SHARETYPE_QQ,
    SHARETYPE_QQKJ
};

@implementation AnalysisResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (isIphoneX) {
        CGRect rect = self.contenSC.frame;
        rect.origin.y += (statusBarHeight-20);
        self.contenSC.frame = rect;
    }
    // Do any additional setup after loading the view from its nib.
}
-(void)addUI{
    self.title = @"分析结果";
    self.view.backgroundColor =RGB(255, 229, 225);
    UIImage *img  =  [UIImage imageNamed:@"share"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:img style:UIBarButtonItemStylePlain target:self action:@selector(share)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.MaintenanceAdvice.backgroundColor = RGB(0xd7, 0x05, 0x01);
    self.MaintenanceAdvice.titleLabel.font = EWKJboldFont(16);
    self.NearbyMerchants.backgroundColor =  RGB(0xf3, 0x4e,0X22);
    self.NearbyMerchants.titleLabel.font = EWKJboldFont(16);
}
-(void)share{
    NSArray *imgs = @[@"weixin_icon",@"pyq_icon",@"qq_icon",@"qqkj_icon"];
    NSArray *names = @[@"微信好友",@"朋友圈",@"QQ好友",@"QQ空间"];
    CGFloat w = 140;
    CGFloat h  = 44;
    CGFloat top = 64+statusBarHeight;
    UIView *bg = [[UIView alloc]initWithFrame:CGRectMake(SW-w, top, w, h*imgs.count)];
    bg.backgroundColor =  [UIColor whiteColor];
    [self.view addSubview:bg];
    
    WeakSelf
    for (int i  = 0; i<imgs.count; i++) {
        EWKJBtn * shareBtn  = [[EWKJBtn alloc]initWithFrame:CGRectMake(0, h*i, w, h) img:[UIImage imageNamed:imgs[i]] title:names[i] touchEvent:^(EWKJBtn *btn) {
            [weakSelf shareWithTag:btn.tag];
        } andbtnType:BTNTYPEEWKJ_share];
        shareBtn.tag = SHARETYPE_WEIXIN+i;
        [bg addSubview:shareBtn];
        if (i!= imgs.count-1) {
            
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, (i+1)*h-1, w,1)];
            line.backgroundColor =  COLOR(0xde);
            [bg addSubview:line];
        }
        
    }
}

-(void)shareWithTag:(SHARETYPE)type{
    
}
- (IBAction)MaintenanceAdviceClick:(UIButton *)sender {
}
- (IBAction)NearbyMerchantsClick:(UIButton *)sender {
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
