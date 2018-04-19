//
//  selectHeadPhotoCtrl.m
//  EarLinesTech
//
//  Created by apple   on 2018/4/19.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "selectHeadPhotoCtrl.h"

@interface selectHeadPhotoCtrl ()

@end

@implementation selectHeadPhotoCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)addUI{
    self.title = @"头像";
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, (SH-SW)/2, SW, SW)];
    imgV.image = _headPhoto;
    [self.view addSubview:imgV];
    
    
    //增加右上角菜单
   self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(changePhoto)];
    
    
}

-(void)changePhoto{
    
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
