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
    @State var degree = Angle.degrees(0)

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 110 - 90))
                    .padding(5).opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false))
                    .font(.system(size: 32))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }

    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (constants.fontSize / constants.fontScale)
    }

    private enum constants {
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 32
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
