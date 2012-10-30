//
//  MTLDynamicSequence.m
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-10-29.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import "MTLDynamicSequence.h"

@interface MTLDynamicSequence ()

@property (nonatomic, copy, readonly) id (^headBlock)(void);
@property (nonatomic, copy, readonly) MTLSequence *(^tailBlock)(void);

@end

@implementation MTLDynamicSequence

#pragma mark Lifecycle

+ (MTLSequence *)sequenceWithHeadBlock:(id (^)(void))headBlock tailBlock:(MTLSequence *(^)(void))tailBlock {
	NSParameterAssert(headBlock != nil);

	MTLDynamicSequence *seq = [[self alloc] init];
	seq->_headBlock = [headBlock copy];
	seq->_tailBlock = [tailBlock copy];
	return seq;
}

+ (MTLSequence *)sequenceWithGeneratorBlock:(id (^)(id))generatorBlock startingValue:(id)value {
	NSParameterAssert(generatorBlock != nil);

	return [self sequenceWithHeadBlock:^{
		return value;
	} tailBlock:^ MTLSequence * {
		if (value == nil) return nil;
		return [self sequenceWithGeneratorBlock:generatorBlock startingValue:generatorBlock(value)];
	}];
}

#pragma mark MTLSequence

- (id)head {
	return self.headBlock();
}

- (MTLSequence *)tail {
	if (self.tailBlock == nil) return nil;
	return self.tailBlock();
}

@end
