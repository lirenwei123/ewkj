//
//  EWKJRequest.m
//  myew
//
//  Created by apple   on 2018/4/16.
//  Copyright © 2018年 apple  . All rights reserved.
//

#import "EWKJRequest.h"


static NSString * httpHead = @"http://em-webapi.zhiyunhulian.cn/";
static NSString *Data = @"Data";

//user api
static NSString *login = @"api/user/login";//用户登录
static NSString *userinfo =@"api/user/userinfo";//获取用户信息
static NSString *createaccount = @"api/user/validationcode/createaccount";//发送创建账号验证码
static NSString *create = @"api/user/account/create";//创建账号

static NSString *refresh = @"api/user/token/refresh";//Token过期后通过这个接口刷新Token
static NSString *Resetpaymentpassword = @"api/user/validationcode/Resetpaymentpassword";//设置支付密码-发送验证码
static NSString *setpayment = @"api/user/password/setpayment";//设置支付密码

static NSString *resetlogin = @"api/user/password/resetlogin";//重置登录密码
static NSString *forgetpassword = @"api/user/validationcode/forgetpassword";//发送重置登录密码验证码
static NSString *changelogin = @"api/user/password/changelogin";//修改登录密码

static NSString *login = @"api/user/file/upload";//用户登录
static NSString *login = @"api/user/login";//用户登录
static NSString *login = @"api/user/login";//用户登录
static NSString *login = @"api/user/login";//用户登录
static NSString *login = @"api/user/login";//用户登录
static NSString *login = @"api/user/login";//用户登录
static NSString *login = @"api/user/login";//用户登录
static NSString *login = @"api/user/login";//用户登录
static NSString *login = @"api/user/login";//用户登录
static NSString *login = @"api/user/login";//用户登录
static NSString *login = @"api/user/login";//用户登录
static NSString *login = @"api/user/login";//用户登录
static NSString *login = @"api/user/login";//用户登录
static NSString *login = @"api/user/login";//用户登录





@implementation EWKJRequest


+ (NSMutableDictionary*)creatRequestDic:(NSDictionary *)dic{
    NSMutableDictionary *mudic = [NSMutableDictionary dictionaryWithObject:dic forKey:Data];
    return mudic;
}

+(void)getYZMType:(YZMTYPE)type WithPhonenmber:(NSString *)phonenmber completed:(successBlock)success error:(failureBlock)failure{

    NSString *url = nil;
    if (type == YZMTYPE_regist) {
        url =  [httpHead stringByAppendingString:@"api/user/validationcode/createaccount"];
    }else if(type == YZMTYPE_forget){
        url =  [httpHead stringByAppendingString:@"api/user/validationcode/forgetpassword"];
    }
   
    NSDictionary * dict =  [NSDictionary dictionaryWithObjectsAndKeys:phonenmber,@"PhoneNumber",nil];
    NSMutableDictionary *parameters = [self creatRequestDic:dict];
    [HttpRequest lirw_postWithURLString:url parameters:parameters success:^(id responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];
    
}
   
    
    
+(void)earAnalyzeWithUploadIcons:(NSArray<UploadParam *> *)uploadIcons completed:(successBlock)success error:(failureBlock)failure{
        
        NSString *url = [httpHead stringByAppendingString:@"api/earprints/analyze"];
        [HttpRequest lirw_uploadWithURLString:url parameters:nil uploadParams:uploadIcons success:^(id responseObject) {
            if(success){
                success(responseObject);
            }
        } failure:^(NSError *error) {
            if(failure){
                failure(error);
            }
        }];
    }


+(void)creatAccountWithUserDic:(NSDictionary *)userDic completed:(successBlock)success error:(failureBlock)failure{
    NSString *url = [httpHead stringByAppendingString:@"api/user/account/create"];
    NSMutableDictionary *parameters = [self creatRequestDic:userDic];
    [HttpRequest lirw_postWithURLString:url parameters:parameters success:^(id responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}


+(void)rssetAccountWithUserDic:(NSDictionary *)userDic completed:(successBlock)success error:(failureBlock)failure{
    NSString *url = [httpHead stringByAppendingString:@"api/user/account/create"];
    NSMutableDictionary *parameters = [self creatRequestDic:userDic];
    [HttpRequest lirw_postWithURLString:url parameters:parameters success:^(id responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}
@end
