//
//  EWKJBaseViewController.m
//  ERWENKEJI
//
//  Created by  RWLi on 2018/4/10.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "EWKJBaseViewController.h"


@interface EWKJBaseViewController ()<UIAlertViewDelegate>

@end

@implementation EWKJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addReturn];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addUI];
}

-(void)addReturn{
    UIBarButtonItem * returnBtn = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:nil];
    returnBtn.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = returnBtn;
 
    
}
-(void)addRightCloseBtn{
    UIBarButtonItem *btn0 = [[UIBarButtonItem alloc] initWithTitle:@"关闭"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(close)];
    
    
    
    self.navigationItem.rightBarButtonItem = btn0;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)close{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)addUI{
     self.view.backgroundColor = COLOR(249);
}
    
- (void)alertWithString:(NSString *)str{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:str delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil];
        [alert show];
}
    
    -(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
        
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
