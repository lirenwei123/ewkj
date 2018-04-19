//
//  QLHttpRequest.m
//  QCProject
//
//  Created by chao on 2017/5/14.
//  Copyright © 2017年 C. All rights reserved.
//

#import "HttpRequest.h"
#import "AFNetworking.h"



@implementation UploadParam



@end


@implementation HttpRequest


+(AFHTTPSessionManager *)shareManager{
    
    static AFHTTPSessionManager *manager ;
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
           manager = [AFHTTPSessionManager manager];
           manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            /**
             *  请求队列的最大并发数
             */
                //    manager.operationQueue.maxConcurrentOperationCount = 5;
            /**
             *  请求超时的时间
             */
                //    manager.requestSerializer.timeoutInterval = 5;
        });
        
    }
    return manager;
}


#pragma mark -- GET请求 --
+ (void)getWithURLString:(NSString *)URLString
              parameters:(NSMutableDictionary *)parameters
                 success:(void (^)(id))success
                 failure:(void (^)(NSError *))failure
{

    [[HttpRequest shareManager] GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark -- POST请求 --
+ (void)postWithURLString:(NSString *)URLString
               parameters:(NSMutableDictionary *)parameters
                  success:(void (^)(id))success
                  failure:(void (^)(NSError *))failure
{
    
    [[HttpRequest shareManager] POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark -- POST/GET网络请求 --
+ (void)requestWithURLString:(NSString *)URLString
                  parameters:(NSMutableDictionary *)parameters
                        type:(HttpRequestType)type
                     success:(void (^)(id))success
                     failure:(void (^)(NSError *))failure
{
    switch (type) {
        case HttpRequestTypeGet:
        {
            [[HttpRequest shareManager] GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break ;
        case HttpRequestTypePost:
        {
            [[HttpRequest shareManager] POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
//                    DebugLog(@"responseObject = %@, task = %@",responseObject,task);
//                    id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//                    DebugLog(@"obj = %@",obj);
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break ;
    }
    
}
    
#pragma mark -- 上传图片 --
+ (void)uploadWithURLString:(NSString *)URLString parameters:(NSMutableDictionary *)parameters
uploadParam:(UploadParam *)uploadParam success:(void (^)(id responseObject))success failure:(void (^)(NSError *))failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.f;
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
     {
        [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.filename mimeType:uploadParam.mimeType];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
//            DebugLog(@"responseObject = %@, task = %@",responseObject,task);
//            id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//            DebugLog(@"obj = %@",obj);
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)lirw_postWithURLString:(NSString *)URLString parameters:(NSMutableDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    [[HttpRequest shareManager] POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
             id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            success(obj);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
+(void)lrw_getWithURLString:(NSString *)URLString parameters:(NSMutableDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    [[HttpRequest shareManager] GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            success(obj);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
+(void)lrw_requestWithURLString:(NSString *)URLString parameters:(NSMutableDictionary *)parameters type:(HttpRequestType)type success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    switch (type) {
        case HttpRequestTypeGet:
        {
            [[HttpRequest shareManager] POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                    success(obj);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        case HttpRequestTypePost:
        {
            [[HttpRequest shareManager] POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                    success(obj);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        default:
            break;
    }
}

@end