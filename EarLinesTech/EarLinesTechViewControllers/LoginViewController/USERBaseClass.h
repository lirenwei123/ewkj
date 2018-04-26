//
//  USERBaseClass.h
//
//  Created by   on 2018/4/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface USERBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString* imageUrl;
@property (nonatomic, assign) int userId;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, assign) int jobRights;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *account;
@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *expirationDt;


+(instancetype)user;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end