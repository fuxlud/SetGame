//
//  Drawing.swift
//  SetGame
//
//  Created by Admin on 14/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation
import SwiftUI

enum SetShape {
    case diamond
    case rectangle
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
    
    var setColor: (Color) {
        get {
            switch self {
            case .red:
                return Color.red
            case .green:
                return Color.green
            case .purple:
                return Color.purple
            }
        }
    }
}

enum SetNumberOfShapes: Int {
    case one = 1
    case two
    case three
}

enum CardState {
    case unselected
    case selected
    case matched
    case wrongMatch
}

class Card: Identifiable, CustomStringConvertible {
    
    let id: Int
    let shading: Shading
    let color: SetColor
    let shape: SetShape
    let numberOfShapes: SetNumberOfShapes
    var cardState: CardState = .unselected
    
    init(id: Int,
         numberOfShapes: SetNumberOfShapes,
         shape: SetShape,
         shading: Shading,
         color: SetColor) {
        self.id = id
        self.shading = shading
        self.color = color
        self.shape = shape
        self.numberOfShapes = numberOfShapes
    }
    
    func select() {
        self.cardState = .selected
    }
    
    func unselect() {
        self.cardState = .unselected
    }
    
    func markAsMatch() {
        self.cardState = .matched
    }
    
    func markAsNotMatched() {
        self.cardState = .wrongMatch
    }
    
    var description: String {
       return """
 
Shape \(id)
    numberOfShapes - \(numberOfShapes)
    shading - \(shading)
    color - \(color)
    shape - \(shape)
"""
    }
}
