//
//  mallClassesViewController.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/5/20.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "mallClassesViewController.h"
#import "MallTableView.h"

@interface mallClassesViewController ()<UITextFieldDelegate>

@end

@implementation mallClassesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)addUI{
    self.navigationTitle.text = @"全部分类";
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self addSearchV];
    [self addMallClasses];
}

#pragma mark - 搜索框
-(void)addSearchV{
    UIView *searchBG = [[UIView alloc]initWithFrame:CGRectMake(15, navigationBottom+5, SW-30,33)];
    searchBG.backgroundColor = COLOR(243);
    searchBG.layer.cornerRadius = 3;
    [self.view addSubview:searchBG];
    
    UIButton *searchIMG = [[UIButton alloc]initWithFrame:CGRectMake(8, 7, 20, 20)];
    searchIMG.backgroundColor = [UIColor clearColor];
    [searchIMG setBackgroundImage:[UIImage imageNamed:@"nav_search"] forState:UIControlStateNormal];
    [searchBG addSubview:searchIMG];
    
    UITextField *searchTF = [[UITextField alloc]initWithFrame:CGRectMake(36,0, CGRectGetWidth(searchBG.frame) - 55,33)] ;
    searchTF.backgroundColor = [UIColor clearColor];
    searchTF.font = EWKJfont(15);
//    searchTF.textColor = RGB(0xfe, 0xb7, 0xab);
    searchTF.returnKeyType = UIReturnKeySearch;
    NSAttributedString *attr = [[NSAttributedString alloc]initWithString:@"输入关键字进行搜索" attributes:@{NSFontAttributeName:EWKJboldFont(14),NSForegroundColorAttributeName:COLOR(0x99)}];
    searchTF.attributedPlaceholder = attr;
    searchTF.delegate = self;
    [searchBG addSubview:searchTF];
    
    UIView *seperateLine = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(searchBG.frame)+7, SW, 10)];
    seperateLine.backgroundColor = COLOR(243);
    [self.view addSubview:seperateLine];
}

#pragma mark - 增加商品分类视图
-(void)addMallClasses{
    NSArray *names = @[@"推荐商品",@"生活食品",@"水果商城",@"推荐商品2",@"生活食品2",@"水果商城2",@"推荐商品3",@"生活食品3",@"水果商城3"].copy;
    
    CGFloat Hmargin = 15;
    CGFloat Vmargin = 30;
    CGFloat w = (SW-Hmargin*4)/3;
    CGFloat h = 90;
    WeakSelf
    for (int i = 0; i <names.count; i++) {
        EWKJBtn *mall = [[EWKJBtn alloc]initWithFrame:CGRectMake(Hmargin+i%3*(w+15), navigationBottom+60 + i/3*(h+Vmargin), w, h) img:[UIImage imageNamed:@"banner"] title:names[i] touchEvent:^(EWKJBtn *btn) {
            [weakSelf selectMall:btn.tag];
        } andbtnType:BTNTYPE_mallClass];
        mall.tag = 100+i;
        [self.view addSubview:mall];
    }
}


#pragma maek - 选择商品种类
-(void)selectMall:(NSInteger)tag{
    MallTableView *mallTab = [[MallTableView alloc]init];
    mallTab.mallType =tag%2==0?mallTableType_advice:mallTableType_nearby;
    [self.navigationController pushViewController:mallTab animated:NO];
}


#pragma mark -textFielddelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return NO;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self.view endEditing:YES];
    if (textField.text.length) {
        //搜索请求
        WeakSelf
        [self searchRequestWith:textField.text complete:^(id datas) {
        } fail:^(NSError *error) {
            
        }];
        
        textField.text = nil;
        
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
