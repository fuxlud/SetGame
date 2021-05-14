//
//  Card.swift
//  SetGame
//
//  Created by Admin on 13/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation
import SwiftUI

enum Shape {
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

struct Figure: Identifiable {
    let id: Int
    let shape: Shape
    let shading: Shading
    let color: SetColor
}
