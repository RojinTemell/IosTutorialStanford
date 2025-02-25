//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by rojin on 11.02.2025.
//

import SwiftUI
// ":View" --> "ContentView" behaves like a View
// creating instances of structer exm.-->Text("Hello, ROJİN!")
// named parametres exm.-->
// parametres defaults exm.-->
//@ViewBuilder
//TupleView (bag of Lego)
//view modifier
//shape:Circle, Rectangle,RoundedRentangle(you need to use cornerRadius)
//stack:VStack,ZStack,HStack
//*****Lecture 2*****
//trailing closure syntax
//locals in @ViewBuilder
// let vs var : "let" we cant change is constant, "var" likes mark in somethşing fo changing
// type inderences var amount:Int
// ontapgesture
//views are immutable
//@state create pointer , piece of memory where it keeps(like isFaceUp) pointer never change , point changes
//array
//alternate array notation
//Array<String>==[String]
//foreach -- range-arguments to closures(0..<4 ==emojis.indices)
//button
//image system name
//implicit return
// func
// external vs internal parametre names
//scrollview
//access control --private
struct EmojiMemoryGameView: View {
    @ObservedObject  var viewmodel:EmojiMemoryGame
    var body: some View {
        VStack {
            ScrollView{
                cards
            }
            Button("Shuffle"){
                viewmodel.shuffle()
            }
            .padding()

        }

    }
    var cards:some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum:90),spacing: 0),] ,spacing: 0) {
            ForEach(viewmodel.cards.indices, id: \.self) { index in
                CardView(viewmodel.cards[index])
                    .aspectRatio(2/3,contentMode: .fit)
                    .padding(4)
            }
        }.foregroundColor(.orange)
    }



}
struct CardView: View {
    let card:MemoryGame<String>.Card
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1,contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1:0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewmodel:EmojiMemoryGame())
    }
}
