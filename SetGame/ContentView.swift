//
//  ContentView.swift
//  SetGame
//
//  Created by Admin on 13/05/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let cards = CardsFactory.createCards()
    
    var body: some View {
        
        Grid(cards) { card in
            RoundedRectangle(cornerRadius: 5).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
