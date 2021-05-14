//
//  Card.swift
//  SetGame
//
//  Created by Admin on 13/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

enum Shape {
    case diamond
    case squiggle
    case oval
}

enum Shading {
    case solid
    case striped
    case open
}

enum SetColor {
    case red
    case green
    case purple
}

enum SetNumberOfShapes {
    case one
    case two
    case three
}

class Card: Identifiable {
    let id: Int
    let numberOfShapes: SetNumberOfShapes
    let shape: Shape
    let shading: Shading
    let color: SetColor
    var isFaceUp = false
    
    init(id: Int,
        numberOfShapes: SetNumberOfShapes,
        shape: Shape,
        shading: Shading,
        color: SetColor) {
        
        self.id = id
        self.numberOfShapes = numberOfShapes
        self.shape = shape
        self.shading = shading
        self.color = color
    }
    
    func turnUp() {
        self.isFaceUp = true
    }
    
    func turnDown() {
        self.isFaceUp = false
    }
}
