//
//  EarLinesTechnologyViewController.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/10.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "EarLinesTechnologyViewController.h"
#import "LoginViewController.h"

@interface EarLinesTechnologyViewController ()

@end

@implementation EarLinesTechnologyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    static int flag = 0;
    if (!flag) {
        LoginViewController *logvc = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:logvc animated:NO];
        flag =1;
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