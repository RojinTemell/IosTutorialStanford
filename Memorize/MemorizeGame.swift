//
//  MemorizeGame.swift
//  Memorize
//
//  Created by rojin on 24.02.2025.
//

import Foundation

struct MemoryGame<CardContent>{
    var cards:Array<Card>
    func choose (card:Card){

    }
    struct Card{
        var isFaceup:Bool
        var isMatched:Bool
        var content:CardContent
    }

}
