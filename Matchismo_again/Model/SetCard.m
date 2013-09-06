//
//  SetCard.m
//  Matchismo_again
//
//  Created by James Graham on 9/5/13.
//  Copyright (c) 2013 James Graham. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

+ (NSArray *)allPossibleColors{
    return @[[UIColor greenColor], [UIColor purpleColor], [UIColor redColor]];
}

+ (NSArray *)allPossibleDimensions{
    return @[[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3]];
}

+ (NSArray *)allPossibleShadings{
    return [SetCard allPossibleColors];
}

+ (NSArray *)allPossibleSymbols{
    return @[@"▲",  @"●",  @"■"];
}

- (void)setSymbol:(NSString *)symbol{
    if ([[SetCard allPossibleSymbols] containsObject:symbol]) {
        _symbol = symbol;
    }
}

- (void)setDimension:(NSNumber *)dimension{
    if([[SetCard allPossibleDimensions] containsObject:dimension]){
        _dimension = dimension;
    }
}

- (void)setColor:(UIColor *)color{
    if([[SetCard allPossibleColors] containsObject:color]) {
        _color = color;
    }
}

- (void)setShading:(UIColor *)shading{
    if([[SetCard allPossibleShadings] containsObject:shading]) {
        _shading = shading;
    }
}

- (NSString *)contents{
    return [NSString stringWithFormat:@"%@%@%@%@",self.symbol, self.dimension, self.color, self.shading ];
    
}

- (NSAttributedString *)properties{
    if (!_properties) {
        _properties = [[NSAttributedString alloc] initWithString:[self contents]];
    }
    return _properties;
}

@end
