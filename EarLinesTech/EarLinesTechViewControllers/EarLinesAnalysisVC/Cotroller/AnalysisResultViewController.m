//
//  AnalysisResultViewController.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/12.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "AnalysisResultViewController.h"
#import "maintenanceAdviceCtrl.h"
#import "nearbyMerchantsCtrl.h"
#import "analyzeResultCell.h"

@interface AnalysisResultViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *backGD;

@property (weak, nonatomic) IBOutlet UIButton *MaintenanceAdvice;
@property (weak, nonatomic) IBOutlet UIButton *NearbyMerchants;
@property(nonatomic,strong)UITableView *table;

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
    
     self.backGD.frame = CGRectMake(0,navigationBottom, SW, SH-navigationBottom);
    
   
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
    
    if (_resultModel) {
       
        _table = [[UITableView alloc]initWithFrame:CGRectMake(15, navigationBottom+10, SW-30, SH-navigationBottom-10-60)];
        _table.backgroundColor = [UIColor whiteColor];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.delegate = self;
        _table.dataSource = self;
        _table.clipsToBounds = YES;
        _table.layer.cornerRadius = 3;
        _table.showsVerticalScrollIndicator = NO;
        _table.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:_table];
    }
}

#pragma mark -table代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    analyzeResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (indexPath.row == 0) {
        if (!cell) {
            cell = [[analyzeResultCell alloc]initWithType:cellTypeScore];
        }
        cell.resultModel = _resultModel;
        cell.imgv.image = self.ewImg;
        cell.cellItem = [[analyseResultViewModel alloc]initWithScore];
    }else{
        if (!cell) {
            cell = [[analyzeResultCell alloc]initWithType:cellTypeContent];
            cell.cellItem = [[analyseResultViewModel alloc]initWithContent];
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    analyseResultViewModel *vm = nil;
    if (indexPath.row == 0) {
        vm = [[analyseResultViewModel alloc]initWithScore];
    }else{
        vm = [[analyseResultViewModel alloc]initWithContent];
    }
    return vm.cellHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.view viewWithTag:50]) {
        [[self.view viewWithTag:50] removeFromSuperview];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([self.view viewWithTag:50]) {
        [[self.view viewWithTag:50] removeFromSuperview];
    }
}

-(void)share{
    if ([self.view viewWithTag:50]) {
        [[self.view viewWithTag:50] removeFromSuperview];
    }else{
        
        NSArray *imgs = @[@"weixin_icon",@"pyq_icon",@"qq_icon",@"qqkj_icon"];
        NSArray *names = @[@"微信好友",@"朋友圈",@"QQ好友",@"QQ空间"];
        CGFloat w = 140;
        CGFloat h  = 44;
        CGFloat top = navigationBottom+20;
        UIView *bg = [[UIView alloc]initWithFrame:CGRectMake(SW-w, top, w, h*imgs.count)];
        bg.backgroundColor =  [UIColor whiteColor];
        bg.tag = 50;
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
}

-(void)shareWithTag:(SHARETYPE)type{
    if ([self.view viewWithTag:50]) {
        [[self.view viewWithTag:50] removeFromSuperview];
    }
}
- (IBAction)MaintenanceAdviceClick:(UIButton *)sender {
    maintenanceAdviceCtrl * maintenanceAdvice = [[maintenanceAdviceCtrl alloc]init];
    [self.navigationController pushViewController:maintenanceAdvice animated:NO];
}
- (IBAction)NearbyMerchantsClick:(UIButton *)sender {
    nearbyMerchantsCtrl * nearbyMerchants = [[nearbyMerchantsCtrl alloc]init];
    [self.navigationController pushViewController:nearbyMerchants animated:NO];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.view viewWithTag:50]) {
        [[self.view viewWithTag:50] removeFromSuperview];
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
