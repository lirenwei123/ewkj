//
//  nearbyMerchantsCtrl.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/20.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "nearbyMerchantsCtrl.h"
#import "merchantCell.h"

@interface nearbyMerchantsCtrl ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tab;
@end

@implementation nearbyMerchantsCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)addUI{
    self.title = @"附近商家";
    self.view.backgroundColor = COLOR(249);
    
    _tab =  [[UITableView alloc]initWithFrame:CGRectMake(0,navigationBottom+10, SW,SH-navigationBottom-10) style:UITableViewStylePlain];
    _tab.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tab];
    _tab.delegate = self;
    _tab.dataSource = self;
    _tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tab registerNib:[UINib nibWithNibName:@"merchantCell" bundle:nil] forCellReuseIdentifier:@"merchantCell"];
    [self requestMall];
    
}

-(void)requestMall{
    //GET api/mall/search/nearmerchants?latitude={latitude}&longitude={longitude}&pageSize={pageSize}&pageIndex={pageIndex}
    
    NSString * url = @"http://em-webapi.zhiyunhulian.cn/api/mall/search/nearmerchants?latitude=50&longitude=30&pageSize=2&pageIndex=1";
    
    [HttpRequest getWithURLString:url parameters:nil success:^(id responseObject) {
        NSString *str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        DebugLog(@"[responseObject]------>%@",str);
        id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
    } failure:^(NSError *error) {
        
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 95;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    merchantCell *cell = [tableView dequeueReusableCellWithIdentifier:@"merchantCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [merchantCell cell];
    }
    cell.imgv.image = [UIImage imageNamed:@"people"];
    cell.describleLab.text = @"小龙坎老火锅(春熙店)";
    cell.adressLab.text = @"春熙路 1.1km";
    cell.zhongleiLab.text = @"重庆火锅";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
