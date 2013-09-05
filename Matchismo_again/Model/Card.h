//
//  Card.h
//  Matchismo_again
//
//  Created by Local Administrator on 7/27/13.
//  Copyright (c) 2013 James Graham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong, nonatomic) NSString *contents;
@property (nonatomic) BOOL faceUp;
@property (nonatomic) BOOL unplayable;
- (int)match:(NSArray *)otherCards;
@end
