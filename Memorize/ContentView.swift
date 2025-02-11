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
struct ContentView: View {
    
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
           
        }  .foregroundColor(.green)
        
            .padding()
        
        
        
    }
}
struct CardView: View {
    var isFaceUp: Bool=false
    var body:some View{
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth:2)
                Text("👻")
            }
            else{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.green)
            }
           
        })
       
    }
}

#Preview {
    ContentView()
}
