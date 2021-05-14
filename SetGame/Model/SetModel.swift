//
//  SetModel.swift
//  SetGame
//
//  Created by Admin on 14/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

struct SetModel {
    let allCards = CardsFactory.createCards()
    var chosenCards = [Card]()
    var presentedCards = [Card]()
    
    init() {
        restartGame()
    }
    
    mutating func restartGame() {
        while presentedCards.count != 12 {
            if let randomCard = allCards.randomElement(),
                !presentedCards.contains(where: { randomCard.id == $0.id }) {
                    presentedCards.append(randomCard)
            }
        }
    }
}
