//
//  settingNameCtrl.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/19.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "settingNameCtrl.h"

@interface settingNameCtrl ()

@end

@implementation settingNameCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)addUI{
    self.title = @"昵称";
    CGFloat top = navigationBottom;
   self.view.backgroundColor = COLOR(249);
 
    
    top = navigationBottom;
    UIView *bg1=  [[UIView alloc]initWithFrame:CGRectMake(0, top, SW, 48)];
    bg1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bg1];
    
    UITextField *tf= [[UITextField alloc]initWithFrame:CGRectMake(25, 0, SW-50, 48)];
    tf.placeholder = @"请输入你的昵称";
    tf.font = EWKJboldFont(15);
    tf.textColor = COLOR(0xc8);
    [bg1 addSubview:tf];
    
    top+=48;
    
    UILabel *tip = [[UILabel alloc]initWithFrame:CGRectMake(25, top, SW-50, 26)];
    tip.textColor = COLOR(0x99);
    tip.text = @"最多输入10个字符，不能包含特殊符号";
    tip.font = EWKJboldFont(12);
    [self.view addSubview:tip];
    
    top += 26+12;
    UIButton *save =  [[UIButton alloc]initWithFrame:CGRectMake(25, top, SW-50, 40)];
    save.backgroundColor = [UIColor redColor];
    save.layer.cornerRadius = 20;
    [save setTitle:@"保存" forState:0];
    [save setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:save];
    
    [save addTarget:self action:@selector(saveName) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}
-(void)saveName{
    //保存名字请求
    
   
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
