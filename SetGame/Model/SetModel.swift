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
        resetGame()
    }
    
    func turn(_ card: Card) {
        
        if chosenCards.contains(where: { card.id == $0.id }) {
            unchoose(card)
        } else {
            choose(card)
        }
    }
    
    func choose(_ card: Card) {
        if chosenCards.count == 3 {
            turnDownAllChosenCards()
        }
        
        card.turnUp()
        chosenCards.append(card)
    }
    
    func unchoose(_ card: Card) {
        card.turnDown()
        chosenCards = chosenCards.filter { $0.id != card.id }
    }
    
    func resetGame() {
        
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
