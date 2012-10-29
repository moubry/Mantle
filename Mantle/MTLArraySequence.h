//
//  MTLArraySequence.h
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-10-29.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import "MTLSequence.h"

// Private class that adapts an array to the MTLSequence interface.
@interface MTLArraySequence : MTLSequence

// Returns a sequence for enumerating over the given array, starting from the
// given offset. The array will be copied to prevent mutation.
+ (MTLSequence *)sequenceWithArray:(NSArray *)array offset:(NSUInteger)offset;

@end
