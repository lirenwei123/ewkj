//
//  LoginViewController.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/11.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "LoginViewController.h"
#import "pwdCtrl.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;
@property (weak, nonatomic) IBOutlet UITextField *acountTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)addUI{
    self.title = @"登录";
    self.loginBtn.layer.cornerRadius =  self.loginBtn.frame.size.height/2;
    self.clearBtn.layer.cornerRadius = self.clearBtn.frame.size.height/2;
    
    
}

- (IBAction)regist:(UIButton *)sender {
    [self.view endEditing:YES];
    pwdCtrl *pwd = [[pwdCtrl alloc]init];
    pwd.pwdType = PWDTYPE_REGIST;
    [self.navigationController pushViewController:pwd animated:NO];
}
- (IBAction)forgetPwd:(UIButton *)sender {
    [self.view endEditing:YES];
    pwdCtrl *pwd = [[pwdCtrl alloc]init];
    pwd.pwdType = PWDTYPE_FORGETPWD;
    [self.navigationController pushViewController:pwd animated:NO];
}
- (IBAction)loginClick:(id)sender {
    [self.view endEditing:YES];
}
- (IBAction)clearAcount:(UIButton *)sender {
    _acountTF.text =@"";
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
