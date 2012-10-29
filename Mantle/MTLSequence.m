//
//  MTLSequence.m
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-10-29.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import "MTLSequence.h"
#import "MTLEmptySequence.h"

@implementation MTLSequence

#pragma mark Lifecycle

+ (MTLSequence *)emptySequence {
	return MTLEmptySequence.emptySequence;
}

#pragma mark Class cluster primitives

- (id)head {
	NSAssert(NO, @"%s must be overridden by subclasses", __func__);
	return nil;
}

- (MTLSequence *)tail {
	NSAssert(NO, @"%s must be overridden by subclasses", __func__);
	return nil;
}

#pragma mark Extended methods

- (NSArray *)array {
	NSMutableArray *array = [NSMutableArray array];
	for (id obj in self) {
		[array addObject:obj];
	}

	return [array copy];
}

- (MTLSequence *)drop:(NSUInteger)count {
	MTLSequence *seq = self;
	for (NSUInteger i = 0; i < count; i++) {
		seq = seq.tail;
	}

	return seq;
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
	return self;
}

#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id *)stackbuf count:(NSUInteger)len {
	if (state->state == 0) {
		// Since a sequence doesn't mutate, this just needs to be set to
		// something non-NULL.
		state->mutationsPtr = state->extra;
	}

	state->itemsPtr = stackbuf;

	MTLSequence *seq = self;
	NSUInteger enumeratedCount = 0;

	while (enumeratedCount < len) {
		// Because the objects in a sequence may be generated lazily, we want to
		// prevent them from being released until the enumerator's used them.
		__autoreleasing id obj = seq.head;
		if (obj == nil) break;

		stackbuf[enumeratedCount++] = obj;
		seq = seq.tail;
	}

	return enumeratedCount;
}

#pragma mark NSObject

- (NSUInteger)hash {
	return [self.head hash];
}

- (BOOL)isEqual:(MTLSequence *)seq {
	if (self == seq) return YES;
	if (![seq isKindOfClass:MTLSequence.class]) return NO;

	for (id selfObj in self) {
		id seqObj = seq.head;

		// Handles the nil case too.
		if (![seqObj isEqual:selfObj]) return NO;
	}

	// self is now depleted -- the argument should be too.
	return (seq.head == nil);
}

@end
