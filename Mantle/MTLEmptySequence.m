//
//  MTLEmptySequence.m
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-10-29.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import "MTLEmptySequence.h"

@implementation MTLEmptySequence

#pragma mark Lifecycle

+ (MTLSequence *)emptySequence {
	static id singleton;
	static dispatch_once_t pred;

	dispatch_once(&pred, ^{
		singleton = [[self alloc] init];
	});

	return singleton;
}

#pragma mark MTLSequence

- (id)head {
	return nil;
}

- (MTLSequence *)tail {
	return nil;
}

#pragma mark NSObject

- (NSUInteger)hash {
	// This hash isn't ideal, but it's better than -[MTLSequence hash], which
	// would just be zero because we have no head.
	return (NSUInteger)(__bridge void *)self;
}

- (BOOL)isEqual:(MTLSequence *)seq {
	return (self == seq);
}

@end
