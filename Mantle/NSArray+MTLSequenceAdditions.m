//
//  NSArray+MTLSequenceAdditions.m
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-10-29.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import "NSArray+MTLSequenceAdditions.h"
#import "MTLArraySequence.h"

@implementation NSArray (MTLSequenceAdditions)

- (MTLSequence *)mtl_sequence {
	return [MTLArraySequence sequenceWithArray:self offset:0];
}

@end
