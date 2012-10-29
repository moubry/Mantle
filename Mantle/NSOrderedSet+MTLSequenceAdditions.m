//
//  NSOrderedSet+MTLSequenceAdditions.m
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-10-29.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import "NSOrderedSet+MTLSequenceAdditions.h"
#import "NSArray+MTLSequenceAdditions.h"

@implementation NSOrderedSet (MTLSequenceAdditions)

- (MTLSequence *)mtl_sequence {
	// TODO: First class support for ordered set sequences.
	return self.array.mtl_sequence;
}

@end
