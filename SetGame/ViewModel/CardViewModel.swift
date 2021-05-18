//
//  CardViewModel.swift
//  SetGame
//
//  Created by Luda Fux on 18/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation
import SwiftUI

class CardViewModel: ObservableObject {
    @Published var card: Card
    
    init(model: Card) {
        self.card = model
    }
    
    var shading: Shading {
        card.shading
    }
    
    var color: Color {
        card.color.setColor
    }
    
    var numberOfShapes: SetNumberOfShapes {
        card.numberOfShapes
    }
    
    var setShape: SetShape {
        card.shape
    }
    
    var cardState: CardState {
        card.cardState
    }
    
    func choose() {
        objectWillChange.send()
        card.select()
    }
}
