//
//  OnlineShoppingViewController.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/10.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "OnlineShoppingViewController.h"
#import "MallHomeDataModels.h"

@interface OnlineShoppingViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)MallHome *mallHomeModel;
@property(nonatomic,strong)UITableView *nearlyMalltab;
@property(nonatomic,strong)UICollectionView *adviceMallcoView;
@end

@implementation OnlineShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self requestMallHomePage];
    
    
    
    
}
-(void)addUI{
    //头部广告
    UIScrollView *adSc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, navigationBottom, SW, 190)];
    [self.view addSubview:adSc];
    
    UIImageView *imgv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SW, 190)];
    imgv.image = [UIImage imageNamed:@"people"];
    [adSc addSubview:imgv];
    
    //主框架。 collectionview做精品推荐。footerView 做附近商家
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    CGFloat magin = 15;
    layout.itemSize = CGSizeMake((SW-15*3)/2, 164);
    layout.minimumLineSpacing = magin;
    layout.minimumInteritemSpacing = magin;
    layout.sectionInset = UIEdgeInsetsMake(0, magin, 0, magin);
    layout.scrollDirection =  UICollectionViewScrollDirectionVertical;
    layout.headerReferenceSize = CGSizeMake(SW, 70);
    layout.footerReferenceSize = CGSizeMake(SW, 500);
    
    _adviceMallcoView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(adSc.frame), SW, SH-navigationBottom-bottomHeight) collectionViewLayout:layout];
    _adviceMallcoView.backgroundColor = COLOR(243);
    _adviceMallcoView.delegate = self;
    _adviceMallcoView.dataSource = self;
    [_adviceMallcoView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"co"];
    [self.view addSubview:_adviceMallcoView];
    
}

#pragma mark -- collectionView delegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"co" forIndexPath:indexPath];
    if ((!cell)) {
        cell = [[UICollectionViewCell alloc]init];
    }
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}



-(UIView*)collectionFooterView{
    UITableView *tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SW, SH-navigationBottom-bottomHeight) style:UITableViewStylePlain];
    tab.backgroundColor = COLOR(243);
    tab.tableFooterView = [[UIView alloc]init];
    tab.delegate = self;
    tab.dataSource  = self;
    _nearlyMalltab = tab;
    return tab;
}

-(void)requestMallHomePage{
//    GET api/mall/home?productPageSize={productPageSize}&merchantPageSize={merchantPageSize}&latitude={latitude}&longitude={longitude}
    NSString * url = @"http://em-webapi.zhiyunhulian.cn/api/mall/home?productPageSize=10&merchantPageSize=5&latitude=50&longitude=50";
    WeakSelf
    [HttpRequest getWithURLString:url parameters:nil success:^(id responseObject) {
        NSString *str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//        DebugLog(@"[responseObject]------>%@",str);
        NSDictionary *dictResponse = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if (dictResponse) {
            NSDictionary *dict = dictResponse[@"Data"];
            if (dict) {
               weakSelf.mallHomeModel = [MallHome modelObjectWithDictionary:dict];
            }
        }
        
    } failure:^(NSError *error) {
        
    }];
    
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
