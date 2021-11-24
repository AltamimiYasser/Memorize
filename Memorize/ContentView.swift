//
//  ContentView.swift
//  Memorize
//
//  Created by Yasser Tamimi on 23/11/2021.
//

import SwiftUI

struct ContentView: View {
    var vehiclesTheme = [
        "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚",
        "🚛", "🚜", "🚍", "🚘", "🚖", "🚇", "🚊", "🛵", "🏍", "🛺", "🚨", "🚔"
    ]
    
    var facesTheme = [
        "😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇",
        "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😛"
    ]
    
    var flagsTheme = [
        "🏳️", "🏴", "🏁", "🚩", "🏳️‍⚧️", "🏴‍☠️", "🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩",
        "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲", "🇦🇼", "🇦🇺", "🇦🇹", "🇦🇿", "🇧🇸", "🇧🇭"
    ]

    @State var emojiCount = 0
    @State var chosenTheme: [String] = []
    
    var minCardSize: CGFloat {
        emojiCount >= 14 ? 65 : 75
    }

    init() {
        _chosenTheme = State(wrappedValue: vehiclesTheme)
        _emojiCount = State(wrappedValue: chosenTheme.count)
    }

    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)

            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: minCardSize))]) {
                    ForEach(chosenTheme[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2 / 3, contentMode: .fit)
                    }
                }
            }
                .foregroundColor(.red)
            Spacer()
            HStack {
                vehiclesButton
                Spacer()
                FacesButton
                Spacer()
                FlagsButton
            }
            .padding(.horizontal)
        }
            .padding(.horizontal)
    }

    var vehiclesButton: some View {
        Button {
            emojiCount = Int.random(in: 8..<vehiclesTheme.count)
            chosenTheme = vehiclesTheme.shuffled()
        } label: {
            ThemeButton(imageName: "car.2", text: "Vehicles")
        }
    }
    
    var FacesButton: some View {
        Button {
            emojiCount = Int.random(in: 8..<facesTheme.count)
            chosenTheme = facesTheme.shuffled()
        } label: {
            ThemeButton(imageName: "face.smiling", text: "Faces")
        }
    }
    
    var FlagsButton: some View {
        Button {
            emojiCount = Int.random(in: 8..<flagsTheme.count)
            chosenTheme = flagsTheme.shuffled()
        } label: {
            ThemeButton(imageName: "flag.slash", text: "Flags")
        }
    }
}


struct ThemeButton: View {
    var imageName: String
    var text: String

    var body: some View {
        VStack {
            Image(systemName: imageName).font(.largeTitle)
            Text(text).font(.body)
        }

    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp = true

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)

            if isFaceUp {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape
            }
        }
            .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
        }
    }
}
