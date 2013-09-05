//
//  Deck.h
//  Matchismo_again
//
//  Created by Local Administrator on 7/27/13.
//  Copyright (c) 2013 James Graham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)top;

- (Card *)drawRandomCard;

@end
