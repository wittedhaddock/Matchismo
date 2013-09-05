//
//  SetViewController.m
//  Matchismo_again
//
//  Created by James Graham on 9/5/13.
//  Copyright (c) 2013 James Graham. All rights reserved.
//

#import "SetViewController.h"
#import "PlayingCard.h"
@interface SetViewController ()
@property (strong, nonatomic) PlayingCardDeck *deck;
@property (strong, nonatomic) NSMutableArray *cardsOnScreen;
@end

@implementation SetViewController

-(PlayingCardDeck *)deck{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}
-(NSMutableArray *)cardsOnScreen{
    if(!_cardsOnScreen){
        _cardsOnScreen = [[NSMutableArray alloc]init];
    }
    return _cardsOnScreen;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
}
- (IBAction)chooseCard:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
}
- (IBAction)deal:(UIButton *)sender {
    self.cardsOnScreen = nil;
    self.deck = nil;
    for(UIButton *button in self.cards){
        PlayingCard *randomCard = (PlayingCard *)[self.deck drawRandomCard];
        if(![self.cardsOnScreen containsObject:randomCard]){
            [self.cardsOnScreen addObject:randomCard];
            NSString *title = randomCard.contents;
            [button setTitle:title forState:UIControlStateSelected];
        }
    }
}



@end
