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
struct ContentView: View {

    var body: some View {
        HStack {
            CardView(isFaceUp: false)
            CardView()
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)

        } .foregroundColor(.green)

            .padding()



    }
}
struct CardView: View {
    @State  var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
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
