//
//  Drawing.swift
//  SetGame
//
//  Created by Admin on 14/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation



class Card: Identifiable {
    let id: Int
    let shading: Shading
    let color: SetColor
    let figurs: [Figure]
    var isFaceUp = false
    
    init(id: Int,
         numberOfShapes: SetNumberOfShapes,
         shape: Shape,
         shading: Shading,
         color: SetColor) {
        self.id = id
        self.shading = shading
        self.color = color
        
        var figurs = [Figure]()
        for i in 0..<numberOfShapes.rawValue {
            let figure = Figure(id: i, shape: shape)
            figurs.append(figure)
        }
        self.figurs = figurs
    }
    
    func turnUp() {
        self.isFaceUp = true
    }
    
    func turnDown() {
        self.isFaceUp = false
    }
}
