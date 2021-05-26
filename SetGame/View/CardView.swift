//
//  CardView.swift
//  SetGame
//
//  Created by Admin on 14/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import SwiftUI

struct CardView: View {

    @ObservedObject var viewModel: CardViewModel
    
    var body: some View {
        entireCard
            .rotationEffect(Angle(degrees: (viewModel.cardState == CardState.selected) ? 180 : 0))
            .scaleEffect(viewModel.cardState == CardState.matched ? 1.1 : 1)
            .animation(.easeInOut)
    }
    
    var entireCard: some View {
        ZStack {
            cardSkin
            cardFront
        }
    }
    
    var cardSkin: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(cardBackground())
                .padding(cornerRadius)
                .opacity(0.3)
            RoundedRectangle(cornerRadius: self.cornerRadius)
                .stroke(strockColor(), lineWidth: strockWidth())
                .padding(cornerRadius)
        }
    }

    func cardBackground() -> Color {
        switch viewModel.cardState {
        case .selected:
            return Color.gray
        case .unselected:
            return Color.white
        case .matched:
            return Color.blue
        case .wrongMatch:
            return Color.red
        }
    }
    
    func strockColor() -> Color {
        switch viewModel.cardState {
        case .selected, .unselected:
            return Color.black
        case .matched:
            return Color.blue
        case .wrongMatch:
            return Color.red
        }
    }
    
    func strockWidth() -> CGFloat {
        viewModel.cardState == .unselected ? 1 : 3
    }
    
    var cardFront: some View {
        self.figuresView
            .foregroundColor(self.viewModel.color)
    }
    
    var figuresView: some View {
        return VStack(alignment: .center) {
            ForEach(0..<viewModel.numberOfShapes.rawValue) { _ -> AnyView in
                AnyView(coloredFigureView())
            }
        }.padding(25)
    }
    
    @ViewBuilder
    func coloredFigureView() -> some View {
        switch self.viewModel.shading {
        case .solid:
            figureShape().fill()
        case .open:
            figureShape().stroke(lineWidth: 2)
        case .striped:
            figureShape().fill().opacity(0.2)
        }
        
    }
    
    func figureShape() -> AnyShape {
        switch self.viewModel.setShape {
        case .oval:
            return AnyShape(Capsule())
        case .rectangle:
            return AnyShape(Rectangle())
        case .diamond:
            return AnyShape(Diamond())
        }
    }
    
    // MARK: Drawing Constants

    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = Card(id: 1, numberOfShapes: .two, shape: .oval, shading: .solid, color: .green)
        let viewModel = CardViewModel(model: card)
        return CardView(viewModel: viewModel)
    }
}
