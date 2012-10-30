//
//  MTLDynamicSequence.h
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-10-29.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import "MTLSequence.h"

// A sequence implemented dynamically using blocks.
@interface MTLDynamicSequence : MTLSequence

// Returns a sequence that lazily invokes the given blocks to provide head and
// tail. `headBlock` must not be nil.
+ (MTLSequence *)sequenceWithHeadBlock:(id (^)(void))headBlock tailBlock:(MTLSequence *(^)(void))tailBlock;

// Returns a sequence of `value`, `generatorBlock(value)`,
// `generatorBlock(generatorBlock(value))`, etc.
+ (MTLSequence *)sequenceWithGeneratorBlock:(id (^)(id))generatorBlock startingValue:(id)value;

@end
