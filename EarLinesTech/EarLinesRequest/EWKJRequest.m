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



@implementation EWKJRequest
    
+(void)getYZMWithPhonenmber:(NSString *)phonenmber completed:(successBlock)success error:(failureBlock)failure{
    NSString *url = [httpHead stringByAppendingString:@"api/user/validationcode/createaccount"];
    NSDictionary * dict =  [NSDictionary dictionaryWithObjectsAndKeys:phonenmber,@"PhoneNumber",nil];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithObject:dict forKey:Data];
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
    
    
@end
