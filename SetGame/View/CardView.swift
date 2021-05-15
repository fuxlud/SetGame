//
//  CardView.swift
//  SetGame
//
//  Created by Admin on 14/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    var isFaceUp: Bool
    var card: Card
    
    var body: some View {
        GeometryReader() { geometry in
            
            FaceView(card: self.card)
                .foregroundColor(self.card.color.setColor)
                .opacity(0.2)
//            if self.isFaceUp {
//                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.blue)
//            } else {
//                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.black)
//            }
        }.padding()
    }
    
    // MARK: Drawing Constants

    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = Card(id: 1, numberOfShapes: .two, shape: .oval, shading: .solid, color: .green)
        return CardView(isFaceUp: true, card: card)
    }
}
