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
        
        Grid(viewModel.presentedCards) { card in
            RoundedRectangle(cornerRadius: 5).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SetViewModel()
        return SetView(viewModel: viewModel)
    }
}
