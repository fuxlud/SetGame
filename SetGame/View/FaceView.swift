//
//  FaceView.swift
//  SetGame
//
//  Created by Admin on 14/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import SwiftUI

struct FaceView: View {
    var card: Card
    
    var body: some View {
        List(card.figurs) { figure in
            Capsule()
        }
    }
}

struct FaceView_Previews: PreviewProvider {
    static var previews: some View {
        let card = Card(id: 1, numberOfShapes: .three, shape: .oval, shading: .solid, color: .green)
        return FaceView(card: card)
    }
}