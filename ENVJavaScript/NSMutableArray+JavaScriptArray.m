//
//  NSMutableArray+JavaScriptArray.m
//  ENVJavaScript
//
//  Created by Kiara Robles on 1/1/16.
//  Copyright © 2016 kiaraRobles. All rights reserved.
//

#import "NSMutableArray+JavaScriptArray.h"

@implementation NSMutableArray (JavaScriptMutableArray)

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

- (void)pop
{
    [self removeLastObject];
}

- (void)push:(id)firstObject,... NS_REQUIRES_NIL_TERMINATION
{
    va_list objs;
    va_start(objs, firstObject);
    id nextObj = firstObject;
    while( nextObj ){
        [self addObject:nextObj];
        nextObj = va_arg(objs, id);
    }
    va_end(objs);
}

- (void)unshift:(id)firstObject,... NS_REQUIRES_NIL_TERMINATION
{
    NSUInteger addIndex = 0;
    
    va_list objs;
    va_start(objs, firstObject);
    id nextObj = firstObject;
    while( nextObj ){
        [self insertObject:nextObj atIndex:0];
        addIndex = addIndex + 1;
        nextObj = va_arg(objs, id);
    }
    va_end(objs);
}

- (void)splice:(NSUInteger)index remove:(NSUInteger)remove arguments:(id)firstObject,... NS_REQUIRES_NIL_TERMINATION
{
    if (remove != 0) {
        NSUInteger removeIndex = index;
        
        for (NSUInteger i = 0; i < remove; i++) {
            [self removeObjectAtIndex:index];
            removeIndex = removeIndex + 1;
        }
    }
    
    // Insertion index starts at given splice point
    NSUInteger addIndex = index;
    // Initialize the va_list
    va_list objs;
    va_start(objs, firstObject);
    // Start at the beginning
    id nextObj = firstObject;
    // Test for sentinel nil
    while( nextObj ){
        [self insertObject:nextObj atIndex:addIndex];
        // Update insertion point
        addIndex++;
        // Get next argument
        nextObj = va_arg(objs, id);
    }
    // Signal completion of list
    va_end(objs);
}

- (void)reverse
{
    [[self reverseObjectEnumerator] allObjects];
}

- (void)fill:(id)object
{
    [self fill:object start:0 stop:self.count];
}

- (void)fill:(id)object start:(NSUInteger)start
{
    [self fill:object start:start stop:self.count];
}

- (void)fill:(id)object start:(NSUInteger)start stop:(NSUInteger)stop
{
    for (NSUInteger i = start; i < stop; i++) {
        [self replaceObjectAtIndex:i withObject:object];
    }
}

#pragma mark - Array Return Methods

- (NSArray *)copyWithin:(NSInteger)target start:(NSInteger)start
{
    return [self copyWithin:target start:start stop:self.count];
}

- (NSArray *)copyWithin:(NSInteger)target start:(NSInteger)start stop:(NSInteger)stop
{
    NSInteger objectCount = stop - start;
    NSArray *slicedArray = [self subarrayWithRange:NSMakeRange(start, objectCount)];
    
    NSInteger y = 0;
    for (NSInteger i = target ; i < self.count; i++) {
        
        [self replaceObjectAtIndex:i withObject:slicedArray[y]];
        y = y + 1;
    }
    
    return self;
}


@end
