//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Yasser Tamimi on 23/11/2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
