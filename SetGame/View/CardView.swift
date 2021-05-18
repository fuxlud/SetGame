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
       
        ZStack {
            switch viewModel.cardState {
            case .matched:
                matchedCard
            case .selected:
                selectedCard
            case .unselected:
                regularCard
            case .wrongMatch:
                wrongMatch
            }
            
            cardColoredView
        }
    }
    
    var regularCard: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white).padding(cornerRadius)
            RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: 1).padding(cornerRadius)
        }
    }

    var matchedCard: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.blue)
                .padding(cornerRadius)
                .opacity(0.3)
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.blue, lineWidth: edgeLineWidth)
                .padding(cornerRadius)
        }
    }
    
    var wrongMatch: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.red)
                .padding(cornerRadius)
                .opacity(0.3)
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.red, lineWidth: edgeLineWidth)
                .padding(cornerRadius)
        }
    }
    
    var selectedCard: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.gray).padding(cornerRadius)
            RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth).padding(cornerRadius)
        }
    }
    
    var cardColoredView: some View {
        self.figuresView               .foregroundColor(self.viewModel.color)
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
