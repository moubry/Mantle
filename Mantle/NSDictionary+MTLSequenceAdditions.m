//
//  NSDictionary+MTLSequenceAdditions.m
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-10-29.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import "NSDictionary+MTLSequenceAdditions.h"
#import "NSArray+MTLSequenceAdditions.h"

@implementation NSDictionary (MTLSequenceAdditions)

// TODO: Sequence of key/value pairs.

- (MTLSequence *)mtl_sequence {
	return self.allKeys.mtl_sequence;
}

- (MTLSequence *)mtl_valueSequence {
	return self.allValues.mtl_sequence;
}

@end
