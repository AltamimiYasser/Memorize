//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yasser Tamimi on 25/11/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    static func createMemoryGame(emojis: [String], numberOfPairsOfCards: Int) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { emojis[$0] }
    }

    // every time in the model we create a new card we'll pass the index so we can get it from our array here
    @Published private var model: MemoryGame<String>
    var cards: [MemoryGame<String>.Card] { model.cards }
    private(set) var selectedTheme: Theme
    var score: Int { model.score }

    init() {
        self.selectedTheme = Theme.getTheme()
        let numberOfCards = Int.random(in: 8..<selectedTheme.numbersOfPairOfCards)
        self.model = EmojiMemoryGame.createMemoryGame(
            emojis: selectedTheme.emojis,
            numberOfPairsOfCards: numberOfCards)
    }

    // MARK: - Intent(s)
    func startNewGame() {
        self.selectedTheme = Theme.getTheme()
        let numberOfCards = Int.random(in: 8..<selectedTheme.numbersOfPairOfCards)
        self.model = EmojiMemoryGame.createMemoryGame(
            emojis: selectedTheme.emojis,
            numberOfPairsOfCards: numberOfCards)
    }
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
