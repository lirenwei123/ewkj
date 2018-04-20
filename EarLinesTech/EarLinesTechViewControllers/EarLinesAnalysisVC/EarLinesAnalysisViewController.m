//
//  EarLinesAnalysisViewController.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/10.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "EarLinesAnalysisViewController.h"
#import "EarLinesScanViewController.h"
#import "AnalysisResultViewController.h"

@interface EarLinesAnalysisViewController()

@property(nonatomic,strong)UIImage *leftImg;
@property(nonatomic,strong)UIImage *rightImg;

@end



@implementation EarLinesAnalysisViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
}
-(void)addUI{
    self.title = @"耳闻分析";
    
    CGFloat margin = 25;
    CGFloat top = 150;
    CGFloat w =SW/2 - margin*2;
    CGFloat h  =80;
    CGFloat corner = 5;
    
    UIButton * btn1  =[UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(margin, top, w, h);
    btn1.layer.cornerRadius = corner;
    btn1.clipsToBounds = YES;
    [btn1 setTitle:@"请上传左耳照片" forState:0];
    [btn1 setTitleColor:[UIColor whiteColor] forState:0];
//    btn1.backgroundColor = [UIColor cyanColor];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"img_bg"] forState:0];
    [btn1 addTarget:self action:@selector(leftEar:) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag = 100;
    [self.view addSubview:btn1];
    
    
    UIButton * btn2  =[UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(SW-margin-w, top, w, h);
    btn2.layer.cornerRadius = corner;
    btn2.clipsToBounds = YES;
    [btn2 setTitle:@"请上传右耳照片" forState:0];
     [btn2 setTitleColor:[UIColor whiteColor] forState:0];
//    btn2.backgroundColor = [UIColor cyanColor];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"img_bg"] forState:0];
    [btn2 addTarget:self action:@selector(rightEar:) forControlEvents:UIControlEventTouchUpInside];
    btn2.tag = 200;
    [self.view addSubview:btn2];
    
    UIButton * btn3  =[UIButton buttonWithType:UIButtonTypeSystem];
    btn3.frame = CGRectMake(0,0,SW-margin*2,50);
    btn3.center = self.view.center;
    btn3.layer.cornerRadius = corner;
    btn3.clipsToBounds = YES;
    [btn3 setTitleColor:[UIColor whiteColor] forState:0];
    [btn3 setTitle:@"开始分析" forState:0];
    btn3.backgroundColor = [UIColor redColor];
    [btn3 addTarget:self action:@selector(analysize:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
}


-(void)leftEar:(UIButton *)sender1{
    EarLinesScanViewController *left = [[EarLinesScanViewController alloc]init];
    left.isLeft = YES;
    WeakSelf
    left.completePhoto = ^(UIImage *photo) {
        weakSelf.leftImg = photo;
        if (photo) {
            UIButton *leftB = [self.view viewWithTag:100];
            [leftB setBackgroundImage:photo forState:UIControlStateNormal];
            [leftB setTitle:@"" forState:UIControlStateNormal];
        }
    };
    [self.navigationController pushViewController:left animated:NO];
}
-(void)rightEar:(UIButton *)sender2{
    WeakSelf
    EarLinesScanViewController *right = [[EarLinesScanViewController alloc]init];
    right.completePhoto = ^(UIImage *photo) {
        weakSelf.rightImg = photo;
        if (photo) {
            UIButton *leftB = [self.view viewWithTag:200];
            [leftB setBackgroundImage:photo forState:UIControlStateNormal];
            [leftB setTitle:@"" forState:UIControlStateNormal];
        }
    };
    [self.navigationController pushViewController:right animated:NO];
}
-(void)analysize:(UIButton *)sender3{
    AnalysisResultViewController *result = [[AnalysisResultViewController alloc]init];
    [self.navigationController pushViewController:result animated:NO];
}

@end
