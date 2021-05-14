enum SetNumberOfShapes: Int {
    case one = 1
    case two
    case three
}

struct CardsFactory {
    
    static func createCards() -> [Card] {
        let card1 = Card(id: 1, numberOfShapes: .one, shape: .oval, shading: .solid, color: .green)
        let card2 = Card(id: 2, numberOfShapes: .one, shape: .oval, shading: .solid, color: .purple)
        let card3 = Card(id: 3, numberOfShapes: .one, shape: .oval, shading: .solid, color: .red)
        let card4 = Card(id: 4, numberOfShapes: .one, shape: .oval, shading: .open, color: .green)
        let card5 = Card(id: 5, numberOfShapes: .one, shape: .oval, shading: .open, color: .purple)
        let card6 = Card(id: 6, numberOfShapes: .one, shape: .oval, shading: .open, color: .red)
        let card7 = Card(id: 7, numberOfShapes: .one, shape: .oval, shading: .striped, color: .green)
        let card8 = Card(id: 8, numberOfShapes: .one, shape: .oval, shading: .striped, color: .purple)
        let card9 = Card(id: 9, numberOfShapes: .one, shape: .oval, shading: .striped, color: .red)
        let card10 = Card(id: 10, numberOfShapes: .two, shape: .oval, shading: .solid, color: .green)
        let card11 = Card(id: 11, numberOfShapes: .two, shape: .oval, shading: .solid, color: .purple)
        let card12 = Card(id: 12, numberOfShapes: .two, shape: .oval, shading: .solid, color: .red)
        let card13 = Card(id: 13, numberOfShapes: .two, shape: .oval, shading: .open, color: .green)
        let card14 = Card(id: 14, numberOfShapes: .two, shape: .oval, shading: .open, color: .purple)
        let card15 = Card(id: 15, numberOfShapes: .two, shape: .oval, shading: .open, color: .red)
        let card16 = Card(id: 16, numberOfShapes: .two, shape: .oval, shading: .striped, color: .green)
        let card17 = Card(id: 17, numberOfShapes: .two, shape: .oval, shading: .striped, color: .purple)
        let card18 = Card(id: 18, numberOfShapes: .two, shape: .oval, shading: .striped, color: .red)
        let card19 = Card(id: 19, numberOfShapes: .three, shape: .oval, shading: .solid, color: .green)
        let card20 = Card(id: 20, numberOfShapes: .three, shape: .oval, shading: .solid, color: .purple)
        let card21 = Card(id: 21, numberOfShapes: .three, shape: .oval, shading: .solid, color: .red)
        let card22 = Card(id: 22, numberOfShapes: .three, shape: .oval, shading: .open, color: .green)
        let card23 = Card(id: 23, numberOfShapes: .three, shape: .oval, shading: .open, color: .purple)
        let card24 = Card(id: 24, numberOfShapes: .three, shape: .oval, shading: .open, color: .red)
        let card25 = Card(id: 25, numberOfShapes: .three, shape: .oval, shading: .striped, color: .green)
        let card26 = Card(id: 26, numberOfShapes: .three, shape: .oval, shading: .striped, color: .purple)
        let card27 = Card(id: 27, numberOfShapes: .three, shape: .oval, shading: .striped, color: .red)
        
        return [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20, card21, card22, card23, card24, card25, card26, card27]
    }
}
