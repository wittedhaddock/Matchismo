//
//  PlayingCardDeck.m
//  Matchismo_again
//
//  Created by Local Administrator on 7/27/13.
//  Copyright (c) 2013 James Graham. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"
@interface PlayingCardDeck()
@property (strong, nonatomic, readwrite) NSMutableArray *matchHistory;
@end
@implementation PlayingCardDeck


- (NSMutableArray *)matchHistory{
    if(!_matchHistory){
        _matchHistory = [[NSMutableArray alloc] init];
        [_matchHistory addObject:@"No Match Results found"];
    }
    return _matchHistory;
}

- (id)init{
    if(self = [super init]){
        for(NSString *suit in [PlayingCard validSuits]){
            for (int i = 0; i < 13; i++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = i;
                [self addCard:card atTop:YES];
            }
        }
    }
    return self;
}

- (void)addMatchHistoryEntity:(NSString *)entity{
    [self.matchHistory addObject:entity];
}

- (void)clearHistory{
    self.matchHistory = nil;
}

@end
