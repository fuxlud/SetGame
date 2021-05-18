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
        
        card.select()
        selectedCards.append(card)
        
        if (selectedCards.count > 3) { //MARK: to delete
            turnDownAllSelectedCards()
        }
        
        if (selectedCards.count == 3) {
            let isSet = checkIfSet()

            if isSet {
                for card in selectedCards{
                    card.markAsMatch()
                }
            } else {
                for card in selectedCards{
                    card.markAsNotMatched()
                }
            }
        }
    }
    
    func unselect(_ card: Card) {
        card.unselect()
        selectedCards = selectedCards.filter { $0.id != card.id }
    }
    
    func checkIfSet() -> Bool {
        let card1 = selectedCards[0]
        let card2 = selectedCards[1]
        let card3 = selectedCards[2]
        
        let equalShading = (card1.shading == card2.shading) && (card2.shading == card3.shading)
        let allDifferentShading = (card1.shading != card2.shading) && (card2.shading != card3.shading) && (card1.shading != card3.shading)
        let shading = equalShading || allDifferentShading
        
        let equalColor = (card1.color == card2.color) && (card2.color == card3.color)
        let allDifferentColor = (card1.color != card2.color) && (card2.color != card3.color) && (card1.color != card3.color)
        let color = equalColor || allDifferentColor
        
        let equalShade = (card1.shape == card2.shape) && (card2.shape == card3.shape)
        let allDifferentShade = (card1.shape != card2.shape) && (card2.shape != card3.shape) && (card1.shape != card3.shape)
        let shade = equalShade || allDifferentShade
        
        let equalNumberOfShapes = (card1.numberOfShapes == card2.numberOfShapes) && (card2.numberOfShapes == card3.numberOfShapes)
        let allDifferentNumberOfShapes = (card1.numberOfShapes != card2.numberOfShapes) && (card2.numberOfShapes != card3.numberOfShapes) && (card1.numberOfShapes != card3.numberOfShapes)
        let numberOfShapes = equalNumberOfShapes || allDifferentNumberOfShapes
        
        let isSet = shading && color && shade && numberOfShapes
        print(isSet)
        return isSet
    }
    
    func resetGame() {
        
        turnDownAllSelectedCards()
        chooseNewCardToPresent()
    }
    
    func turnDownAllSelectedCards() {
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
