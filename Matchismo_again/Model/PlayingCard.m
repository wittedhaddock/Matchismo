//
//  PlayingCard.m
//  Matchismo_again
//
//  Created by Local Administrator on 7/27/13.
//  Copyright (c) 2013 James Graham. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()
@end

@implementation PlayingCard

- (NSString *)matchDescription{
    if(!_matchDescription){
        _matchDescription = [[NSString alloc] init];
    }
    return _matchDescription;
}

- (NSString *)contents{
    return [[[PlayingCard rankStrings] objectAtIndex:self.rank] stringByAppendingString:self.suit];
}


+ (NSArray *)rankStrings{
    return @[@"A", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}
+ (NSArray *)validSuits{
    return @[@"♥", @"♦", @"♠", @"♣"];
}
- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit] ) {
        _suit = suit;
    }
}

- (void)setRank:(int)rank{
    if (rank <= [[PlayingCard rankStrings]count]-1) {
        _rank = rank;
    }
}

- (void)addMatchDescriptionTo:(NSMutableArray *)set{
    [set addObject:self.matchDescription];
}

#define SUIT_MATCH 5
#define RANK_MATCH 12
#define MISMATCH_PENALTY -3

- (int)match:(NSArray *)otherCards inclusive:(BOOL)inc{
    int score = 0;
    if(inc && self.twoOrThree){
        PlayingCard *pc1 = otherCards[0];
        PlayingCard *pc2 = otherCards[1];
        if ([pc1.suit isEqualToString:pc2.suit]) {
            score = SUIT_MATCH;
            self.matchDescription = [NSString stringWithFormat:@"Suit match: %@ with %@ for %i points", pc1.contents, pc2.contents, score];
        } else if(pc1.rank == pc2.rank){
            score = RANK_MATCH;
            self.matchDescription = [NSString stringWithFormat:@"Rank match: %@ with %@ for %i points", pc1.contents, pc2.contents, score];
        } else {
            score = MISMATCH_PENALTY;
            self.matchDescription = [NSString stringWithFormat:@"%@ does not match %@. %i point deduction", pc1.contents, pc2.contents, ABS(score)];
        }
    } else if(inc && !self.twoOrThree){
        PlayingCard *pc1 = otherCards[0];
        PlayingCard *pc2 = otherCards[1];
        PlayingCard *pc3 = otherCards[2];
        
        if([pc1.suit isEqualToString:pc3.suit] && [pc1.suit isEqualToString:pc2.suit]){
            score = SUIT_MATCH*3;
            self.matchDescription = [NSString stringWithFormat:@"Suit match: %@ & %@ & %@ for %i points", pc1.contents, pc2.contents, pc2.contents, score];
        } else if(pc1.rank == pc2.rank && pc1.rank == pc3.rank){
            score = RANK_MATCH*3;
            self.matchDescription = [NSString stringWithFormat:@"Rank match: %@ & %@ & %@ for %i points", pc1.contents, pc2.contents, pc3.contents, score];
        } else{
            score = MISMATCH_PENALTY;
            self.matchDescription = [NSString stringWithFormat:@"Mismatch %@ & %@ & %@. %i point deduction", pc1.contents, pc2.contents, pc3.contents, ABS(score)];
        }
    }
    return score;
}
@end