//
//  SetViewController.h
//  Matchismo_again
//
//  Created by James Graham on 9/5/13.
//  Copyright (c) 2013 James Graham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCardDeck.h"

@interface SetViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cards;

@end

