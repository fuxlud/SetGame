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
       
        ZStack {

            if self.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color("Selected")).padding(10)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: 3).padding(10)
            } else {
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: 1).padding(10)
            }
            cardColoredView
        }
    }
    
    var cardColoredView: some View {
        self.figuresView               .foregroundColor(self.card.color.setColor)
    }
    
    var figuresView: some View {

        return VStack(alignment: .center) {
            ForEach(0..<card.numberOfShapes.rawValue) { _ -> AnyView in
                AnyView(coloredFigureView())
            }
        }.padding(25)
    }
    
    @ViewBuilder
    func coloredFigureView() -> some View {
        switch self.card.shading {
        case .solid:
            figureShape().fill()
        case .open:
            figureShape().stroke(lineWidth: 2)
        case .striped:
            figureShape().fill().opacity(0.2)
        }
        
    }
    
    func figureShape() -> AnyShape {
        switch self.card.shape {
        case .oval:
            return AnyShape(Capsule())
        case .rectangle:
            return AnyShape(Rectangle())
        case .diamond:
            return AnyShape(Circle())
        }
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
