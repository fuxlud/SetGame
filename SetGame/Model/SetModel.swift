//
//  SetModel.swift
//  SetGame
//
//  Created by Admin on 14/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

class SetGame {
    
    let allCards = CardsFactory.createCards()
    var chosenCards = [Card]()
    var presentedCards = [Card]()
    
    init() {
        restartGame()
    }
    
    func choose(card: Card) {
        card.choose()
        chosenCards.append(card)
    }
    
    func restartGame() {
        
        turnDownAllChosenCards()
        chooseNewCardToPresent()
    }
    
    func turnDownAllChosenCards() {
        for card in chosenCards {
            card.turnDown()
            chosenCards = chosenCards.filter { $0.id != card.id }
        }
    }
    
    func chooseNewCardToPresent() {
        
        presentedCards = [Card]()
        
        while presentedCards.count != 12 {
            if let randomCard = allCards.randomElement(),
                !presentedCards.contains(where: { randomCard.id == $0.id }) {
                    presentedCards.append(randomCard)
            }
        }
    }
}
