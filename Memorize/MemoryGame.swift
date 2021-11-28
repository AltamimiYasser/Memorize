//
//  MemoryGame.swift
//  Memorize
//
//  Created by Yasser Tamimi on 25/11/2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Comparable {
    private(set) var cards: [Card]

    // get all indices of faceUp cards and if it's only one then assign it otherwise set it to nil
    private var indexOfTheOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []

        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }

    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let indexOfPotentialMatch = indexOfTheOnlyFaceUpCard {
                if cards[indexOfPotentialMatch].content == card.content {
                    // we have a match
                    cards[chosenIndex].isMatched = true
                    cards[indexOfPotentialMatch].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
        }
    }

    struct Card: Identifiable {
        let id: Int
        let content: CardContent
        var isFaceUp = false
        var isMatched = false
    }
}

extension Array {
    // one element in the array? return it, other wise return nil
    var oneAndOnly: Element? { count == 1 ? first : nil }
}
