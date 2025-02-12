//
//  ContentView.swift
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
struct ContentView: View {
    let emojis = ["👻", "🪼", "🧚🏼‍♀️", "🐳", "🪼", "👻", "🪼", "🧚🏼‍♀️", "🐳", "🪼", "👻", "🪼", "🧚🏼‍♀️", "🐳", "🪼", "👻", "🪼", "🧚🏼‍♀️", "🐳"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView{
                cards
            }

            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    var cards:some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum:120)),] ) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3,contentMode: .fit)
            }
        }.foregroundColor(.green)
    }
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder

        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    func cardCountAdjuster( by offset:Int,symbol:String)-> some View{
        Button(action: {
            cardCount += offset

        }, label: {

            Image(systemName:symbol)
        }).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }

    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")

    }
    var cardAdder: some View {
        return cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")

    }

}
struct CardView: View {
    @State var isFaceUp = true
    let content: String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1:0)
            base.fill().opacity(isFaceUp ? 0 : 1)

        }.onTapGesture {
            //  isFaceUp = !isFaceUp
            isFaceUp.toggle()

        }

    }
}

#Preview {
    ContentView()
}
