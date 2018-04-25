//
//  analyseResult.m
//
//  Created by  RWLi  on 2018/4/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "analyseResult.h"


NSString *const kanalyseResultDescription = @"Description";
NSString *const kanalyseResultIsEar = @"IsEar";
NSString *const kanalyseResultScore = @"Score";
NSString *const kanalyseResultSuggestionId = @"SuggestionId";


@interface analyseResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation analyseResult

@synthesize internalBaseClassDescription = _internalBaseClassDescription;
@synthesize isEar = _isEar;
@synthesize score = _score;
@synthesize suggestionId = _suggestionId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.internalBaseClassDescription = [self objectOrNilForKey:kanalyseResultDescription fromDictionary:dict];
            self.isEar = [[self objectOrNilForKey:kanalyseResultIsEar fromDictionary:dict] boolValue];
        self.score = [[self objectOrNilForKey:kanalyseResultScore fromDictionary:dict]intValue];
            self.suggestionId = [[self objectOrNilForKey:kanalyseResultSuggestionId fromDictionary:dict] intValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.internalBaseClassDescription forKey:kanalyseResultDescription];
    [mutableDict setValue:[NSNumber numberWithBool:self.isEar] forKey:kanalyseResultIsEar];
    [mutableDict setValue:[NSNumber numberWithDouble:self.score] forKey:kanalyseResultScore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.suggestionId] forKey:kanalyseResultSuggestionId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.internalBaseClassDescription = [aDecoder decodeObjectForKey:kanalyseResultDescription];
    self.isEar = [aDecoder decodeBoolForKey:kanalyseResultIsEar];
    self.score = [aDecoder decodeDoubleForKey:kanalyseResultScore];
    self.suggestionId = [aDecoder decodeDoubleForKey:kanalyseResultSuggestionId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_internalBaseClassDescription forKey:kanalyseResultDescription];
    [aCoder encodeBool:_isEar forKey:kanalyseResultIsEar];
    [aCoder encodeDouble:_score forKey:kanalyseResultScore];
    [aCoder encodeDouble:_suggestionId forKey:kanalyseResultSuggestionId];
}

- (id)copyWithZone:(NSZone *)zone {
    analyseResult *copy = [[analyseResult alloc] init];
    
    
    
    if (copy) {

        copy.internalBaseClassDescription = [self.internalBaseClassDescription copyWithZone:zone];
        copy.isEar = self.isEar;
        copy.score = self.score;
        copy.suggestionId = self.suggestionId;
    }
    
    return copy;
}


@end
