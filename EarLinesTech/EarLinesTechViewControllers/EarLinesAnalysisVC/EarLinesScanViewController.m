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

@property (weak, nonatomic) IBOutlet UIButton *selfPhoto;
@property (weak, nonatomic) IBOutlet UIButton *photo;
@property (weak, nonatomic) IBOutlet UIButton *photoAlbum;
@property (weak, nonatomic) IBOutlet UILabel *tipLab;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImgV;

@property(nonatomic,strong)UIImagePickerController *imgPicker;

@end

@implementation EarLinesScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)addUI{
    self.backGroundImgV.frame = CGRectMake(0,statusBarHeight+44, SW, SH-statusBarHeight-44);
    self.title = @"耳纹预览";
    self.tipLab.text = _isLeft?@"请对转左耳拍摄":@"请对转右耳拍摄";
}
- (IBAction)selfPhotoClick:(UIButton *)sender {
    if([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]){
        self.imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        [self presentViewController:self.imgPicker animated:YES completion:nil];
    }
}
- (IBAction)photoClick:(UIButton *)sender {
    if([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]){
        self.imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
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
    
    UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (_completePhoto) {
        _completePhoto(img);
    }
    //保存图片到相册
    [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
          [PHAssetChangeRequest creationRequestForAssetFromImage:img];
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
    if (img) {
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
