//
//  MTLSequence.h
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-10-29.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import <Foundation/Foundation.h>

// Represents an immutable, lazy sequence of values. Like Cocoa collections,
// sequences cannot contain nil.
//
// Implemented as a class cluster.
@interface MTLSequence : NSObject <NSCopying, NSFastEnumeration>

// The first object in the sequence, or nil if the sequence is empty.
//
// Subclasses must provide an implementation of this method.
@property (nonatomic, strong, readonly) id head;

// All but the first object in the sequence, or nil if the sequence is empty.
//
// Subclasses must provide an implementation of this method.
@property (nonatomic, strong, readonly) MTLSequence *tail;

// Evaluates the full sequence to produce an equivalently-sized array.
@property (nonatomic, copy, readonly) NSArray *array;

// Returns an empty sequence.
+ (MTLSequence *)emptySequence;

// Returns all but the first `count` objects in the sequence. If `count` exceeds
// the number of items in the sequence, nil is returned.
- (MTLSequence *)drop:(NSUInteger)count;

@end
