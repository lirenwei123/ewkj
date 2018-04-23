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
    
    UIScrollView *bgSC = [[UIScrollView alloc]initWithFrame:CGRectMake(0,navigationBottom, SW, SH-navigationBottom)];
    [self.view addSubview:bgSC];
    bgSC.contentSize =CGSizeMake(SW, SH*2);
    
    _adviceString = @"活动现场，官方并未公布新车的内饰造型，不过预计将和海外版车型保持一致。动力方面，新CC将提供两款不同调校的2.0T发动机供消费者选择，其中高功率版车型的最大功率为220马力（162千瓦），低功率版车型的最大功率为186马力（137千瓦）。活动现场，官方并未公布新车的内饰造型，不过预计将和海外版车型保持一致。动力方面，新CC将提供两款不同调校的2.0T发动机供消费者选择，其中高功率版车型的最大功率为220马力（162千瓦），低功率版车型的最大功率为186马力（137千瓦）。活动现场，官方并未公布新车的内饰造型，不过预计将和海外版车型保持一致。动力方面，新CC将提供两款不同调校的2.0T发动机供消费者选择，其中高功率版车型的最大功率为220马力（162千瓦），低功率版车型的最大功率为186马力（137千瓦）。活动现场，官方并未公布新车的内饰造型，不过预计将和海外版车型保持一致。动力方面，新CC将提供两款不同调校的2.0T发动机供消费者选择，其中高功率版车型的最大功率为220马力（162千瓦），低功率版车型的最大功率为186马力（137千瓦）。活动现场，官方并未公布新车的内饰造型，不过预计将和海外版车型保持一致。动力方面，新CC将提供两款不同调校的2.0T发动机供消费者选择，其中高功率版车型的最大功率为220马力（162千瓦），低功率版车型的最大功率为186马力（137千瓦）。活动现场，官方并未公布新车的内饰造型，不过预计将和海外版车型保持一致。动力方面，新CC将提供两款不同调校的2.0T发动机供消费者选择，其中高功率版车型的最大功率为220马力（162千瓦），低功率版车型的最大功率为186马力（137千瓦）。活动现场，官方并未公布新车的内饰造型，不过预计将和海外版车型保持一致。动力方面，新CC将提供两款不同调校的2.0T发动机供消费者选择，其中高功率版车型的最大功率为220马力（162千瓦），低功率版车型的最大功率为186马力（137千瓦）。活动现场，官方并未公布新车的内饰造型，不过预计将和海外版车型保持一致。动力方面，新CC将提供两款不同调校的2.0T发动机供消费者选择，其中高功率版车型的最大功率为220马力（162千瓦），低功率版车型的最大功率为186马力（137千瓦）。";
    
    
    if (_adviceString) {
        UILabel * adviceLab = [[UILabel alloc]init];
        adviceLab.numberOfLines = 0;
        adviceLab.text = _adviceString;
        adviceLab.backgroundColor = [UIColor whiteColor];
        adviceLab.font = EWKJfont(13);
        adviceLab.textColor = COLOR(0x33);
        CGFloat adviceLabHeight =  [_adviceString boundingRectWithSize:CGSizeMake(SW-30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:EWKJboldFont(13)} context:nil].size.height;
        adviceLab.frame = CGRectMake(15, 24, SW-30, adviceLabHeight);
        [bgSC addSubview:adviceLab];
    }
   
    
    //推荐商品
    
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
