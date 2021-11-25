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
        // can't get card, already faceUp or already matched? exit early
        guard
            let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
            else { return }
        
        // we have the only card that is faceUp?
        if let indexOfPotentialMatch = indexOfTheOnlyFaceUpCard {
            matchCards(indexOfPotentialMatch, card, chosenIndex)
            indexOfTheOnlyFaceUpCard = nil
        } else {
            turnAllCardsDown()
            indexOfTheOnlyFaceUpCard = chosenIndex
        }
        // then flip it
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    mutating func matchCards(_ indexOfPotentialMatch: Int, _ card: MemoryGame<CardContent>.Card, _ chosenIndex: Array<MemoryGame<CardContent>.Card>.Index) {
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
    }
    
    mutating func turnAllCardsDown() {
        for i in cards.indices {
            cards[i].isFaceUp = false
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
