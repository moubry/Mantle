//
//  NSDictionary+MTLSequenceAdditions.h
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-10-29.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MTLSequence;

@interface NSDictionary (MTLSequenceAdditions)

// Creates and returns a sequence corresponding to the keys in the receiver.
//
// Mutating the receiver will not affect the sequence after it's been created.
@property (nonatomic, copy, readonly) MTLSequence *mtl_sequence;

// Creates and returns a sequence corresponding to the values in the receiver.
//
// Mutating the receiver will not affect the sequence after it's been created.
@property (nonatomic, copy, readonly) MTLSequence *mtl_valueSequence;

@end
