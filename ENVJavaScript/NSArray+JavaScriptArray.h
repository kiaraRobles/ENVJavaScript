//
//  NSArray+JavaScriptArray.h
//  ENVJavaScript
//
//  Created by Kiara Robles on 1/1/16.
//  Copyright © 2016 kiaraRobles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (JavaScriptArray)

/////////////////////////////////////////////////////////
/*              Bool Return Methods                  */
/////////////////////////////////////////////////////////

// The isArray() method determines whether an object is an array
- (BOOL)isArray;

/////////////////////////////////////////////////////////
/*              Integer Return Methods                 */
/////////////////////////////////////////////////////////

// The indexOf() method searches the array for the specified item, and returns its position
- (NSInteger)indexOf:(id)object;

/* Optional. Where to start the search. Negative values will start at the given position counting from the end, and search to the end.  */
- (NSInteger)indexOf:(id)object atIndex:(NSUInteger)index;

// The indexOf() method searches the array for the specified item, and returns its position.
- (NSInteger)lastIndexOf:(id)object;

/* Optional. Where to start the search. Negative values will start at the given position counting from the end, and search to the end  */
- (NSInteger)lastIndexOf:(id)object atIndex:(NSUInteger)index;

/////////////////////////////////////////////////////////
/*              String Return Methods                  */
/////////////////////////////////////////////////////////

// The join() method joins the elements of an array into a string, and returns the string
- (NSString *)join:(NSString *)string;

// The toString() method converts an array into a String and returns the result.
/* DIFF: In JavaScript the toString() method converts the object from an array to a string which is not possible in Objective-C.  */
/* The toString method here implemented here returns a string and leaves the original array unchanged  */
- (NSString *)toString;

/////////////////////////////////////////////////////////
/*              Array Return Methods                   */
/////////////////////////////////////////////////////////

// The slice() method returns the selected elements in an array, as a new array object
- (NSArray *)slice:(NSUInteger)start stop:(NSUInteger)stop;

// The concat() method join two or more arrays without changing the existing arrays
- (NSArray *)concat:(NSArray *)array;

/////////////////////////////////////////////////////////
/*               Test/Block Methods                    */
/////////////////////////////////////////////////////////

/*   NOT COMPLETE, Optional start indexs not provided  */

// The every() method checks if all elements in an array pass a test (provided as a function).
- (BOOL)every:(BOOL (^)(id element))predicate;

// The findIndex() method returns the index of the first element in an array that pass a test (provided as a function)
- (BOOL)some:(BOOL (^)(id element))predicate;

// The find() method executes the function once for each element present in the array
- (id)find:(BOOL (^)(id element))predicate;

// The findIndex() method returns the index of the first element in an array that pass a test (provided as a function)
- (NSInteger)findIndex:(BOOL (^)(id element))predicate;

// The filter() method creates an array filled with all array elements that pass a test
- (NSArray *)filter:(BOOL (^)(id element))predicate;

// The forEach() method calls a provided function once for each element in an array, in order
/* Only workd for NSInteger block inputs */
- (id)forEach:(NSInteger (^)(NSInteger element))function;

@end
