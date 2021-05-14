//
//  SetViewModel.swift
//  SetGame
//
//  Created by Admin on 13/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

class SetViewModel: ObservableObject {
    @Published var model = SetModel()

    var allCards: [Card] {
        model.allCards
    }
    
    var presentedCards: [Card] {
        model.presentedCards
    }
    
    func restartGame() {
        model.restartGame()
    }
    
}
