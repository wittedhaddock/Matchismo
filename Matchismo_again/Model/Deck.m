//
//  Deck.m
//  Matchismo_again
//
//  Created by Local Administrator on 7/27/13.
//  Copyright (c) 2013 James Graham. All rights reserved.
//

#import "Deck.h"
@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

- (NSMutableArray *)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)top{
    if (top) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (Card *)drawRandomCard{
    Card *randomCard = nil;
    if([self.cards count]){
        int randomIndex = arc4random() % [self.cards count];
        randomCard = (Card *)[self.cards objectAtIndex:randomIndex];
        [self.cards removeObjectAtIndex:randomIndex];
    }
    return randomCard;
}

@end
