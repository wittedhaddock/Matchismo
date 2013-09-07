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

@synthesize symbol = _symbol;

- (NSString *)symbol{
    if(!_symbol){
        NSMutableString *s = [[NSMutableString alloc] init];
        for(int i = 0; i < [self.dimension integerValue]; i++){
            [s stringByAppendingString:self.symbol];
        }
           _symbol = [NSString stringWithString:s];
        }
    return _symbol;
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


- (NSDictionary *)properties{
    return @{@"symbol": self.symbol, @"color": self.color, @"shading":self.shading};
}

- (void)applyPropertiesToButton:(UIButton *)button{
    [button setTitle:self.symbol forState:UIControlStateNormal|UIControlStateSelected];
    [button setTitleColor:self.color forState:UIControlStateSelected|UIControlStateNormal];
    [button setBackgroundColor:self.shading];
}

@end
