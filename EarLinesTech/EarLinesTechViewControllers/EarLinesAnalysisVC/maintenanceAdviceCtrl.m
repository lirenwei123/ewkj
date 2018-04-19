//
//  maintenanceAdviceCtrl.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/20.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "maintenanceAdviceCtrl.h"

@interface maintenanceAdviceCtrl ()

@end

@implementation maintenanceAdviceCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)addUI{
    self.title = @"保养建议";
    if (_adviceString) {
        UILabel * adviceLab = [[UILabel alloc]init];
        adviceLab.numberOfLines = 0;
        adviceLab.backgroundColor = [UIColor whiteColor];
        adviceLab.font = EWKJboldFont(13);
        adviceLab.textColor = COLOR(0x33);
        CGFloat adviceLabHeight =  [_adviceString boundingRectWithSize:CGSizeMake(SW-30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:EWKJboldFont(13)} context:nil].size.height;
        adviceLab.frame = CGRectMake(15, statusBarHeight+44, SW-30, adviceLabHeight);
        [self.view addSubview:adviceLab];
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
