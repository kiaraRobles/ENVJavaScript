//
//  NSArray+JavaScriptArray.m
//  ENVJavaScript
//
//  Created by Kiara Robles on 1/1/16.
//  Copyright © 2016 kiaraRobles. All rights reserved.
//

#import "NSArray+JavaScriptArray.h"

@implementation NSArray (JavaScriptArray)

#pragma mark - Bool Return Methods

- (BOOL)isArray
{
    if([self isKindOfClass:[NSArray class]] || [self isMemberOfClass:[NSArray class]]){
        return YES;
    }
    
    return NO;
}

- (NSInteger)indexOf:(id)object;
{
    NSInteger returnInteger = [self indexOfObject:object];
    
    if (returnInteger !=  NSNotFound) {
        return returnInteger;
    }
    
    return -1;
}

- (NSInteger)indexOf:(id)object atIndex:(NSUInteger)index
{
    NSInteger objectCount = self.count - index;
    NSArray *sliced = [self subarrayWithRange:NSMakeRange(index, objectCount)];
    
    return [sliced indexOf:object];
}

- (NSInteger)lastIndexOf:(id)object
{
    NSArray *reversed = [[self reverseObjectEnumerator] allObjects];
    
    for (NSUInteger i = 0; i < reversed.count; i++) {
        id objectFromArray = [reversed objectAtIndex:i];
        if ([objectFromArray isEqual: object]) {
            return self.count - i - 1;
        }
    }
    
    return -1;
}

- (NSInteger)lastIndexOf:(id)object atIndex:(NSUInteger)index
{
    NSInteger objectCount = self.count - index;
    NSArray *sliced = [self subarrayWithRange:NSMakeRange(index, objectCount)];
    
    return [sliced lastIndexOf:object];
}

#pragma mark - String Return Methods

- (NSString *)join:(NSString *)string
{
    NSMutableString *mConcat = [NSMutableString new];
    
    if (string == nil) {
        string = @",";
    }
    
    if (self.count != 0) {
        for (NSUInteger i = 0; i < self.count; i++) {
            NSString *appendString = (NSString *)[self objectAtIndex:i];
            [mConcat appendString:appendString];
            [mConcat appendString:string];
        }
    }
    
    return [NSString stringWithString:mConcat];
}

- (NSString *)toString
{
    return [self join:nil];
}

#pragma mark - Array Return Methods

- (NSArray *)slice:(NSUInteger)start stop:(NSUInteger)stop
{
    NSInteger objectCount = stop - start;
    return [self subarrayWithRange:NSMakeRange(start, objectCount)];
}

- (NSArray *)concat:(NSArray *)array
{
    return [self arrayByAddingObjectsFromArray:array];
}

- (NSArray *)shift
{
    NSMutableArray *mShift = [NSMutableArray arrayWithArray:self];
    if (self.count != 0) {
        [mShift removeObjectAtIndex:0];
    }
    
    return mShift;
}

#pragma mark - Test/Block Methods

- (BOOL)every:(BOOL (^)(id element))predicate
{
    if (NULL != predicate) {
        for (NSUInteger i = 0; i < self.count; i++) {
            if (predicate(self[i]) == NO) {
                return NO;
            }
        }
    }
    
    return YES;
}

- (BOOL)some:(BOOL (^)(id element))predicate
{
    if (NULL != predicate) {
        for (NSUInteger i = 0; i < self.count; i++) {
            if (predicate(self[i]) == YES) {
                return YES;
            }
        }
    }
    
    return NO;
}

- (id)find:(BOOL (^)(id element))predicate
{
    if (NULL != predicate) {
        for (NSUInteger i = 0; i < self.count; i++) {
            if (predicate(self[i]) == YES) {
                return [self objectAtIndex:i];
            }
        }
    }
    
    return @"undefined";
}

- (NSInteger)findIndex:(BOOL (^)(id element))predicate
{
    if (NULL != predicate) {
        for (NSUInteger i = 0; i < self.count; i++) {
            if (predicate(self[i]) == YES) {
                return i;
            }
        }
    }
    
    return -1;
}

- (NSArray *)filter:(BOOL (^)(id element))predicate
{
    NSMutableArray *mFilter = [NSMutableArray new];
    
    if (NULL != predicate) {
        for (NSUInteger i = 0; i < self.count; i++) {
            if (predicate(self[i]) == YES) {
                id objectFromArray = [self objectAtIndex:i];
                [mFilter addObject:objectFromArray];
            }
        }
    }
    
    return [NSArray arrayWithArray:mFilter];
}

- (id)forEach:(NSInteger (^)(NSInteger element))function
{
    NSMutableArray *mForEach = [NSMutableArray arrayWithArray:self];
    
    [mForEach enumerateObjectsUsingBlock:^(NSNumber *obj, NSUInteger idx, BOOL *stop) {
        NSInteger objectFromArray = [obj integerValue];
        NSInteger result = function(objectFromArray);
        [mForEach addObject:[NSNumber numberWithInteger:result]];
    }];
    
    return [NSArray arrayWithArray:mForEach];
}

@end
