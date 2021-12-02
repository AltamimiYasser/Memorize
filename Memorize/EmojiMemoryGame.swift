//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yasser Tamimi on 25/11/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = [
        "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚",
        "🚛", "🚜", "🚍", "🚘", "🚖", "🚇", "🚊", "🛵", "🏍", "🛺", "🚨", "🚔"
    ]

    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { emojis[$0] }
    }

    // every time in the model we create a new card we'll pass the index so we can get it from our array here
    @Published private var model = createMemoryGame()
    var cards: [Card] { model.cards }



    // MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
