//
//  EarLinesScanViewController
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/12.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "EarLinesScanViewController.h"
#import <Photos/Photos.h>




@interface EarLinesScanViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong)UIImagePickerController *imgPicker;
@property(nonatomic,assign)CGRect imgRect;
@property(nonatomic,assign)int currentBtnTag;

@end

@implementation EarLinesScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)addUI{
    self.title = @"耳纹预览";
    [self photoClick:nil];
    
}
    
- (void)photoClick:(UIButton *)sender {
    if([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]){
        self.imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        self.imgPicker.showsCameraControls = NO;
        UIView *overlayView = [self overLayViewWithImgName:@"wl" centerPoint:self.imgPicker.view.center isLeft:_isLeft];
        self.imgPicker.cameraOverlayView = overlayView;
        [self presentViewController:self.imgPicker animated:YES completion:nil];
    }
}


#pragma mark -UIImagePickerControllerDelegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self.imgPicker dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *EditImg = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (_completePhoto) {
        _completePhoto(EditImg);
    }
    //保存图片到相册
    [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
          [PHAssetChangeRequest creationRequestForAssetFromImage:EditImg];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        if (error) {
            DebugLog(@"保存相片错误");
        }
    }];
   
    [self.imgPicker dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:NO];
    
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
    
    {
    
    UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,0,50,30)];
    
    [cancelBtn setTitle:@"取消" forState:(UIControlStateNormal)];
    
    cancelBtn.backgroundColor = [UIColor redColor];
    
    [cancelBtn addTarget:self action:@selector(click) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithCustomView:cancelBtn];
    
    [viewController.navigationItem setRightBarButtonItem:btn animated:NO];
    
    }
    

    
- (void)click{
    [self imagePickerControllerDidCancel:self.imgPicker];
}


-(UIImagePickerController *)imgPicker{
    if (!_imgPicker) {
        _imgPicker =  [[UIImagePickerController alloc]init];
//        _imgPicker.allowsEditing = YES;
        _imgPicker.delegate = self;
        _imgPicker.modalPresentationStyle = UIModalPresentationCurrentContext;
        
    }
    return _imgPicker;
}
    
    
-(CGRect)imgRectWithCenter:(CGPoint)center imgsize:(CGSize)imgSize{
    CGFloat w = SW*0.8;
    CGFloat rate =  w/imgSize.width;
    CGFloat h = imgSize.height*rate;
    CGRect rect = CGRectMake(center.x-w/2, center.y-64-h/2, w, h);
    _imgRect =  rect;
    return _imgRect;
}

-(UIView*)overLayViewWithImgName:(NSString *)imgname centerPoint:(CGPoint)centerP isLeft:(BOOL)isleft{
    UIImage *ewimg = [UIImage imageNamed:imgname];
    UIImageView *imgv = [[UIImageView alloc]initWithImage:ewimg];
    CGRect imgrect = [self imgRectWithCenter:centerP imgsize:ewimg.size];
    imgv.frame = imgrect;
    
    UIView * OverlayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.imgPicker.view.frame), CGRectGetHeight(self.imgPicker.view.frame))];
    OverlayView.backgroundColor = [UIColor clearColor];
    [OverlayView addSubview:imgv];
    
    UILabel *tip = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imgrect)+20, SW, 30)];
    tip.backgroundColor = [UIColor clearColor];
    tip.textAlignment = NSTextAlignmentCenter;
    tip.text = isleft?@"请对准左耳拍摄":@"请对准右耳拍摄";
    tip.font = EWKJfont(15);
    tip.textColor = RGB(0xe8,1, 1);
    [OverlayView addSubview:tip];
    
   //相册 拍照 旋转
    CGFloat wh = 50;
    CGFloat magin = (SW-15*2-3*wh)/2;
    for(int i = 0 ;i<3 ;i++){
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(15+i*(wh+magin), CGRectGetHeight(OverlayView.frame)-30-wh, wh, wh)];
        btn.backgroundColor = [UIColor cyanColor];
        [btn addTarget:self action:@selector(photoBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        if(i==1){
            _currentBtnTag = i;
        }
        [OverlayView addSubview:btn];
    }
    
    return OverlayView;
}
   
    -(void)photoBtn:(UIButton *)sender{
     NSInteger tag = sender.tag;
        switch (tag) {
            case 0:
            if(_currentBtnTag == 1){
                self.imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
                _currentBtnTag = 0;
            }else{
                 self.imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
                _currentBtnTag = 1;
            }
            break;
            case 1:
            [self.imgPicker takePicture];
            break;
            case 2:
             self.imgPicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            break;
            
            default:
            break;
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
