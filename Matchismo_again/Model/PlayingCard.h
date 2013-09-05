//
//  PlayingCard.h
//  Matchismo_again
//
//  Created by Local Administrator on 7/27/13.
//  Copyright (c) 2013 James Graham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card


@property (strong, nonatomic) NSString *suit;
@property (nonatomic) int rank;
@property (strong, nonatomic) NSString *matchDescription;
@property (nonatomic) BOOL twoOrThree;
- (int)match:(NSArray *)otherCards inclusive:(BOOL)inc;
+ (NSArray *)validSuits;
+ (NSArray *)rankStrings;
- (void)addMatchDescriptionTo:(NSMutableArray *)set;
@end
