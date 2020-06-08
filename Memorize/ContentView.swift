//
//  ContentView.swift
//  Memorize
//
//  Created by Javier Contreras on 5/27/20.
//  Copyright © 2020 Javier Contreras. All rights reserved.
//


//THIS IS THE VIEW IN MVVM


import SwiftUI

//struct name: specifying that it behaves like a view
struct EmojiMemoryGameView: View {
    
    var viewModel: EmojiMemoryGame
    
    //also called a property
    //var name: type
    /*
     curly bracket means that the code gets executed every time it is called,
     it is not stored in memory.
     "some" acts like a templated var in C++, lets the compiler figure it out
     */
    var body: some View {
        return HStack{
            
            if EmojiMemoryGame.numberOfPairs < 5 {
                ForEach(viewModel.cards) { card in
                    //combining both views
                    CardView(card: card).onTapGesture {
                        self.viewModel.choose(card: card)
                    }
                }
                .font(Font.largeTitle)
            } else {
                ForEach(viewModel.cards) { card in
                    //combining both views
                    CardView(card: card).onTapGesture {
                        self.viewModel.choose(card: card)
                    }
                }
                .font(Font.title)
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}


//provides glue between the code and preview onthe right
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
