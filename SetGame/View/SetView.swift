//
//  ContentView.swift
//  SetGame
//
//  Created by Admin on 13/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import SwiftUI

struct SetView: View {
    @ObservedObject var viewModel: SetViewModel
    
    var body: some View {
        ZStack{
            
            if #available(iOS 14.0, *) {
                Color("Selected").ignoresSafeArea()
            } else {
                // Fallback on earlier versions
            }
        VStack() {
            HStack(alignment: .bottom) {
                Text("Score: 100")
                Button("Reset Game", action: {
                    self.viewModel.resetGame()
                })
            }
            
            Divider()
            
                Grid(viewModel.presentedCards) { card in
                    CardView(isFaceUp: card.isFaceUp, card: card).onTapGesture {
                        self.viewModel.choose(card: card)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SetViewModel()
        return SetView(viewModel: viewModel)
    }
}
