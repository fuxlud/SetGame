//
//  SetModel.swift
//  SetGame
//
//  Created by Admin on 14/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

class SetGame {
    
    let allCards = CardsFactory.createCards()
    var selectedCards = [Card]()
    var presentedCards = [Card]()
    
    init() {
        resetGame()
    }
    
    func turn(_ card: Card) {
        
        if selectedCards.contains(where: { card.id == $0.id }) {
            if selectedCards.count < 3 {
                unselect(card)
            }
        } else {
            select(card)
        }
    }
    
    func select(_ card: Card) {
        if selectedCards.count == 3 {
            turnDownAllChosenCards()
        }
        
        card.select()
        selectedCards.append(card)
    }
    
    func unselect(_ card: Card) {
        card.unselect()
        selectedCards = selectedCards.filter { $0.id != card.id }
    }
    
    func resetGame() {
        
        turnDownAllChosenCards()
        chooseNewCardToPresent()
    }
    
    func turnDownAllChosenCards() {
        for card in selectedCards {
            card.unselect()
            selectedCards = selectedCards.filter { $0.id != card.id }
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
