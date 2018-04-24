//
//  EWKJRequest.h
//  myew
//
//  Created by apple   on 2018/4/16.
//  Copyright © 2018年 apple  . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequest.h"

typedef void(^successBlock)(id datas);
typedef void(^failureBlock)(NSError *error);

@interface EWKJRequest : NSObject
   //获取验证码
+(void)getYZMWithPhonenmber:(NSString *)phonenmber completed:(successBlock)success error:(failureBlock)failure;
    
    //耳纹识别
    +(void)earAnalyzeWithUploadIcons:(NSArray <UploadParam*>*)uploadIcons completed:(successBlock)success error:(failureBlock)failure;
@end
