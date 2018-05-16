//
//  MallHome.h
//
//  Created by  RWLi  on 2018/5/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MallHome : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *banners;
@property (nonatomic, strong) NSArray *products;
@property (nonatomic, strong) NSArray *agencies;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
