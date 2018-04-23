//
//  EWKJRequest.m
//  myew
//
//  Created by apple   on 2018/4/16.
//  Copyright © 2018年 apple  . All rights reserved.
//

#import "EWKJRequest.h"
#import "HttpRequest.h"

static NSString * httpHead = @"http://em-webapi.zhiyunhulian.cn";
static NSString *Data = @"Data";



@implementation EWKJRequest
    
+(void)getYZMWithPhonenmber:(NSString *)phonenmber completed:(successBlock)success error:(failureBlock)failure{
    NSDictionary * dict =  [NSDictionary dictionaryWithObjectsAndKeys:phonenmber,@"PhoneNumber",nil];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithObject:dict forKey:Data];
    [HttpRequest lirw_postWithURLString:httpHead parameters:parameters success:^(id responseObject) {
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
