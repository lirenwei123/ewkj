//
//  EWKJBaseViewController.h
//  ERWENKEJI
//
//  Created by  RWLi on 2018/4/10.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EWKJBtn.h"
#import "EWKJRequest.h"
//#import "MBProgressHUD.h"
#import "SVProgressHUD.h"
#import "USERBaseClass.h"




@interface EWKJBaseViewController : UIViewController
@property(nonatomic ,assign)BOOL isNeedLogin;



-(void)addUI;
-(void)addReturn;
-(void)alertWithString:(NSString *)str;
@end
