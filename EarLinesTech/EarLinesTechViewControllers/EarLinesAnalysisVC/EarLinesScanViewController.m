//
//  EarLinesScanViewController
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/12.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "EarLinesScanViewController.h"
#import <Photos/Photos.h>
#import "UIImage+drawImage.h"
#define imgW (83)
#define imgH  (150)


@interface EarLinesScanViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *selfPhoto;
@property (weak, nonatomic) IBOutlet UIButton *photo;
@property (weak, nonatomic) IBOutlet UIButton *photoAlbum;
@property (weak, nonatomic) IBOutlet UILabel *tipLab;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImgV;
    

@property(nonatomic,strong)UIImagePickerController *imgPicker;
    @property(nonatomic,assign)CGRect imgRect;

@end

@implementation EarLinesScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)addUI{
    self.backGroundImgV.frame = CGRectMake(0,navigationBottom, SW, SH-statusBarHeight-44);
    self.title = @"耳纹预览";
//    self.tipLab.text = _isLeft?@"请对准左耳拍摄":@"请对准右耳拍摄";
}
- (IBAction)selfPhotoClick:(UIButton *)sender {
    if([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]){
        self.imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
//        self.imgPicker.cameraViewTransform =  CGAffineTransformMakeScale(0.5, 0.5);
        UIView *overlayView = [self overLayViewWithImgName:@"wl" centerPoint:self.imgPicker.view.center isLeft:_isLeft];
        self.imgPicker.cameraOverlayView = overlayView;
        [self presentViewController:self.imgPicker animated:YES completion:nil];
    }
}
- (IBAction)photoClick:(UIButton *)sender {
    if([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]){
        self.imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        UIView *overlayView = [self overLayViewWithImgName:@"wl" centerPoint:self.imgPicker.view.center isLeft:_isLeft];
        self.imgPicker.cameraOverlayView = overlayView;
        [self presentViewController:self.imgPicker animated:YES completion:nil];
    }
}
- (IBAction)photoAlbumClick:(UIButton *)sender {
    self.imgPicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:self.imgPicker animated:YES completion:nil];
}

#pragma mark -UIImagePickerControllerDelegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self.imgPicker dismissViewControllerAnimated:NO completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *EditImg = [info objectForKey:UIImagePickerControllerEditedImage];
    UIImageView *imgv = [[UIImageView alloc]initWithImage:EditImg];
    UIImage *saveImg = [UIImage image_cutwithrect:_imgRect fromview:imgv];
    if (_completePhoto) {
        _completePhoto(saveImg);
    }
    //保存图片到相册
    [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
          [PHAssetChangeRequest creationRequestForAssetFromImage:saveImg];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        if (error) {
            DebugLog(@"保存相片错误");
        }
    }];
   
//    NSString *const  UIImagePickerControllerMediaType ;指定用户选择的媒体类型（文章最后进行扩展）
//    NSString *const  UIImagePickerControllerOriginalImage ;原始图片
//    NSString *const  UIImagePickerControllerEditedImage ;修改后的图片
//    NSString *const  UIImagePickerControllerCropRect ;裁剪尺寸
//    NSString *const  UIImagePickerControllerMediaURL ;媒体的URL
//    NSString *const  UIImagePickerControllerReferenceURL ;原件的URL
//    NSString *const  UIImagePickerControllerMediaMetadata;当来数据来源是照相
    
    
    [self.imgPicker dismissViewControllerAnimated:NO completion:nil];
    if (saveImg) {
        [self.navigationController popViewControllerAnimated:NO];
    }
}




-(UIImagePickerController *)imgPicker{
    if (!_imgPicker) {
        _imgPicker =  [[UIImagePickerController alloc]init];
        _imgPicker.delegate = self;
    }
    return _imgPicker;
}
    
    
-(CGRect)imgRectWithCenter:(CGPoint)center imgsize:(CGSize)imgSize{
    CGRect rect = CGRectMake(center.x-imgSize.width/2, center.y-50-imgSize.height/2, imgSize.width, imgSize.height);
    _imgRect =  rect;
    return _imgRect;
}

-(UIView*)overLayViewWithImgName:(NSString *)imgname centerPoint:(CGPoint)centerP isLeft:(BOOL)isleft{
    UIImage *ewimg = [UIImage imageNamed:imgname];
    UIImageView *imgv = [[UIImageView alloc]initWithImage:ewimg];
    CGRect imgrect = [self imgRectWithCenter:centerP imgsize:imgrect.size];
    imgv.frame = imgrect;
    
    UIView * OverlayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SW, SH)];
    OverlayView.backgroundColor = [UIColor clearColor];
    [OverlayView addSubview:imgv];
    
    UILabel *tip = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imgrect)+20, SW, 30)];
    tip.backgroundColor = [UIColor clearColor];
    tip.text = isleft?@"请对准左耳拍摄":@"请对准右耳拍摄";
    tip.font = EWKJfont(15);
    tip.textColor = RGB(0xe8,1, 1);
    [OverlayView addSubview:tip];
        
    return OverlayView;
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
