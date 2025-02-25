//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by rojin on 24.02.2025.
//
//access control --private
//init
//{ ( index:Int)->String in
//return  emojies[index]

//}

import SwiftUI
//func createCardContent(forPairAtIndex index:Int)->String{
//    return  emojies[index]
//
//}
//reactive ui :observableobject

class EmojiMemoryGame :ObservableObject {
    private static let emojies = ["👻", "🪼", "🧚🏼‍♀️", "🐳", "🪼", "👻", "🪼", "🧚🏼‍♀️", "🐳", "🪼", "👻", "🪼", "🧚🏼‍♀️", "🐳", "🪼", "👻", "🪼", "🧚🏼‍♀️", "🐳"]
    private static  func createMemoryGame() -> MemoryGame<String>{
        return  MemoryGame(
            numberOfPairsOfCards: 20)
        { pairIndex in
            if emojies.indices.contains(pairIndex){
                return emojies[pairIndex]
            }
            else{
                return "?"
            }


        }
    }

    @Published   private var model=createMemoryGame()

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    // Mark:  Intents
    func shuffle(){
        model.shuffle()

    }

    func choose(_ card:MemoryGame<String>.Card){
        model.choose(card)
    }
}
