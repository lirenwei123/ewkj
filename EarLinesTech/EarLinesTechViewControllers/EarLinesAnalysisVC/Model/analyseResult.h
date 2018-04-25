//
//  analyseResult.h
//
//  Created by  RWLi  on 2018/4/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface analyseResult : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *internalBaseClassDescription;
@property (nonatomic, assign) BOOL isEar;
@property (nonatomic, assign) int score;
@property (nonatomic, assign) int suggestionId;




+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
