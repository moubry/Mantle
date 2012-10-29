//
//  NSArray+MTLSequenceAdditions.h
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-10-29.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MTLSequence;

@interface NSArray (MTLSequenceAdditions)

// Creates and returns a sequence corresponding to the receiver.
//
// Mutating the receiver will not affect the sequence after it's been created.
@property (nonatomic, copy, readonly) MTLSequence *mtl_sequence;

@end
