//
//  EarLinesScanViewController
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/12.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "EarLinesScanViewController.h"

@interface EarLinesScanViewController ()
@property (weak, nonatomic) IBOutlet UIButton *selfPhoto;
@property (weak, nonatomic) IBOutlet UIButton *photo;
@property (weak, nonatomic) IBOutlet UIButton *photoAlbum;
@property (weak, nonatomic) IBOutlet UILabel *tipLab;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImgV;

@end

@implementation EarLinesScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)addUI{
    self.title = @"耳纹预览";
    self.tipLab.text = _isLeft?@"请对转左耳拍摄":@"请对转右耳拍摄";
}
- (IBAction)selfPhotoClick:(UIButton *)sender {
}
- (IBAction)photoClick:(UIButton *)sender {
}
- (IBAction)photoAlbumClick:(UIButton *)sender {
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
