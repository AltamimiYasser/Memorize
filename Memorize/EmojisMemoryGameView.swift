//
//  EmojisMemoryGameView.swift
//  Memorize
//
//  Created by Yasser Tamimi on 23/11/2021.
//

import SwiftUI

struct EmojisMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame

    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2 / 3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                    game.choose(card)
                }
            }
        }
            .foregroundColor(.red)
            .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: constants.cornerRadius)

                if card.isFaceUp {
                    shape.foregroundColor(.white)
                    shape.strokeBorder(lineWidth: constants.borderLineWidth)
                    Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 110 - 90))
                        .padding(5).opacity(0.5)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape
                }
            }
        }
    }

    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * constants.fontScale)
    }

    private struct constants {
        static let cornerRadius: CGFloat = 10
        static let borderLineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return Group {
            EmojisMemoryGameView(game: game)
                .preferredColorScheme(.dark)
            EmojisMemoryGameView(game: game)
        }
    }
}
