//
//  NSString+MTLSequenceAdditions.m
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-10-29.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import "NSString+MTLSequenceAdditions.h"
#import "MTLStringSequence.h"

@implementation NSString (MTLSequenceAdditions)

- (MTLSequence *)mtl_sequence {
	return [MTLStringSequence sequenceWithString:self offset:0];
}

@end
