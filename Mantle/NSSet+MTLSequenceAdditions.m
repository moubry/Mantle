//
//  NSSet+MTLSequenceAdditions.m
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-10-29.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import "NSSet+MTLSequenceAdditions.h"
#import "NSArray+MTLSequenceAdditions.h"

@implementation NSSet (MTLSequenceAdditions)

- (MTLSequence *)mtl_sequence {
	// TODO: First class support for set sequences.
	return self.allObjects.mtl_sequence;
}

@end
