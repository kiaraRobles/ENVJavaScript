//
//  NSMutableArray+JavaScriptArray.h
//  ENVJavaScript
//
//  Created by Kiara Robles on 1/1/16.
//  Copyright © 2016 kiaraRobles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (JavaScriptMutableArray)

// The pop() method removes the last element of an array
- (void)pop;

// The push() method adds new items to the end of an array
- (void)push:(id)firstObject,... NS_REQUIRES_NIL_TERMINATION;

// The unshift() method adds new items to the beginning of an array
- (void)unshift:(id)firstObject,... NS_REQUIRES_NIL_TERMINATION;

// The splice() method adds/removes items to/from an array
- (void)splice:(NSUInteger)index remove:(NSUInteger)remove arguments:(id)firstObject,... NS_REQUIRES_NIL_TERMINATION;

// The reverse() method reverses the order of the elements in an array
- (void)reverse;

// The fill() method fills all the elements in an array with a static value
- (void)fill:(id)object;

/* Optional. The index to start filling the array (default is 0) */
- (void)fill:(id)object start:(NSUInteger)start;

/* Optional. The index to stop filling the array (default is array.length) */
- (void)fill:(id)object start:(NSUInteger)start stop:(NSUInteger)stop;

/////////////////////////////////////////////////////////
/*              Array Return Methods                   */
/////////////////////////////////////////////////////////

// The copyWithin() method copies array elements within the array, to and from specified positions. It both changes the object itself, and returns it.
/* DIFF: In JavaScript the copyWithin() method is generic, and does not require that it be an Array object. Here is must be an Array object. */
- (NSArray *)copyWithin:(NSInteger)target start:(NSInteger)start;

/* Optional. The index position to stop copying elements from */
- (NSArray *)copyWithin:(NSInteger)target start:(NSInteger)start stop:(NSInteger)stop;

@end