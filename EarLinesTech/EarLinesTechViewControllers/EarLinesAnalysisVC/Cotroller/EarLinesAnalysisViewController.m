//
//  EarLinesAnalysisViewController.m
//  EarLinesTech
//
//  Created by  RWLi on 2018/4/10.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "EarLinesAnalysisViewController.h"
#import "AnalysisResultViewController.h"
#import <Photos/Photos.h>

@interface EarLinesAnalysisViewController()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

    @property(nonatomic,strong)UIImage *leftImg;
    @property(nonatomic,strong)UIImage *rightImg;
    @property(nonatomic,strong)NSMutableArray *uploadImgs;
    @property(nonatomic,assign)BOOL isLeft;
    @property(nonatomic,assign)BOOL isAlum;

    @property(nonatomic,strong)UIImagePickerController *imgPicker;
    @property(nonatomic,assign)CGRect imgRect;
    @property(nonatomic,assign)int currentBtnTag;
    @property(nonatomic,strong)void (^completePhoto)(UIImage *photo);
    
    
@end



@implementation EarLinesAnalysisViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    _uploadImgs = @[].mutableCopy;
}
-(void)addUI{
    self.title = @"耳闻分析";
    
    CGFloat margin = 25;
    CGFloat top = 150;
    CGFloat w =SW/2 - margin*2;
    CGFloat h  = w;
    CGFloat corner = 5;
    
    UIButton * btn1  =[UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(margin, top, w, h);
    btn1.layer.cornerRadius = corner;
    btn1.clipsToBounds = YES;
    [btn1 setTitle:@"请上传左耳照片" forState:0];
    [btn1 setTitleColor:[UIColor whiteColor] forState:0];
//    btn1.backgroundColor = [UIColor cyanColor];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"img_bg"] forState:0];
    [btn1 addTarget:self action:@selector(Ear:) forControlEvents:UIControlEventTouchUpInside];
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
    [btn2 addTarget:self action:@selector(Ear:) forControlEvents:UIControlEventTouchUpInside];
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
    btn3.tag = 300;
    [btn3 addTarget:self action:@selector(Ear:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
     WeakSelf
    self.completePhoto = ^(UIImage *photo) {
        if(weakSelf.isLeft){
            weakSelf.leftImg = photo;
            if (photo) {
                UIButton *leftB = [weakSelf.view viewWithTag:100];
                [leftB setBackgroundImage:photo forState:UIControlStateNormal];
                [leftB setTitle:@"" forState:UIControlStateNormal];
                
                UploadParam *upImg = [[UploadParam alloc]init];
                upImg.data = UIImagePNGRepresentation(photo);
                upImg.name = @"left";
                upImg.filename = @"left.png";
                upImg.mimeType = @"image/png";
                [weakSelf.uploadImgs addObject:upImg];
                
            }
        }else{
            weakSelf.rightImg = photo;
            if (photo) {
                UIButton *leftB = [weakSelf.view viewWithTag:200];
                [leftB setBackgroundImage:photo forState:UIControlStateNormal];
                [leftB setTitle:@"" forState:UIControlStateNormal];
                
                UploadParam *upImg = [[UploadParam alloc]init];
                upImg.data = UIImagePNGRepresentation(photo);
                upImg.name = @"right";
                upImg.filename = @"right.png";
                upImg.mimeType = @"image/png";
                [weakSelf.uploadImgs addObject:upImg];
            }
        }
       
    };
    
}


-(void)Ear:(UIButton *)sender{
    NSInteger tag = sender.tag;
    switch (tag) {
        case 100:
        [self photoClickWithisLeft:YES];
        break;
        case 200:
         [self photoClickWithisLeft:NO];
        break;
        case 300:
        {
        if(self.uploadImgs.count>1){
            
            sender.enabled = NO;
            [EWKJRequest earAnalyzeWithUploadIcons:self.uploadImgs completed:^(id datas) {
                sender.enabled = YES;
                if(datas){
                    DebugLog(@"%@",datas);
                    AnalysisResultViewController *result = [[AnalysisResultViewController alloc]init];
                    [self.navigationController pushViewController:result animated:NO];
                }
            } error:^(NSError *error) {
                sender.enabled = YES;
                DebugLog(@"%@",error);
            }];
        }else{
            //请上传照片
            [self alertWithString:@"请上传左右耳照片"];
        }
        
        }
        break;
        
        default:
        break;
    }
}

    
    
    
#pragma mark - 照片
- (void)photoClickWithisLeft:(BOOL)isleft{
       _isLeft = isleft;
      if([UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera]){
          self.imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
          if([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]){
              UIView *overlayView = [self overLayViewWithImgName:@"wl" centerPoint:self.imgPicker.view.center isLeft:isleft];
              self.imgPicker.cameraOverlayView = overlayView;
              [self presentViewController:self.imgPicker animated:YES completion:nil];
          }
      }
}
    
    
#pragma mark -UIImagePickerControllerDelegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self.imgPicker dismissViewControllerAnimated:NO completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [self.imgPicker dismissViewControllerAnimated:NO completion:nil];
    UIImage *EditImg = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (_completePhoto) {
        _completePhoto(EditImg);
    }
    
        //保存图片到相册
    if(!_isAlum){
        [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
            [PHAssetChangeRequest creationRequestForAssetFromImage:EditImg];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            if (error) {
                DebugLog(@"保存相片错误");
            }
        }];
    }
    
}
    

    
-(UIImagePickerController *)imgPicker{
    if (!_imgPicker) {
        _imgPicker =  [[UIImagePickerController alloc]init];
        _imgPicker.delegate = self;
        _imgPicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        _imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        _imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        _imgPicker.showsCameraControls = NO;
        _imgPicker.cameraFlashMode = UIImagePickerControllerCameraFlashModeOff;
        
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
    NSArray *titles = @[@"旋转",@"拍照",@"相册"];
    for(int i = 0 ;i<3 ;i++){
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(15+i*(wh+magin), CGRectGetHeight(OverlayView.frame)-30-wh, wh, wh)];
        btn.backgroundColor = [UIColor cyanColor];
        [btn addTarget:self action:@selector(photoBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
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
    _isAlum = YES;
        switch (tag) {
            case 0:
            if(_currentBtnTag == 1){
                if([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]){
                    self.imgPicker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
                    self.imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
                    _currentBtnTag = 0;
                }
            }else{
                if([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]){
                     self.imgPicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
                    self.imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
                    _currentBtnTag = 1;
                }
            }
            break;
            case 1:
            [self.imgPicker takePicture];
            break;
            case 2:
              if([UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
                  self.imgPicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                  _isAlum = YES;
              }
            break;
            
            default:
            break;
        }
}
    
@end
