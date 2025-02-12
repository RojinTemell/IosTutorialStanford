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
struct ContentView: View {
    let emojis = [ "👻","🪼","🧚🏼‍♀️","🐳"]
    var body: some View {
      
        HStack {
            ForEach(emojis.indices,id: \.self){index in
                CardView(content:emojis[index])
            }
           

        } .foregroundColor(.green)

            .padding()



    }
}
struct CardView: View {
    @State  var isFaceUp = true
    let content:String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            else {
                base.fill()

            }

        }.onTapGesture {
          //  isFaceUp = !isFaceUp
            isFaceUp.toggle()
            
        }

    }
}

#Preview {
    ContentView()
}
