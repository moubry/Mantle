//
//  MTLArraySequence.m
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-10-29.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import "MTLArraySequence.h"

@interface MTLArraySequence ()

// Redeclared from the superclass and marked deprecated to prevent using `array`
// where `backingArray` is intended.
@property (nonatomic, copy, readonly) NSArray *array __attribute__((deprecated));

// The array being sequenced.
@property (nonatomic, copy, readonly) NSArray *backingArray;

// The index in the array from which the sequence starts.
@property (nonatomic, assign, readonly) NSUInteger offset;

@end

@implementation MTLArraySequence

#pragma mark Lifecycle

+ (MTLSequence *)sequenceWithArray:(NSArray *)array offset:(NSUInteger)offset {
	NSParameterAssert(offset <= array.count);

	if (offset == array.count) return self.emptySequence;

	MTLArraySequence *seq = [[self alloc] init];
	seq->_backingArray = [array copy];
	seq->_offset = offset;
	return seq;
}

#pragma mark MTLSequence

- (id)head {
	return [self.backingArray objectAtIndex:self.offset];
}

- (MTLSequence *)tail {
	return [self.class sequenceWithArray:self.backingArray offset:self.offset + 1];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
- (NSArray *)array {
	return [self.backingArray subarrayWithRange:NSMakeRange(self.offset, self.backingArray.count - self.offset)];
}
#pragma clang diagnostic pop

#pragma mark NSObject

- (NSString *)description {
	return [NSString stringWithFormat:@"<%@: %p>{ array = %@ }", self.class, self, self.backingArray];
}

@end
