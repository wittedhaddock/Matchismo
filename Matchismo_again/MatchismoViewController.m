//
//  MatchismoViewController.m
//  Matchismo_again
//
//  Created by Local Administrator on 7/27/13.
//  Copyright (c) 2013 James Graham. All rights reserved.
//

#import "MatchismoViewController.h"
#import "PlayingCardDeck.h"
#import "Card.h"
#import "PlayingCard.h"

@interface MatchismoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipCounter;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) PlayingCardDeck *deck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cards;
@property (strong, nonatomic) NSMutableArray *cardsOnScreen;
@property (strong, nonatomic) NSMutableArray *flippedUpCards;
@property (nonatomic) int score;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *dealButton;
@property (weak, nonatomic) IBOutlet UILabel *matchDescription;
@property (nonatomic) BOOL twoOrThree;
@property (weak, nonatomic) IBOutlet UISwitch *gameMode;
@property (weak, nonatomic) IBOutlet UISlider *timeMachineSlider;
@end

@implementation MatchismoViewController

- (NSMutableArray *)flippedUpCards{
    if (!_flippedUpCards) {
        _flippedUpCards = [[NSMutableArray alloc] init];
    }
    return _flippedUpCards;
}

- (NSMutableArray *)cardsOnScreen{
    if (!_cardsOnScreen){
        _cardsOnScreen = [[NSMutableArray alloc] init];
    }
    return _cardsOnScreen;
}

- (PlayingCardDeck *)deck{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}



- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipCounter.text = [NSString stringWithFormat:@"Flips: %d", flipCount];
}


- (IBAction)flipCard:(UIButton *)sender {
    self.gameMode.enabled = NO;
    self.gameMode.alpha = 0.3;
    self.dealButton.alpha = 1.0;
    self.dealButton.enabled = YES;
    sender.selected = !sender.selected;
    int scoreThisTurn = 0;
    PlayingCard *currentCard = [self.cardsOnScreen objectAtIndex:[self.cards indexOfObject:sender]];
    currentCard.twoOrThree = self.twoOrThree;
    if (sender.selected) {
        self.flipCount++;
        self.flipCounter.text = [NSString stringWithFormat:@"Flips: %i", self.flipCount];
        [self.flippedUpCards addObject:currentCard];
        int numCards = self.twoOrThree ? 2 : 3;
        if ([self.flippedUpCards count] == numCards) {
            scoreThisTurn = [currentCard match:self.flippedUpCards inclusive:YES];
            [self.deck addMatchHistoryEntity:currentCard.matchDescription];
            self.timeMachineSlider.maximumValue++;
            self.timeMachineSlider.value = self.timeMachineSlider.maximumValue;
            NSLog(@"Length: %i value: %f", self.deck.matchHistory.count, self.timeMachineSlider.value);
            self.matchDescription.alpha = 1.0;
            self.matchDescription.text = currentCard.matchDescription;
            self.score += scoreThisTurn;
            self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", self.score];
            for(Card *card in self.flippedUpCards){
                UIButton *button = [self.cards objectAtIndex:[self.cardsOnScreen indexOfObject:card]];
                if (scoreThisTurn > 0) {
                    button.alpha = 0.3;
                    button.enabled = NO;
                    continue;
                }
                button.selected = !button.selected;
            }
            [self.flippedUpCards removeAllObjects];
        }
    } else {
        [self.flippedUpCards removeObject:currentCard];
    }
    }

- (IBAction)gameMode:(UISwitch *)sender forEvent:(UIEvent *)event {
    self.twoOrThree = !sender.on;
}

- (IBAction)timeMachine:(UISlider *)sender {
    float value = floor(sender.value);
    self.matchDescription.text = [self.deck.matchHistory objectAtIndex:(NSUInteger)(value > 1 ? value : value+1)];
    if((int)value + 1 != [self.deck.matchHistory count]){
        self.matchDescription.alpha = 0.5;
    }

}




- (IBAction)deal:(UIButton *)sender {
    for(UIButton *button in self.cards){
        button.enabled = YES;
        button.alpha = 1.0;
        if(button.selected){
            button.selected = NO;
        }
    }
    self.flippedUpCards = nil;
    self.deck = nil;
    self.cardsOnScreen = nil;
    self.flipCount = 0;
    self.score = 0;
    self.matchDescription.text = nil;
    for(UIButton *button in self.cards){
        Card *card = [self.deck drawRandomCard];
        [self.cardsOnScreen addObject:card];
        NSString *title = card.contents;
        [button setTitle:title forState:UIControlStateSelected];
        [button setTitle:title forState:UIControlStateDisabled|UIControlStateSelected];
    }
    sender.enabled = NO;
    sender.alpha = 0.3;
    self.gameMode.enabled = YES;
    self.gameMode.alpha = 1.0;
}

- (void)viewDidAppear:(BOOL)animated{
    [self deal:nil];
    self.twoOrThree = YES;
}

@end
