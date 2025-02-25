//
//  MemorizeApp.swift
//  Memorize
//
//  Created by rojin on 11.02.2025.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewmodel: game)
        }
    }
}
