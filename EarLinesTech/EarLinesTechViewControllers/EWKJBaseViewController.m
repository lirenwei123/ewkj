//
//  EWKJBaseViewController.m
//  ERWENKEJI
//
//  Created by  RWLi on 2018/4/10.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "EWKJBaseViewController.h"


@interface EWKJBaseViewController ()

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
-(void)close{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)addUI{
    
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
