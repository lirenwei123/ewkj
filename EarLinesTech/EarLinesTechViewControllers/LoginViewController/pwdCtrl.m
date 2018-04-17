//
//  pwdCtrl.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/17.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "pwdCtrl.h"
#import "LoginViewController.h"

@interface pwdCtrl ()
@property(nonatomic,strong)NSMutableArray *tfs;
@end

@implementation pwdCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
-(void)addUI{
    
    self.view.backgroundColor = COLOR(0xf9);
    NSArray *titles ;
    
    if (_pwdType == PWDTYPE_REGIST) {
        titles = @[@"手机号注册",@"请输入手机号",@"请输验证码",@"请输入密码",@"请输入邀请人电话",@"立即注册"];
    }else if (_pwdType == PWDTYPE_FORHETPWD){
        titles = @[@"忘记密码",@"请输入手机号",@"请输验证码",@"请输入您的新密码",@"请确认您的新密码",@"立即注册"];
    }else if (_pwdType == PWDTYPE_MODIFYPWD){
        titles = @[@"修改登录密码",@"当前密码",@"新密码",@"确认密码",@"密码不可见",@"保存"];
    }
    
    if (_pwdType != PWDTYPE_MODIFYPWD) {
        [self addPWDWithTitles:titles];
    }else{
        [self addModifyPWDWithTitles:titles];
    }
}

-(void)addPWDWithTitles:(NSArray*)names{
    self.title = names.firstObject;
    CGFloat top = statusBarHeight +44 +14;
    CGFloat h = 48;
    CGFloat leftMarhin = 15;
    CGFloat updownMargin = 14;
    _tfs = @[].mutableCopy;
    for (int i = 1; i<names.count-1; i++) {
        
        
        UIView *bg = [[UIView alloc]initWithFrame:CGRectMake(0, top+(h+updownMargin)*(i-1), SW, h)];
        bg.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:bg];
       
        UITextField *tf= [[UITextField alloc]initWithFrame:CGRectMake(leftMarhin, 0, SW-2*leftMarhin, h)];
        tf.backgroundColor = [UIColor whiteColor];
        [bg addSubview:tf];
        tf.placeholder = names[i];
        tf.font = EWKJboldFont(15);
        tf.textAlignment = NSTextAlignmentLeft;
        tf.textColor = COLOR(0xc9);
        [_tfs addObject:tf];
        
        if ([names[i] isEqualToString:@"请输验证码"]) {
            UIButton * yzm = [UIButton buttonWithType:UIButtonTypeCustom];
            [yzm setFrame:CGRectMake(SW-20-90, (h-24)/2, 90, 24)];
            [yzm setTitle:@"获取验证码" forState:0];
            yzm.clipsToBounds = YES;
            yzm.layer.cornerRadius = 12;
            [yzm setTitleColor:[UIColor redColor] forState:0];
            yzm.titleLabel.textAlignment = NSTextAlignmentCenter;
            yzm.backgroundColor = [UIColor whiteColor];
            yzm.layer.borderColor = RGB(0xf3, 0x4e, 0x22).CGColor;
            yzm.layer.borderWidth = 1;
            yzm.titleLabel.font = EWKJboldFont(12);
            [bg addSubview:yzm];
            [yzm addTarget:self action:@selector(yzmClick) forControlEvents:UIControlEventTouchUpInside];
            
        }
    }
    
    top = statusBarHeight +44+(updownMargin + h)*(names.count-2)+25;
    
    UIButton * registBtn = [[UIButton alloc]initWithFrame:CGRectMake(leftMarhin, top, SW-2*leftMarhin, 40)];
    [registBtn setTitleColor:[UIColor whiteColor] forState:0];
    registBtn.titleLabel.font = EWKJboldFont(15);
    registBtn.backgroundColor = [UIColor redColor];
    [registBtn setTitle:names.lastObject forState:0];
    [registBtn addTarget:self action:@selector(pwdClick:) forControlEvents:UIControlEventTouchUpInside];
     registBtn.layer.cornerRadius = 20;
    [self.view addSubview:registBtn];
    registBtn.tag = _pwdType;
    
}

-(void)yzmClick{
    [self.view endEditing:YES];
    // 获取验证码
}

-(void)addModifyPWDWithTitles:(NSArray*)names{
    self.title = names.firstObject;
    CGFloat top = statusBarHeight +44 +14;
    CGFloat h = 48;
    CGFloat leftMarhin = 15;
    CGFloat updownMargin = 28;
    CGFloat leftW = 104;
    _tfs = @[].mutableCopy;
    for (int i = 1; i<names.count-1; i++) {
        
        
        UIView *bg = [[UIView alloc]initWithFrame:CGRectMake(0, top+(h+updownMargin)*(i-1), SW, h)];
        bg.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:bg];
        
        UILabel *leftLab = [[UILabel alloc]initWithFrame:CGRectMake(leftMarhin, 0, leftW-leftMarhin, h)];
        leftLab.backgroundColor = [UIColor whiteColor];
        leftLab.font = EWKJboldFont(15);
        leftLab.textAlignment = NSTextAlignmentLeft;
        leftLab.textColor = COLOR(0x33);
        leftLab.text = names[i];
        [bg addSubview:leftLab];
        
        
        if ([names[i] isEqualToString:@"密码不可见"]) {
            UIButton * pwdCanSee = [[UIButton alloc]initWithFrame:CGRectMake(leftW, (h-30)/2, 100, 30)];
            [pwdCanSee setImage:[UIImage imageNamed:@"login_close"] forState:0];
             [pwdCanSee setImage:[UIImage imageNamed:@"login_open"] forState:UIControlStateSelected];
            pwdCanSee.selected = YES;
            [pwdCanSee addTarget:self action:@selector(onoffClick:) forControlEvents:UIControlEventTouchUpInside];
            [bg addSubview:pwdCanSee];
            
            
         
            continue;
        }
        
        
        UITextField *tf= [[UITextField alloc]initWithFrame:CGRectMake(leftW, 0, SW-2*leftMarhin-leftW, h)];
        tf.backgroundColor = [UIColor whiteColor];
        [bg addSubview:tf];
        tf.placeholder = names[i];
        tf.font = EWKJboldFont(15);
        tf.textAlignment = NSTextAlignmentLeft;
        tf.textColor = COLOR(0xc8);
        tf.secureTextEntry = YES;
        [_tfs addObject:tf];
        
        
        UILabel *tip = [[UILabel alloc]initWithFrame:CGRectMake(leftW, top+h+(h+updownMargin)*(i-1), SW-leftW, updownMargin)];
        tip.backgroundColor = [UIColor clearColor];
        tip.textAlignment = NSTextAlignmentLeft;
        tip.font = EWKJboldFont(12);
        tip.textColor = RGB(0xed, 0x2c, 0x2c);
        tip.text = @"test";
        tip.tag = 100+i-1;
        [self.view addSubview:tip];
        

    }
    
    top = statusBarHeight +44+(updownMargin + h)*(names.count-2)+25;
    
    UIButton * registBtn = [[UIButton alloc]initWithFrame:CGRectMake(leftMarhin, top, SW-2*leftMarhin, 40)];
    [registBtn setTitleColor:[UIColor whiteColor] forState:0];
    registBtn.titleLabel.font = EWKJboldFont(15);
    registBtn.backgroundColor = [UIColor redColor];
    [registBtn setTitle:names.lastObject forState:0];
    [registBtn addTarget:self action:@selector(pwdClick:) forControlEvents:UIControlEventTouchUpInside];
    registBtn.layer.cornerRadius = 20;
    [self.view addSubview:registBtn];
    registBtn.tag = _pwdType;
    
    
    
}

-(void)addModifyPWDSuccess{
    CGFloat top =  statusBarHeight +44;
    CGFloat w = 200;
    EWKJBtn * success =  [[EWKJBtn alloc]initWithFrame:CGRectMake((SW-w)/2, top +35, w, w) img:[UIImage imageNamed:@"login_right"] title:@"登录密码修改成功" touchEvent:nil andbtnType:BTNTYPEUD];
    success.lab.textColor = RGB(0x03, 0xcc, 0x62);
    success.lab.font = EWKJboldFont(15);
    [self.view addSubview:success];
    
    UILabel *tip = [[UILabel alloc]initWithFrame:CGRectMake(15, top+35+w+50, SW-30, 35)];
    tip.text = @"密码修改成功，客户端原有登录状态已失效，请使用新密码重新登录";
    tip.numberOfLines = 2;
    tip.textColor = COLOR(0x99);
    tip.font = EWKJboldFont(12);
    [self.view addSubview:tip];
    
    UIButton *login = [[UIButton alloc]initWithFrame:CGRectMake(15, top+35+w+50+35+35, SW-30, 40)];
    login.backgroundColor = [UIColor redColor];
    [login setTitle:@"重新登录" forState:0];
    login.titleLabel.textColor = [UIColor whiteColor];
    login.titleLabel.font = EWKJboldFont(15);
    [self.view addSubview:login];
    [login addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
-(void)login{
    LoginViewController *logvc = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:logvc animated:NO];
    
}

-(void)onoffClick:(UIButton *)sender{
    sender.selected = !sender.isSelected;
    for (UITextField * tf in _tfs) {
        tf.secureTextEntry = sender.isSelected;
    }
}
-(void)pwdClick:(UIButton*)sender{
    if (sender.tag == PWDTYPE_REGIST) {
        //注册
    }else if (sender.tag ==PWDTYPE_FORHETPWD){
        // 忘记密码
    }else if (sender.tag == PWDTYPE_MODIFYPWD){
        //修改密码
        [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
        } ];
        
        [self addModifyPWDSuccess];
        
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
