//
//  SetViewController.m
//  Matchismo_again
//
//  Created by James Graham on 9/5/13.
//  Copyright (c) 2013 James Graham. All rights reserved.
//

#import "SetViewController.h"
#import "SetCard.h"

@interface SetViewController ()
@property (strong, nonatomic) SetCardDeck *deck;
@property (strong, nonatomic) NSMutableArray *cardsOnScreen;
@end

@implementation SetViewController

-(SetCardDeck *)deck{
    if (!_deck) {
        _deck = [[SetCardDeck alloc] init];
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
    self.deck = nil;
    self.cardsOnScreen = nil;
    for(UIButton *button in self.cards){
        SetCard *aSetCard = (SetCard *)[self.deck drawRandomCard];
        [self.cardsOnScreen addObject:aSetCard];
        [aSetCard applyPropertiesToButton:button];
        NSLog(@"%@", aSetCard.properties);
        
    }
}



@end
