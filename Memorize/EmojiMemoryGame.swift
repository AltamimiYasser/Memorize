//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yasser Tamimi on 25/11/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = [
        "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚",
        "🚛", "🚜", "🚍", "🚘", "🚖", "🚇", "🚊", "🛵", "🏍", "🛺", "🚨", "🚔"
    ]

    static func createMemoryGame(emojis: [String]) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { emojis[$0] }
    }

    // every time in the model we create a new card we'll pass the index so we can get it from our array here
    @Published private var model: MemoryGame<String> = createMemoryGame(emojis: emojis)
    var cards: [MemoryGame<String>.Card] { model.cards }



    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
