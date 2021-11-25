//
//  MemoryGame.swift
//  Memorize
//
//  Created by Yasser Tamimi on 25/11/2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Comparable {
    private(set) var cards: [Card]

    private var indexOfTheOnlyFaceUpCard: Int?
    private(set) var score = 0

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()

        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }

    mutating func choose(_ card: Card) {
        // get the card and check it's not faceUp or matched already
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            // we have the only card that is faceUp?
            if let indexOfPotentialMatch = indexOfTheOnlyFaceUpCard {
                // check if the only faceUp card is matching the chosenCard
                if cards[indexOfPotentialMatch].content == card.content {
                    // we have a match
                    cards[chosenIndex].isMatched = true
                    cards[indexOfPotentialMatch].isMatched = true
                    score += 2
                } else {
                    if cards[chosenIndex].isSeen {
                        score -= 1
                    }
                    if cards[indexOfPotentialMatch].isSeen {
                        score -= 1
                    }
                    cards[chosenIndex].isSeen = true
                    cards[indexOfPotentialMatch].isSeen = true
                }
                // set the index of the only faceUp card to nil because we already have 2 faceUp
                indexOfTheOnlyFaceUpCard = nil
            } else {
                // turn all card to face down
                for i in cards.indices {
                    cards[i].isFaceUp = false
                }
                // when we turn all cards to facedown we set the chosen card as the onlyFaceUpCard
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
            // then flip it
            cards[chosenIndex].isFaceUp.toggle()
        }
    }

    struct Card: Identifiable {
        let id: Int
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        var isSeen = false
    }
}
