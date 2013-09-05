//
//  PlayingCardDeck.h
//  Matchismo_again
//
//  Created by Local Administrator on 7/27/13.
//  Copyright (c) 2013 James Graham. All rights reserved.
//

#import "Deck.h"

@interface PlayingCardDeck : Deck
@property (strong, nonatomic, readonly) NSMutableArray *matchHistory;

- (void)addMatchHistoryEntity:(NSString *)entity;
- (void)clearHistory;

@end
