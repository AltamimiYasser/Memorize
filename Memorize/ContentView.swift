//
//  ContentView.swift
//  Memorize
//
//  Created by Yasser Tamimi on 23/11/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2 / 3, contentMode: .fit)
                            .onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                }
            }
            .foregroundColor(Color(viewModel.selectedTheme.color))
                .padding(.horizontal)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Score: \(viewModel.score)")
                            .font(.headline)
                    }
                    ToolbarItem(placement: .principal) {
                        Text("\(viewModel.selectedTheme.name.uppercased())")
                            .font(.largeTitle)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.startNewGame()
                        } label: {
                            Text("New")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(8)
                        }

                    }
                }
        }
    }

}

struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)

            if card.isFaceUp {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
            ContentView(viewModel: game)
        }
    }
}
