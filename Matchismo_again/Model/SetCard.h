//
//  SetCard.h
//  Matchismo_again
//
//  Created by James Graham on 9/5/13.
//  Copyright (c) 2013 James Graham. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card
@property (strong, nonatomic) NSAttributedString *properties;
@property (strong, nonatomic) NSString *symbol;
@property (nonatomic, strong) NSNumber *dimension;
@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) UIColor *shading;
- (void)applyPropertiesToButton:(UIButton *)button;
+ (NSArray *)allPossibleDimensions;
+ (NSArray *)allPossibleSymbols;
+ (NSArray *)allPossibleShadings;
+ (NSArray *)allPossibleColors;

@end
