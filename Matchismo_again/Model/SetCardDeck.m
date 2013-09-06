//
//  SetCardDeck.m
//  Matchismo_again
//
//  Created by James Graham on 9/6/13.
//  Copyright (c) 2013 James Graham. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"
@implementation SetCardDeck


- (id)init{
    if(self = [super init]){
        for(UIColor *color in [SetCard allPossibleColors]){
            for(UIColor *shading in [SetCard allPossibleShadings]){
                for(NSNumber *dimension in [SetCard allPossibleDimensions]){
                    for(NSString *symbol in [SetCard allPossibleSymbols]){

                        SetCard *card = [[SetCard alloc] init];
                        card.color = color;
                        card.shading = shading;
                        card.symbol = symbol;
                        card.dimension = dimension;
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }    return self;
}


@end
